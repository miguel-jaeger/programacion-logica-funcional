prefijo :: [Double] -> [String]
prefijo montos = fmap (("S/ " ++) . show) montos

main :: IO ()
main = do   
    putStrLn "Ingrese los montos separados por espacios (ej: 10.5 20.0 35.0):"
    entrada <- getLine
    let montosIngresados = map read (words entrada) :: [Double]
    let montosConPrefijo = prefijo montosIngresados
    putStrLn "Montos con prefijo:"
    print montosConPrefijo

    putStrLn "Presione una tecla para salir..."
    _ <- getLine
    return ()