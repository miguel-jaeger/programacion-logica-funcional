{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import Data.Aeson (ToJSON, FromJSON(parseJSON), encode, decode, withObject, (.:), (.:?))
import GHC.Generics (Generic)
import Network.HTTP.Conduit (simpleHttp, parseRequest, method, requestBody, RequestBody(RequestBodyLBS), httpLbs)
import Network.HTTP.Client (newManager)
import Network.HTTP.Client.TLS (tlsManagerSettings)
import qualified Data.ByteString.Char8 as B8
import qualified Data.ByteString.Lazy.Char8 as LBS
import qualified Data.Maybe as Maybe
import System.IO (hFlush, stdout)

-------------------------------------------------------------------------------
-- CONFIGURACIÓN Y MODELOS ACOPLADOS A TU APPLIACIÓN SPRING-FIRESTORE
-------------------------------------------------------------------------------

firebaseURL :: String
firebaseURL = "https://firestore.googleapis.com/v1/projects/gestion-usuarios-d40a6/databases/(default)/documents/usuario"

newtype StringValue = StringValue { stringValue :: String }
    deriving (Show, Generic)

-- Tipos de datos mapeados EXACTAMENTE igual a los campos de tu JSON
data Campos = Campos
    { nombre     :: StringValue
    , apellido   :: StringValue
    , correo     :: StringValue
    , contrasena :: StringValue
    , rol        :: StringValue
    , idPersona  :: StringValue
    } deriving (Show, Generic)

data DocumentoFirestore = DocumentoFirestore
    { fields :: Campos
    } deriving (Show, Generic)

-- Instancias de Serialización (Escritura)
instance ToJSON StringValue
instance ToJSON Campos
instance ToJSON DocumentoFirestore

-- Instancias de Deserialización Manual (Lectura estricta basada en tu payload)
instance FromJSON StringValue where
    parseJSON = withObject "StringValue" $ \v -> StringValue <$> v .: "stringValue"

instance FromJSON Campos where
    parseJSON = withObject "Campos" $ \v -> Campos
        <$> v .: "nombre"
        <*> v .: "apellido"
        <*> v .: "correo"
        <*> v .: "contrasena"
        <*> v .: "rol"
        <*> v .: "idPersona"

data DocumentoRespuesta = DocumentoRespuesta
    { fieldsRes :: Maybe Campos
    } deriving (Show, Generic)

instance FromJSON DocumentoRespuesta where
    parseJSON = withObject "DocumentoRespuesta" $ \v -> DocumentoRespuesta <$> v .:? "fields"

data ListaDocumentos = ListaDocumentos
    { documents :: Maybe [DocumentoRespuesta]
    } deriving (Show, Generic)

instance FromJSON ListaDocumentos where
    parseJSON = withObject "ListaDocumentos" $ \v -> ListaDocumentos <$> v .:? "documents"

-------------------------------------------------------------------------------
-- FUNCIONES AUXILIARES DE RED
-------------------------------------------------------------------------------

prompt :: String -> IO String
prompt text = do
    putStr text
    hFlush stdout
    getLine

enviarPeticion :: String -> String -> LBS.ByteString -> IO Int
enviarPeticion url tipoMetodo cuerpo = do
    manager <- newManager tlsManagerSettings
    reqInicial <- parseRequest url
    let request = reqInicial 
            { method = B8.pack tipoMetodo
            , requestBody = RequestBodyLBS cuerpo
            }
    _ <- httpLbs request manager
    return 0

-------------------------------------------------------------------------------
-- OPERACIONES CRUD (FIRESTORE)
-------------------------------------------------------------------------------

-- 1. AGREGAR USUARIO (CREATE)
agregarUsuario :: IO ()
agregarUsuario = do
    putStrLn "\n--- Registro de Nuevo Usuario en Cloud Firestore ---"
    idp  <- prompt "ID Persona (Código único alfanumérico): "
    nom  <- prompt "Nombre: "
    ape  <- prompt "Apellido: "
    corr <- prompt "Correo Electrónico: "
    pass <- prompt "Contraseña: "
    uRol <- prompt "Rol (USER / ADMIN): "
    
    let userDoc = DocumentoFirestore (Campos (StringValue nom) (StringValue ape) (StringValue corr) (StringValue pass) (StringValue uRol) (StringValue idp))
        url = firebaseURL ++ "?documentId=" ++ idp
        cuerpo = encode userDoc
    
    res <- enviarPeticion url "POST" cuerpo
    if res == 0 
        then putStrLn "Usuario insertado correctamente en Firestore."
        else putStrLn "Error al insertar el registro."

-- 2. LISTAR USUARIOS (READ)
listarUsuarios :: IO ()
listarUsuarios = do
    putStrLn "\n--- DATOS EN CLOUD FIRESTORE ---"
    jsonRespuesta <- simpleHttp firebaseURL
    
    case (decode jsonRespuesta :: Maybe ListaDocumentos) of
        Nothing -> putStrLn "Error: Estructura JSON incompatible con el modelo de Haskell."
        Just (ListaDocumentos Nothing) -> putStrLn "La colección 'usuario' está vacía."
        Just (ListaDocumentos (Just docs)) -> do
            let documentosValidos = filter (Maybe.isJust . fieldsRes) docs
            if null documentosValidos
                then putStrLn "Se encontraron documentos, pero las llaves internas no corresponden a tu modelo."
                else mapM_ imprimirDoc docs
  where
    imprimirDoc doc = case fieldsRes doc of
        Nothing -> return ()
        Just c  -> putStrLn $ "ID: " ++ stringValue (idPersona c) 
                           ++ " | " ++ stringValue (nombre c) ++ " " ++ stringValue (apellido c)
                           ++ " | Correo: " ++ stringValue (correo c)
                           ++ " | Rol: " ++ stringValue (rol c)

-- 3. ACTUALIZAR USUARIO (UPDATE)
actualizarUsuario :: IO ()
actualizarUsuario = do
    putStrLn "\n--- Actualizar Información de Usuario ---"
    idp  <- prompt "Ingrese el ID Persona del usuario a modificar: "
    nom  <- prompt "Nuevo Nombre: "
    ape  <- prompt "Nuevo Apellido: "
    corr <- prompt "Nuevo Correo: "
    pass <- prompt "Nueva Contraseña: "
    uRol <- prompt "Nuevo Rol: "

    let userDoc = DocumentoFirestore (Campos (StringValue nom) (StringValue ape) (StringValue corr) (StringValue pass) (StringValue uRol) (StringValue idp))
        url = firebaseURL ++ "/" ++ idp
        cuerpo = encode userDoc

    res <- enviarPeticion url "PATCH" cuerpo
    if res == 0 
        then putStrLn "Documento modificado correctamente en Firestore."
        else putStrLn "Error al intentar actualizar."

-- 4. ELIMINAR USUARIO (DELETE)
eliminarUsuario :: IO ()
eliminarUsuario = do
    putStrLn "\n--- Eliminar Usuario de Firestore ---"
    idp <- prompt "Ingrese el ID Persona del usuario que desea eliminar: "

    let url = firebaseURL ++ "/" ++ idp
    res <- enviarPeticion url "DELETE" LBS.empty
    if res == 0 
        then putStrLn "Usuario eliminado de forma definitiva."
        else putStrLn "Error al intentar eliminar el registro."

-------------------------------------------------------------------------------
-- MENÚ INTERACTIVO
-------------------------------------------------------------------------------

ejecutarMenu :: IO ()
ejecutarMenu = do
    putStrLn "\n**************************************"
    putStrLn "  SISTEMA DE GESTION HASKELL-FIRESTORE"
    putStrLn "**************************************"
    putStrLn "1 - Agregar nuevo usuario"
    putStrLn "2 - Listar usuarios"
    putStrLn "3 - Actualizar usuario"
    putStrLn "4 - Eliminar usuario"
    putStrLn "5 - Salir"
    opcion <- prompt "Seleccione una opcion: "
    
    case opcion of
        "1" -> agregarUsuario >> ejecutarMenu
        "2" -> listarUsuarios >> ejecutarMenu
        "3" -> actualizarUsuario >> ejecutarMenu
        "4" -> eliminarUsuario >> ejecutarMenu
        "5" -> putStrLn "Cerrando aplicación..."
        _   -> putStrLn "Opcion no valida, intente de nuevo." >> ejecutarMenu

main :: IO ()
main = do
    ejecutarMenu
    putStrLn "Sistema finalizado."