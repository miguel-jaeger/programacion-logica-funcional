
-- Transforma el texto en una lista de IDs activos, ignorando errores y el 0
procesarSQL :: [Int] -> [(Int, String)]
procesarSQL ids = 
     map (\id -> if id > 0 
                then (id, "ACTIVO") 
                else (id, "INACTIVO")) ids 

persistirFichero :: String -> IO ()
persistirFichero ids = do
    let lineaTxt = "ID: " ++ ids ++ "\n"
    --let lineaCsv = nombre ++ "," ++ codigo ++ "," ++ correo ++ "\n"
    appendFile "lista-ids.txt" lineaTxt
    --appendFile "backup.csv" lineaCsv
    putStrLn " Datos respaldados en TXT "                

main :: IO ()
main = do
    putStrLn "Ingrese IDs separados por espacios (ej: 1 3 5 0 hola):"
    --hFlush stdout
    datosRaw <- getLine 
    let ids = map read (words datosRaw) :: [Int]
    
    let datosExternos = procesarSQL ids
    putStrLn $ "Reporte de Base de Datos (Post-Procesamiento):"
    print datosExternos -- Ejemplo: [(1,"ACTIVO"),(3,"ACTIVO")]

    persistirFichero (show datosExternos)
    
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()