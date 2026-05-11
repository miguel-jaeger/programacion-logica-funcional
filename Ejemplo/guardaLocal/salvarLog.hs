import System.IO

-- 1. Definimos la lógica de persistencia
persistirLocal :: String -> String -> IO ()
persistirLocal nombre dni = do
    let linea = "Nombre: " ++ nombre ++ " | DNI: " ++ dni ++ "\n"
    appendFile "usuarios_local.txt" linea
    putStrLn "Datos guardados en el archivo local."

-- 2. El punto de entrada obligatorio
main :: IO ()
main = do
    putStrLn "--- SISTEMA DE PERSISTENCIA LOCAL ---"
    putStr "Ingrese Nombre: "
    hFlush stdout -- Limpieza de búfer para asegurar que el mensaje se muestre antes de la entrada
    nombre <- getLine
    
    putStr "Ingrese DNI: "
    hFlush stdout
    dni <- getLine
    
    persistirLocal nombre dni
    putStrLn "Proceso finalizado."