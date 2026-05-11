-- Definición de la función mult
mult :: Int -> Int -> Int
mult x y = x * y

-- Proceso de evaluación Call-By-Value: mult (1+2, 2+3)
-- 1. Se evalúa el primer parámetro: 1 + 2 = 3
-- 2. Se evalúa el segundo parámetro: 2 + 3 = 5
-- 3. Se aplica la función estricta: 3 * 5 = 15
evaluacionCBV :: Int
evaluacionCBV = mult (1 + 2) (2 + 3)

main :: IO ()
main = do
    putStrLn $ "Evaluación paso a paso:"
    putStrLn $ "mult (1 + 2, 2 + 3) [por def. de +]"
    putStrLn $ "mult (3, 2 + 3) [por def. de +]"
    putStrLn $ "mult (3, 5)"
    putStrLn $ "3 * 5"
    putStrLn $ "15--"
    putStrLn $ "El resultado final es: " ++ show evaluacionCBV
    putStrLn $ "¡Evaluación completa!"
    putStrLn "Presione una tecla para terminar..."
    _ <- getLine
    return ()

