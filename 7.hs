invertir :: [a] -> [a]
invertir []     = []
invertir (x:xs) = invertir xs ++ [x]  -- Uso de concatenación
main :: IO ()
main = do
    let lista = [1, 2, 3, 4, 5]
    let listaInvertida = invertir lista
    putStrLn $ "La lista invertida es: " ++ show listaInvertida