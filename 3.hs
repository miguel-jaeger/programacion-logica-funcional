miLongitud :: [a] -> Int
miLongitud []     = 0                             -- Caso Base
miLongitud (_:xs) = 1 + miLongitud xs             -- Caso Recursivo

main :: IO ()
main = do
    let lista = [1, 2, 3, 4, 5]
    let longitud = miLongitud lista
    putStrLn $ "La longitud de la lista es: " ++ show longitud