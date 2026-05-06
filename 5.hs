multiplicarLista :: [Int] -> Int
multiplicarLista lista = foldl (*) 1 lista   -- 1 es la identidad 
main :: IO ()
main = do
    let lista = [1, 2, 3, 4, 5]
    let resultado = multiplicarLista lista
    putStrLn $ "El producto de la lista es: " ++ show resultado