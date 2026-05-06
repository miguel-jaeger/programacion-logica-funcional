sumarTres :: [Int] -> Int
sumarTres (x:y:z:_) = x + y + z
sumarTres _         = 0
main :: IO ()
main = do
    let numeros = [1, 2, 3, 4, 5]
    let resultado = sumarTres numeros
    putStrLn $ "La suma de los tres primeros números es: " ++ show resultado