contar :: [Int] -> Int
contar [] = 0
contar (_:xs) = 1 + contar xs

main :: IO ()
main = do
    putStrLn "Ingrese una lista de números enteros separados por espacios:"
    input <- getLine
    let lista = map read (words input) :: [Int]
    putStrLn $ "Lista: " ++ show lista
    putStrLn $ "Cantidad de elementos: " ++ show (contar lista)