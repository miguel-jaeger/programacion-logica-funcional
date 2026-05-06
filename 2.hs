sumar :: [Int] -> Int
sumar [] = 0
sumar (x:xs) = x + sumar xs

main :: IO ()
main = do
    putStrLn "Ingrese una lista de números enteros separados por espacios:"
    input <- getLine
    let datos = map read (words input) :: [Int]
    putStrLn $ "Suma total: " ++ show (sumar datos)
    putStrLn $ "Cantidad de elementos: " ++ show (length datos)
    putStrLn $ "Promedio: " ++ show (fromIntegral (sumar datos) / fromIntegral (length datos) :: Double)
    putStrLn $ "Máximo: " ++ show (maximum datos)
    putStrLn $ "Mínimo: " ++ show (minimum datos)
    putStrLn("Presione una tecla para continuar...")    
    _ <- getLine
    return ()
