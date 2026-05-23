clasificarTemperatura :: Double -> String
clasificarTemperatura t
    | t < 0     = "Bajo cero"
    | t >= 0 && t < 15 = "Frío"
    | t >= 15 && t < 25 = "Templado"
    | t >= 25 && t < 35 = "Caliente"
    | otherwise = "Muy caliente"
main :: IO ()
main = do
    putStrLn "Ingrese la temperatura en grados Celsius:"    
    input <- getLine
    let temperatura = read input :: Double
    let clasificacion = clasificarTemperatura temperatura
    putStrLn $ "La temperatura es: " ++ clasificacion
    return ()
    
