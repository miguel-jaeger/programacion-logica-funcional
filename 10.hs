invertir :: [a] -> [a]
invertir [] = []
invertir (x:xs) = invertir xs ++ [x]

main :: IO ()
main = do
    putStrLn "Ingrese una lista de elementos separados por espacios:"
    input <- getLine
    let lista = map read (words input) :: [Int] 
    putStrLn $ "Lista original: " ++ show lista
    putStrLn $ "Lista invertida: " ++ show (invertir lista)
    putStrLn("Presione una tecla para continuar...")    
    _ <- getLine
    return ()