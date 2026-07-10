pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False                 -- Caso base
pertenece x (y:ys)
    | x == y    = True                 -- Éxito (Poda la búsqueda restante)
    | otherwise = pertenece x ys       -- Backtracking manual

main :: IO ()
main = do
    --    let elemento = 3
    putStrLn "Diga elemento a buscar"
    input <- getLine
    let elemento = read input :: Int

    putStrLn("Diga lista de elementos")
    input1<-getLine
    let lista= read input1::[Int]

    let msg= if pertenece elemento lista 
            then "Si"
            else "No" 

    --    let lista = [1, 2, 3, 4, 5]
    putStrLn $ "¿El elemento " ++ show elemento ++ " pertenece a la lista? " ++  msg
