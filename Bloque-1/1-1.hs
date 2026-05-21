clasificarTemperatura :: Double -> String
clasificarTemperatura t
    | t < 15 = "Frío"
    | t <= 25 = "Templado"
    | otherwise = "Cálido"
main :: IO ()
main = do
    putStrLn "Ingrese la temperatura en grados Celsius:"    
    input <- getLine
    let temperatura = read input :: Double
    let clasificacion = clasificarTemperatura temperatura
    putStrLn $ "La temperatura es: " ++ clasificacion
    return ()
    
