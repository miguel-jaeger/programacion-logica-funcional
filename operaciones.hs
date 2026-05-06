main :: IO ()
main = do
    putStrLn "Ingrese el primer número:"
    n1 <- getLine

    putStrLn "Ingrese el segundo número:"
    n2 <- getLine

    putStrLn "Ingrese la operación (+, -, *, /):"
    op <- getLine

    let a = read n1 :: Double
        b = read n2 :: Double
        resultado =
            case op of
                "+" -> a + b
                "-" -> a - b
                "*" -> a * b
                "/" -> a / b
                _   -> 0

    putStrLn ("Resultado: " ++  show resultado)
    putStrLn "Presiona Enter para finalizar..."
    _ <- getLine
    return ()
