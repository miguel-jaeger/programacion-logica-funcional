resto :: Integer -> Integer -> Integer 
resto x y | x < y     = x
          | otherwise = resto (x - y) y
main :: IO ()
main = do
    putStrLn "--- Resta recursiva ---"
    putStrLn "Ingrese el primer numero: "
    num1 <- getLine
    putStrLn "Ingrese el segundo numero: "
    num2 <- getLine
    let resultado = resto (read num1) (read num2)
    putStrLn $ "El resultado es: " ++ show resultado
    putStrLn "Presione enter para finalizar..."
    _ <- getLine
    return ()