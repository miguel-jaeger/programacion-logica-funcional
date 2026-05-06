primerUltimo :: [Float] -> (Float, Float)
primerUltimo xs = (head xs, last xs)

reversaPrecios :: [Float] -> [Float]
reversaPrecios xs = reverse xs

main :: IO ()
main = do
    let precios = [10.5, 20.0, 15.75, 30.0]
    let (primerPrecio, ultimoPrecio) = primerUltimo precios
    putStrLn $ "Primer precio: " ++ show primerPrecio
    putStrLn $ "Último precio: " ++ show ultimoPrecio
    let preciosReversos = reversaPrecios precios
    putStrLn $ "Precios en reversa: " ++ show preciosReversos