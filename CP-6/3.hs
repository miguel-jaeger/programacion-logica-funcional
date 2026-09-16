precios = [10.5, 20.0, 35.0]
preciosNuevos = fmap (* 1.10) precios

main :: IO ()
main = do
    putStrLn "Precios originales:"
    print precios
    putStrLn "Precios con aumento del 10%:"
    print preciosNuevos