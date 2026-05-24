-- Habilita la Interfaz de Funciones Foráneas (FFI) para permitir llamadas a librerías de C
{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign.C.Types (CInt(..), CULong(..))
import Foreign.C.String          -- Para convertir Strings de Haskell a char* de C
import Foreign.Ptr               -- Para manejar punteros de memoria
import Foreign.Marshal.Array     -- Para manipular arreglos de punteros (filas de la DB)
import System.IO                 -- Para gestionar la entrada/salida y limpieza de búfer
import Control.Monad (when)      -- Para ejecutar acciones condicionales de forma limpia

-------------------------------------------------------------------------------
-- SECCIÓN FFI: Definición de "puentes" hacia la DLL de MySQL
-------------------------------------------------------------------------------

-- Inicializa la estructura de datos de conexión de MySQL
foreign import ccall "mysql_init" mysql_init :: Ptr () -> IO (Ptr ())

-- Corregir mysql_real_connect (los dos últimos argumentos numéricos cambian)
foreign import ccall "mysql_real_connect" mysql_real_connect 
    :: Ptr () -> CString -> CString -> CString -> CString -> CInt -> CString -> CULong -> IO (Ptr ())

-- Corregir mysql_query (el retorno de C siempre es un entero de 32 bits)
foreign import ccall "mysql_query" mysql_query :: Ptr () -> CString -> IO CInt

-- Cierra la conexión y libera los recursos del sistema
foreign import ccall "mysql_close" mysql_close :: Ptr () -> IO ()

-- Almacena el resultado de una consulta (SELECT) en la memoria del cliente
foreign import ccall "mysql_store_result" mysql_store_result :: Ptr () -> IO (Ptr ())

-- Recupera la siguiente fila del conjunto de resultados
foreign import ccall "mysql_fetch_row" mysql_fetch_row :: Ptr () -> IO (Ptr CString)

-- Devuelve el número de columnas (campos) de una consulta
foreign import ccall "mysql_num_fields" mysql_num_fields :: Ptr () -> IO Int

-- Libera la memoria ocupada por los resultados de una consulta SELECT
foreign import ccall "mysql_free_result" mysql_free_result :: Ptr () -> IO ()

-------------------------------------------------------------------------------
-- FUNCIONES AUXILIARES Y LÓGICA DE NEGOCIO
-------------------------------------------------------------------------------

-- Función para interactuar con el usuario: muestra texto y espera entrada
prompt :: String -> IO String
prompt text = do
    putStr text
    hFlush stdout -- Fuerza la salida del texto antes de esperar la entrada
    getLine

-- 1. AGREGAR USUARIO (CREATE)
agregarUsuario :: Ptr () -> IO ()
agregarUsuario mysql = do
    putStrLn "\n--- Registro de Nuevo Usuario ---"
    nom  <- prompt "Nombre: "
    ape  <- prompt "Apellido: "
    documento <- prompt "DNI: "
    
    let sql = "INSERT INTO usuario (nombre, apellido, dni) VALUES ('" ++ nom ++ "', '" ++ ape ++ "', '" ++ documento ++ "')"
    c_sql <- newCString sql
    res <- mysql_query mysql c_sql
    
    if res == 0 
        then putStrLn "Usuario guardado exitosamente."
        else putStrLn "Error al insertar registro."

-- 2. LISTAR USUARIOS (READ)
listarUsuarios :: Ptr () -> IO ()
listarUsuarios mysql = do
    putStrLn "\n--- DATOS EN LA BASE DE DATOS ---"
    c_sql <- newCString "SELECT nombre, apellido, dni FROM usuario"
    res <- mysql_query mysql c_sql
    
    if res /= 0 
        then putStrLn "Error al consultar."
        else do
            resPtr <- mysql_store_result mysql
            when (resPtr /= nullPtr) $ do
                numFields <- mysql_num_fields resPtr
                imprimirFilas resPtr numFields
                mysql_free_result resPtr

-- Función recursiva para imprimir filas
imprimirFilas :: Ptr () -> Int -> IO ()
imprimirFilas resPtr nFields = do
    rowPtr <- mysql_fetch_row resPtr
    when (rowPtr /= nullPtr) $ do
        columnas <- peekArray nFields rowPtr
        datos <- mapM (\cStr -> if cStr == nullPtr then return "NULL" else peekCString cStr) columnas
        putStrLn $ "Usuario: " ++ (datos !! 0) ++ " " ++ (datos !! 1) ++ " | DNI: " ++ (datos !! 2)
        imprimirFilas resPtr nFields

-- 3. ACTUALIZAR USUARIO (UPDATE)
actualizarUsuario :: Ptr () -> IO ()
actualizarUsuario mysql = do
    putStrLn "\n--- Actualizar Información de Usuario ---"
    documento <- prompt "Ingrese el DNI del usuario a modificar: "
    nuevoNom  <- prompt "Nuevo Nombre: "
    nuevoApe  <- prompt "Nuevo Apellido: "

    let sql = "UPDATE usuario SET nombre = '" ++ nuevoNom ++ "', apellido = '" ++ nuevoApe ++ "' WHERE dni = '" ++ documento ++ "'"
    c_sql <- newCString sql
    res <- mysql_query mysql c_sql

    if res == 0 
        then putStrLn "Registro actualizado correctamente."
        else putStrLn "Error al intentar actualizar."

-- 4. ELIMINAR USUARIO (DELETE)
eliminarUsuario :: Ptr () -> IO ()
eliminarUsuario mysql = do
    putStrLn "\n--- Eliminar Usuario ---"
    documento <- prompt "Ingrese el DNI del usuario que desea eliminar: "

    let sql = "DELETE FROM usuario WHERE dni = '" ++ documento ++ "'"
    c_sql <- newCString sql
    res <- mysql_query mysql c_sql

    if res == 0 
        then putStrLn "Usuario eliminado exitosamente."
        else putStrLn "Error al intentar eliminar el registro."

-------------------------------------------------------------------------------
-- FLUJO DE CONTROL: Menú y Main
-------------------------------------------------------------------------------

ejecutarMenu :: Ptr () -> IO ()
ejecutarMenu mysql = do
    putStrLn "\n***********************************"
    putStrLn "   SISTEMA DE GESTION HASKELL-MYSQL"
    putStrLn "***********************************"
    putStrLn "1 - Agregar nuevo usuario"
    putStrLn "2 - Listar usuarios"
    putStrLn "3 - Actualizar usuario"
    putStrLn "4 - Eliminar usuario"
    putStrLn "5 - Salir"
    opcion <- prompt "Seleccione una opcion: "
    
    case opcion of
        "1" -> agregarUsuario mysql >> ejecutarMenu mysql
        "2" -> listarUsuarios mysql >> ejecutarMenu mysql
        "3" -> actualizarUsuario mysql >> ejecutarMenu mysql
        "4" -> eliminarUsuario mysql >> ejecutarMenu mysql
        "5" -> putStrLn "Cerrando sesion..."
        _   -> putStrLn "Opcion no valida, intente de nuevo." >> ejecutarMenu mysql

main :: IO ()
main = do
    mysql <- mysql_init nullPtr
    
    h  <- newCString "127.0.0.1"
    u  <- newCString "root"
    p  <- newCString "" 
    db <- newCString "haskell_db"
    
    -- Le indicamos explícitamente a Haskell que trate los números como Int normales antes del casteo a C
    conn <- mysql_real_connect mysql h u p db (fromIntegral (3306 :: Int)) nullPtr (fromIntegral (0 :: Int))
    
    if conn == nullPtr
        then putStrLn "Error crítico: No se pudo conectar a MySQL."
        else do
            ejecutarMenu mysql
            mysql_close mysql
            putStrLn "Sistema finalizado."