cambioMoneda::[Int]->[String]
cambioMoneda = fmap (("S/ " ++) . show . (* 3.8) . fromIntegral)

main :: IO ()
main = do   
    putStrLn "Ingrese los valores en Dólares (separados por espacios):"
    entrada <- getLine
    let valoresDolares = map read (words entrada) :: [Int]
    let valoresSoles = cambioMoneda valoresDolares
    putStrLn "Valores convertidos a soles:"
    print valoresSoles
    putStrLn "Presione una tecla para salir..."
    _ <- getLine
    return ()   