evaluarPedido :: Float -> String
evaluarPedido x
    | x < 0          = error "Monto negativo no valido" 
    | x <= 20.0      = "Consumo Económico"
    | x > 20 && x < 60 = "Consumo Estándar"
    | otherwise      = "Consumo Premium"

main :: IO ()
main = do
    putStrLn "Ingrese el monto del pedido:"
    input <- getLine
    let monto = read input :: Float
    let categoria = evaluarPedido monto
    putStrLn ("El monto del pedido es: " ++ show monto)
    putStrLn ("La categoria del pedido es: " ++ categoria)
    putStrLn "Presiona Enter para finalizar..."
    getLine_ <- getLine
    return ()