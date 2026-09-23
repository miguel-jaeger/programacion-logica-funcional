-- Función recursiva que separa una lista en (pares, impares)
separar :: [Int] -> ([Int], [Int])
separar [] = ([], [])  -- CASO BASE: Listas vacías para una entrada vacía 
separar (x:xs)
    | mod x 2 == 0 = (x : pares, impares) -- Si es par, se une a la lista de pares
    | otherwise    = (pares, x : impares) -- Si es impar, se une a la de impares
    where
        (pares, impares) = separar xs -- Llamada recursiva para procesar el resto (reducción)

main :: IO ()
main = do
    putStrLn "Ingrese una lista de números enteros separados por espacios:"
    input <- getLine
    let numeros = map read (words input) :: [Int]   
    let (p, i) = separar numeros
    
    putStrLn "--- Clasificador de Números UTP ---"
    putStrLn $ "Lista original: " ++ show numeros
    putStrLn $ "Lista de Pares:   " ++ show p
    putStrLn $ "Lista de Impares: " ++ show i
    putStrLn "Presione enter para finalizar..."
    _ <- getLine
    return ()
