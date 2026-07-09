prioridad :: [(String, Int)]
prioridad = [("Salud", 10), ("Alimentos", 25)]

esDespachable :: String -> Int -> Bool
esDespachable categoria stock
    | stock <= 0 = False
    | otherwise  = case lookup categoria prioridad of
        Just cantidadPrioridad -> stock <= cantidadPrioridad  
        Nothing -> False

main :: IO ()
main = do
    --let categoriaProducto = "Alimentos"
    putStrLn "Diga el producto"
    input<-getLine
    let categoriaProducto =input

    --let stockProducto = 10
    putStrLn "Diga stock solicitado"
    input2<-getLine
    let stockProducto =read input2::Int
   

    let msg = if esDespachable categoriaProducto stockProducto
                then "Si"
                else "No"
    putStrLn $ "¿El producto es despachable? " ++ msg