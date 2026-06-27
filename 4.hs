soloPares :: [Int] -> [Int]
soloPares [] = []
soloPares (x:xs)
    | mod x 2 == 0 = x : soloPares xs
    | otherwise    = soloPares xs

main :: IO ()
main = do
    putStrLn "Ingrese una lista de números enteros separados por espacios:"
    input <- getLine 
    let lista = map read (words input) :: [Int]
    putStrLn $ "Lista original: " ++ show lista
    putStrLn $ "Lista de números pares: " ++ show (soloPares lista)
    putStrLn("Presione una tecla para continuar...")    
    _ <- getLine
    return ()

