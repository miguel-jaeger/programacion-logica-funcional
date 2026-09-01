main = do
    putStrLn "Ingrese una lista de números enteros"
    entrada <- getLine
    let lista = read entrada :: [Int]
    
    putStrLn $ "Lista original: " ++ show lista
    putStrLn $ "head " ++ show lista ++ " es " ++ show (head lista)
    putStrLn $ "tail " ++ show lista ++ " es " ++ show (tail lista)
    putStrLn $ "last " ++ show lista ++ " es " ++ show (last lista)
    
    let ultimo = last lista
    putStrLn $ "ÚLTIMO + 5 es " ++ show (ultimo + 5)
    
    putStrLn $ "init " ++ show lista ++ " es " ++ show (init lista)
    putStrLn $ "length " ++ show lista ++ " es " ++ show (length lista)
    putStrLn $ "null " ++ show lista ++ " es " ++ show (null lista)
    putStrLn $ "otra forma de null " ++ show lista ++ " es " ++ if length lista == 0 then "True" else "False"
    putStrLn $ "reverse " ++ show lista ++ " es " ++ show (reverse lista)
    putStrLn $ "drop " ++ show lista ++ " es " ++ show (drop (length lista) lista)
    putStrLn $ "maximum " ++ show lista ++ " es " ++ show (maximum lista)
    
    let jalados = filter (<11) lista
    putStrLn $ "filter " ++ show lista ++ " es " ++ show (filter (<11) lista) ++ " La cantidad de jalados es " ++ show (length jalados)
    
    let n = 0
    putStrLn $ "xs !! n " ++ show n ++ " es " ++ show (lista !! n)
    putStrLn $ "elem 5 lista " ++ show lista ++ " es " ++ show (elem 5 lista)