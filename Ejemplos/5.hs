prioridad = ["Salud", "Alimentos"]

esDespachable :: String -> Int -> Bool
esDespachable categoria stock
    | stock <= 0 = False                               -- Poda (Control de búsqueda)
    | otherwise  = any (== categoria) prioridad        -- Búsqueda en lista de hechos
main :: IO ()
main = do
    let categoriaProducto = "Alimentos"
    let stockProducto = 0
    putStrLn $ "¿El producto es despachable? " ++ show (esDespachable categoriaProducto stockProducto)