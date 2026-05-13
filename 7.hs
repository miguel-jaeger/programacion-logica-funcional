invertir :: [a] -> [a]
invertir []     = []
invertir (x:xs) = invertir xs ++ [x]  -- Uso de concatenación

-- variante con foldr
invertirFold :: [a] -> [a]
invertirFold xs = foldr (:) [] xs

main :: IO ()
main = do
    --let lista = [1, 2, 3, 4, 5]
    putStrLn "Escriba la lista de numeros separadas por espacios:"
    input <- getLine
    let lista = map read (words input) :: [Int]
    let listaInvertida = invertir lista
    putStrLn $ "La lista invertida es: " ++ show listaInvertida