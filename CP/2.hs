validarPedido :: Float -> String
validarPedido x
    | x <= 0    = error "Monto invalido"
    | x > 100   = "Plato Gourmet"
    | otherwise = "Plato Estandar"

main :: IO ()
main = do
    -- Pedir el monto del pedido por teclado
    putStrLn "Ingrese el monto del pedido:"
    input <- getLine
    let monto = read input :: Float
    let tipoPedido = validarPedido monto
    putStrLn $ "El pedido es: " ++ tipoPedido
    putStrLn "Presione enter para finalizar..."
    _ <- getLine
    return ()