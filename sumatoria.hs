sumarLista :: [Int] -> Int
sumarLista []     = 0
sumarLista (x:xs) = x + sumarLista xs

main :: IO ()
main = do
    putStrLn "Ingrese una lista de números enteros separados por espacios:"
    inputLista <- getLine
    let lista = read (inputLista) :: [Int]
   -- let lista = map read (words inputLista) :: [Int]

    let suma = sumarLista lista
    putStrLn ("La suma de los números en la lista es: " ++ show suma)