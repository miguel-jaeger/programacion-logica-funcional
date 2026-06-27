producto :: [Int] -> Int
producto [] = 1
producto (x:xs) = x * producto xs

main :: IO ()
main = do
    putStrLn "Ingrese una lista de números enteros separados por espacios:"
    input <- getLine
    let lista = map read (words input) :: [Int]
    putStrLn $ "Lista: " ++ show lista
    putStrLn $ "Producto: " ++ show (producto lista)  
    putStrLn("Presione una tecla para continuar...")
    _ <- getLine
    return ()
