calcularAreaRectangulo :: Int -> Int -> Int
calcularAreaRectangulo base altura = base * altura

main :: IO ()
main = do
    putStrLn "Ingrese la base del rectángulo:"
    inputBase <- getLine
    let base = read inputBase :: Int

    putStrLn "Ingrese la altura del rectángulo:"
    inputAltura <- getLine
    let altura = read inputAltura :: Int

    let area = calcularAreaRectangulo base altura
    putStrLn ("El área del rectángulo es: " ++ show area)
