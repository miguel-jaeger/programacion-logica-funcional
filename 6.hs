fibonacci 0 = 0 
fibonacci 1 = 1 
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Generación de serie usando listas por comprensión
main = do
    putStrLn "Cantidad de numeros:"
    input <- getLine
    let n = read input :: Int -- Convertir la entrada a un número entero
    print [fibonacci x | x <- [0..n]]
