import Data.Maybe

-- Definición de la lista de precios directamente con sus valores (Just o Nothing)
-- En Haskell, las listas son colecciones homogéneas[cite: 16, 21].
precios :: [Maybe Double]
precios = [Just 100.0, Nothing, Just 50.0, Just 120.5, Nothing]

-- Aplicamos el impuesto (1.18) a cada elemento usando map y fmap
-- map recorre la lista y fmap aplica la operación dentro del contexto Maybe[cite: 66].
preciosConImpuesto :: [Maybe Double]
preciosConImpuesto = map (fmap (* 1.18)) precios

main :: IO ()
main = do
    putStrLn "--- Listado de Precios Finales (Incluye 18% de impuesto) ---"
    print preciosConImpuesto
    
    -- Opcional: Mostrar solo los valores que no son nulos
    putStrLn "\nPrecios válidos para facturación:"
    print (catMaybes preciosConImpuesto)
