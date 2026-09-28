miLongitud :: [a] -> Int
miLongitud []     = 0                             -- Caso Base
miLongitud (_:xs) = 1 + miLongitud xs             -- Caso Recursivo

main :: IO ()
main = do
    --let lista = [1, 2, 3, 4, 5]
    putStrLn "Escriba la lista de numeros separadas por espacios:"
    input <- getLine
    let lista = map read (words input) :: [Int]
    let longitud = miLongitud lista
    putStrLn $ "La longitud de la lista es: " ++ show longitud