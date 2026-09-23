sumatoria :: Integer -> Integer -> Integer
sumatoria a b
    | a < b     = a + sumatoria (a + 1) b
    | a == b    = b
    | otherwise = error "Rango inválido"

main :: IO ()
main = do
    putStrLn "Ingrese el valor de a:"
    inputA <- getLine
    let a = read inputA
    putStrLn "Ingrese el valor de b:"
    inputB <- getLine
    let b = read inputB
    putStrLn $ "La sumatoria de " ++ show a ++ " a " ++ show b ++ " es: " ++ show (sumatoria a b)
    putStrLn("Presione una tecla para continuar...")    
    _ <- getLine
    return ()

