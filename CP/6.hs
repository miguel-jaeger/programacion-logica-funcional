-- Potencia recursiva
potencia :: Int -> Int -> Int
potencia _ 0 = 1 -- Caso base
potencia a b = a * potencia a (b - 1) -- Caso recursivo

fibonacci :: Int -> Int
fibonacci 0 = 0 -- Caso base
fibonacci 1 = 1 -- Caso base
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2) -- Caso recursivo


-- Main interactivo
main :: IO ()
main = do
    putStrLn "Ingrese n para Fibonacci:"
    entrada1 <- getLine
    let n1 = read entrada1 :: Int
    putStrLn $ "Resultado Fibonacci: " ++ show (fibonacci n1)
    putStrLn "Ingrese a y b para Potencia (a^b):"
    entrada2 <- getLine
    let n2 = read entrada2 :: Int
    let resultadoPotencia = potencia n2 n1
    putStrLn $ "Resultado Potencia: " ++ show resultadoPotencia
    putStrLn "Presione enter para finalizar..."
    _ <- getLine
    return ()

