duplicarResto :: [Int] -> [Int]
--duplicarResto lista = [x * 2 | x <- tail lista]
duplicarResto lista = [x * 2 | x <- drop 1 lista]
main :: IO ()
main = do
    putStrLn "Ingrese una lista de números enteros separados por espacios:"    
    input <- getLine
    let numeros = map read (words input) :: [Int]
    let resultado = duplicarResto numeros
    putStrLn $ "El resultado de duplicar el resto de la lista es: " ++ show resultado
    return ()