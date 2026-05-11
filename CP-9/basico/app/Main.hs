{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign.C.String          -- Para convertir Strings de Haskell a char* de C
import Foreign.Ptr               -- Para manejar punteros de memoria
import System.IO                 -- Para gestionar la entrada/salida y limpieza de búfer

-- Inicializa la estructura de datos de conexión de MySQL
foreign import ccall "mysql_init" mysql_init :: Ptr () -> IO (Ptr ())

-- Establece la conexión física con el servidor (Host, User, Pass, DB, Port...)
foreign import ccall "mysql_real_connect" mysql_real_connect 
    :: Ptr () -> CString -> CString -> CString -> CString -> Int -> CString -> Int -> IO (Ptr ())

-- Cierra la conexión y libera los recursos del sistema
foreign import ccall "mysql_close" mysql_close :: Ptr () -> IO ()

-- Envía una sentencia SQL al servidor para su ejecución
foreign import ccall "mysql_query" mysql_query :: Ptr () -> CString -> IO Int

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
    --- Datos hardcodeados
    let nom  = "pepe luis"
    let ape  =  "Lazo dominguez"
    let documento = "11111112"
   
    --Datos ingresados por el usuario
    {-nom  <- prompt "Nombre: "
    ape  <- prompt "Apellido: "
    documento <- prompt "DNI: "-}

    let sql = "INSERT INTO usuario (nombre, apellido, dni) VALUES ('" ++ nom ++ "', '" ++ ape ++ "', '" ++ documento ++ "')"
    c_sql <- newCString sql
    res <- mysql_query mysql c_sql
    
    if res == 0 
        then putStrLn "Usuario guardado exitosamente."
        else putStrLn "Error al insertar registro."

main :: IO ()
main = do
    mysql <- mysql_init nullPtr
    
    h  <- newCString "127.0.0.1"
    u  <- newCString "root"
    p  <- newCString "" 
    db <- newCString "haskell_db"
    
    conn <- mysql_real_connect mysql h u p db 3306 nullPtr 0

    if conn == nullPtr
        then putStrLn "Error crítico: No se pudo conectar a MySQL."
        else do
            agregarUsuario mysql
            mysql_close mysql
            putStrLn "Sistema finalizado."