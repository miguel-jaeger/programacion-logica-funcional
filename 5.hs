multiplicarLista :: [Int] -> Int
multiplicarLista lista = foldl (*) 1 lista   -- 1 es la identidad 

-- Variante con recursión
multiplicarListaRec :: [Int] -> Int
multiplicarListaRec []     = 1
multiplicarListaRec (x:xs) = x * multiplicarListaRec xs

main :: IO ()
main = do
    --let lista = [1, 2, 3, 4, 5]
    putStrLn "Escriba la lista de numeros separadas por espacios:"
    input <- getLine
    let lista = map read (words input) :: [Int]
    let resultado = multiplicarLista lista
    putStrLn $ "El producto de la lista es: " ++ show resultado