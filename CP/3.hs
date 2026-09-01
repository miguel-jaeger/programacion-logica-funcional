sumaConsumo :: [Float] -> Float
sumaConsumo []     = 0                 -- Caso base 
sumaConsumo (x:xs) = x + sumaConsumo xs -- Caso recursivo

main :: IO ()
main = do
    -- ingresar consumos por teclado    
    putStrLn "Ingrese los consumos separados por espacios:"
    input <- getLine
    let consumos = map read (words input) :: [Float]
    -- calcular el total de los consumos
    -- let consumos = [10.5, 20.0, 15.75, 30.0]
    let totalConsumo = sumaConsumo consumos
    putStrLn $ "El total del consumo es: " ++ show totalConsumo 