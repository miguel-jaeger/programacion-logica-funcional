filtrarNegativos :: [Double] -> [Double]
filtrarNegativos montos = filter (< 0.0) montos
main :: IO ()
main = do
    let montos = [100.0, -50.0, 200.0, -30.0, 150.0]
    print $ filtrarNegativos montos  -- Output: [-50.0, -30.0]