sucesor::Int->Int
sucesor n = n + 1

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)


main::IO()
main = do   
    putStrLn "Ingrese un número entero:"
    input <- getLine
    let n = read input :: Int
    let resultado = sucesor n
    let factorialResultado = factorial resultado
   
    putStrLn ("El sucesor de " ++ show n ++ " es: " ++ show resultado)
    putStrLn ("El factorial de " ++ show resultado ++ " es: " ++ show factorialResultado)
    putStrLn "Presiona Enter para finalizar..."
    _ <- getLine
    return ()
    