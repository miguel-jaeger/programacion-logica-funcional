longitudes :: [String]-> [Int]
longitudes palabras= fmap length palabras 

main :: IO ()
main = do
    putStrLn "Ingrese palabras separadas por espacios:"
    entrada <- getLine
    let palabras = words entrada
    let longitudesPalabras = longitudes palabras
    putStrLn "Longitudes de las palabras:"
    print longitudesPalabras
    putStrLn "Presione una tecla para salir..."
    _ <- getLine
    return ()