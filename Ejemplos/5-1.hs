prioridad :: [(String, Int)]
prioridad = [("Salud", 10), ("Alimentos", 5)]

esDespachable :: String -> Int -> Bool
esDespachable categoria stock
    | stock <= 0 = False
    | otherwise  = case lookup categoria prioridad of
        Just cantidadPrioridad -> stock <= cantidadPrioridad  
        Nothing -> False

main :: IO ()
main = do
    let categoriaProducto = "Alimentos"
    let stockProducto = 10
    let msg = if esDespachable categoriaProducto stockProducto
                then "Si"
                else "No"
    putStrLn $ "¿El producto es despachable? " ++ msg