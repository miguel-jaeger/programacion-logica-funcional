import System.IO

persistirHibrido :: String -> String ->String-> IO ()
persistirHibrido nombre codigo correo = do
    let lineaTxt = "Nombre: " ++ nombre ++ " | Codigo: " ++ codigo ++ " | Correo: " ++ correo ++ "\n"
    --let lineaCsv = nombre ++ "," ++ codigo ++ "," ++ correo ++ "\n"
    appendFile "usuarios_local.txt" lineaTxt
    --appendFile "backup.csv" lineaCsv
    putStrLn " Datos respaldados en TXT "


main :: IO ()
main = do    
    putStrLn "Ingrese su nombre:"
    --hFlush stdout
    nombre <- getLine
    putStrLn "Ingrese su código:"
    --hFlush stdout
    codigo <- getLine
    putStrLn "Ingrese su correo:"
    --hFlush stdout
    correo <- getLine
    persistirHibrido nombre codigo correo
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()