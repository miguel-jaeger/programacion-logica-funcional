productoLista :: [Int] -> Int
productoLista []     = 1
productoLista (x:xs) = x * productoLista xs

main :: IO ()
main = do
    putStrLn "Ingrese una lista de números enteros separados por espacios:"
    inputLista <- getLine
    let lista = read (inputLista) :: [Int]
   -- let lista = map read (words inputLista) :: [Int]

    let producto = productoLista lista
    putStrLn ("El producto de los números en la lista es: " ++ show producto)   