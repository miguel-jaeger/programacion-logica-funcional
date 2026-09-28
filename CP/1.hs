-- Variante 1: Sumar los tres primeros números de una lista
sumarTres :: [Int] -> Int
sumarTres (x:y:z:_) = x + y + z
sumarTres _         = 0

-- Variante 2: Sumar los tres primeros números de una lista utilizando foldl
sumarTresPrimerosAlt :: [Int] -> Int
sumarTresPrimerosAlt xs
    | length xs >= 3 = sum (take 3 xs)
    | otherwise      = 0

main :: IO ()
main = do
    --let numeros = [1, 2, 3, 4, 5]
    putStrLn "Escriba la lista de numeros separadas por espacios:"
    input <- getLine
    let numeros = map read (words input) :: [Int]
    let resultado = sumarTres numeros
    putStrLn $ "La suma de los tres primeros números es: " ++ show resultado