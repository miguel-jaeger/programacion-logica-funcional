-- Regla: Si el precio es mayor a 100, aplicar descuento del 10%
aplicarDescuento :: Double -> Double
aplicarDescuento p = if p > 100 then p * 0.9 else p

actualizarTodo :: [Double] -> [Double]
actualizarTodo lista = map aplicarDescuento lista 
main :: IO ()
main = do
    let precios = [50.0, 120.0, 80.0, 200.0]
    let preciosActualizados = actualizarTodo precios
    putStrLn "Precios Actualizados con Descuento:"
    print preciosActualizados   