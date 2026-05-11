import System.IO

persistirHibrido :: String -> String -> IO ()
persistirHibrido nombre dni = do
    let lineaTxt = "Nombre: " ++ nombre ++ " | DNI: " ++ dni ++ "\n"
    let lineaCsv = nombre ++ "," ++ dni ++ "\n"
    appendFile "usuarios_local.txt" lineaTxt
    appendFile "backup.csv" lineaCsv
    putStrLn " Datos respaldados en TXT y CSV."
main :: IO ()
main = do    
    putStrLn "Ingrese su nombre:"
    hFlush stdout
    nombre <- getLine
    putStrLn "Ingrese su DNI:"
    hFlush stdout
    dni <- getLine
    persistirHibrido nombre dni
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()