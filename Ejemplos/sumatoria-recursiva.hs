-- Función para calcular la sumatoria entre un rango cerrado [a, b]
sumatoria :: Integer -> Integer -> Integer
sumatoria a b
    | a < b     = a + sumatoria (a + 1) b -- CASO RECURSIVO: Reducción del problema
    | a == b    = b                       -- CASO BASE: Condición de parada
    | otherwise = error "El primer argumento debe ser menor o igual al segundo" -- Robustez

main :: IO ()
main = do
    putStrLn "--- SUMATORIA RECURSIVA ---"
    putStrLn "Ingrese el valor inicial (a):"
    linea1 <- getLine
    putStrLn "Ingrese el valor final (b):"
    linea2 <- getLine
    
    putStrLn $ "La sumatoria desde " ++ show linea1 ++ " hasta " ++ show linea2 ++ " es: " ++ show (sumatoria (read linea1) (read linea2))
    putStrLn "Presione enter para finalizar..."
    _ <- getLine
    return ()