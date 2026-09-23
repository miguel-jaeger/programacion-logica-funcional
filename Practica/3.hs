incLista :: [Integer] -> [Integer]
incLista [] = []
incLista (x:xs) = (x + 5) : incLista xs

main :: IO ()
main = do
    putStrLn "Ingrese una lista de números enteros separados por espacios:"
    input <- getLine
    let lista = map read (words input) :: [Integer]
    putStrLn $ "Lista original: " ++ show lista
    putStrLn $ "Lista incrementada: " ++ show (incLista lista)
    putStrLn("Presione una tecla para continuar...")    
    _ <- getLine
    return ()

