ingresarNotas :: IO [Int]
ingresarNotas = do
    putStrLn "Ingrese nota (negativo para terminar):"
    input <- getLine
    let n = read input :: Int
    if n < 0 then return [] -- Caso Base
    else do
        resto <- ingresarNotas -- Caso Recursivo
        return (n : resto)

main = do
    notas <- ingresarNotas
    putStrLn ("Notas ingresadas: " ++ show notas)
    putStrLn $ "Promedio: " ++ show (sum notas `div` length notas)
    putStrLn $ "Nota más alta: " ++ show (maximum notas)
    putStrLn $ "Nota más baja: " ++ show (minimum notas)

    putStrLn "Presione una tecla para salir..."
    _ <- getLine
    return ()

