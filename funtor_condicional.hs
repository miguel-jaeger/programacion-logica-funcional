-- 1. Datos del menú (Just representa precio, Nothing representa Agotado)
plato1, plato2 :: Maybe Float
plato1 = Just 25.0
plato2 = Nothing

-- 2. Uso de Funtor: Aplicar IGV (18%) sin importar si el valor es Just o Nothing
-- fmap aplicará la función si hay un valor, de lo contrario mantendrá Nothing
precioFinal1 = fmap (* 1.18) plato1
precioFinal2 = fmap (* 1.18) plato2

main :: IO ()
main = do
    putStrLn "--- Calculadora de Precios Segura ---"
    putStrLn $ "Precio Plato 1 (con IGV): " ++ show precioFinal1
    putStrLn $ "Precio Plato 2 (con IGV): " ++ show precioFinal2
    putStrLn "Nota: Si es Nothing, el programa no colapsa."
    _ <- getLine
    return ()