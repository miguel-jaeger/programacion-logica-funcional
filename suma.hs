sumarDosPrimeros :: [Int] -> Int
sumarDosPrimeros (x:y:_) = x + y
sumarDosPrimeros _       = 0 -- Manejo de error si hay menos de 2 elementos en la lista
main :: IO ()
main = do
    --let numeros = [3, 5, 7, 9]
    let numeros = []
    putStrLn "Escriba la lista de numeros separadas por espacios:"
    input <- getLine
    let numeros = map read (words input) :: [Int]
    let resultado = sumarDosPrimeros numeros
    putStrLn $ "La suma de los dos primeros números es: " ++ show resultado