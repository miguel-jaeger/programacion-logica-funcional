menuVenta :: Float -> IO ()
menuVenta total = do
    putStrLn $ "Cuenta actual: S/ " ++ show total
    putStrLn "Seleccione una opcion:"
    putStrLn "1. Sumar Plato (S/ 25) "
    putStrLn "2. Sumar Bebida (S/ 5)"
    putStrLn "0. Pagar"
    putStrLn "------------------------------------------------------"
    opcion <- getLine
    case opcion of
        "1" -> menuVenta (total + 25) -- Recursión Directa 
        "2" -> menuVenta (total + 5)
        "0" -> putStrLn "Gracias por su visita." -- Caso Base 
        _   -> do 
            putStrLn "Opcion invalida, intente de nuevo."
            menuVenta total -- Mantiene el estado anterior

main :: IO ()
main = do
    putStrLn "Bienvenido al sistema de ventas del restaurante"
    menuVenta 0.0
    putStrLn "Presiona Enter para finalizar..."
    _ <- getLine 
    return ()