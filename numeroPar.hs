esPar :: Int -> Bool
esPar n = (n `mod` 2) == 0

main :: IO ()
main = do
    putStrLn "Ingrese un número entero:"
    inputNumero <- getLine
    let numero = read inputNumero :: Int

    if esPar numero
        then putStrLn (show numero ++ " es un número par.")
        else putStrLn (show numero ++ " es un número impar.")   