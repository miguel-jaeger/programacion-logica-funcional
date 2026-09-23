obtenerMax :: [Int] -> Int
obtenerMax [x] = x
obtenerMax (x:xs) = max x (obtenerMax xs)

main :: IO ()
main = do
    putStrLn "Ingrese una lista de números enteros separados por espacios:"
    input <- getLine
    let lista = map read (words input) :: [Int]
    putStrLn $ "Lista: " ++ show lista
    putStrLn $ "Máximo: " ++ show (obtenerMax lista)
    putStrLn("Presione una tecla para continuar...")
    _ <- getLine
    return ()