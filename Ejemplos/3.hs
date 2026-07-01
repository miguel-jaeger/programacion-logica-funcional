pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False                 -- Caso base
pertenece x (y:ys)
    | x == y    = True                 -- Éxito (Poda la búsqueda restante)
    | otherwise = pertenece x ys       -- Backtracking manual

main :: IO ()
main = do
        let elemento = 3
        let lista = [1, 2, 3, 4, 5]
        putStrLn $ "¿El elemento " ++ show elemento ++ " pertenece a la lista? " ++ show (pertenece elemento lista)