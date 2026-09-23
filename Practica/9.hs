existe :: Int -> [Int] -> Bool
existe _ [] = False
existe n (x:xs)
    | n == x    = True
    | otherwise = existe n xs

main :: IO ()
main = do
    putStrLn "Ingrese una lista de números enteros separados por espacios:"
    input <- getLine
    let miLista = map read (words input) :: [Int]   
    putStrLn "Ingrese un número para verificar su existencia en la lista:"
    numInput <- getLine
    let num = read numInput
    putStrLn $ "Lista: " ++ show miLista
    putStrLn $ "¿El número " ++ show num ++ " existe en la lista? " ++ show (existe num miLista)
    putStrLn("Presione una tecla para continuar...")
    _ <- getLine
    return ()

