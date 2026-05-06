-- Definición de la función fibonacci
-- Recibe un Int (posición) y devuelve un Integer (valor)
fibonacci :: Int -> Integer
fibonacci 0 = 0  -- Caso base 1
fibonacci 1 = 1  -- Caso base 2
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2) -- Definición recursiva

-- Función para generar una lista de los primeros 'n' números
generarSerie :: Int -> [Integer]
generarSerie n = [fibonacci x | x <- [0..n]]

main :: IO ()
main = do
    putStrLn "Ingrese cuántos números de la serie desea ver:"
    input <- getLine
    let n = read input :: Int
    putStrLn ("Serie Fibonacci: " ++ show (generarSerie n))
    putStrLn "Presiona Enter para finalizar..."
    _ <- getLine
    return ()