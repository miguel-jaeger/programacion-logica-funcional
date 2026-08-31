preciosMenu :: [Float]
preciosMenu = [10.5, 20.0, 15.75, 30.0, 25.0, 18.0]
-- 1. Filtrado
platosCaros = filter (> 20.0) preciosMenu

-- 2. Máximos y mínimos
caro = maximum preciosMenu
barato = minimum preciosMenu

-- 3. Existencia
existePlato = elem 18.0 preciosMenu

main :: IO ()
main = do
    putStrLn $ "Platos caros: " ++ show platosCaros
    putStrLn $ "Precio más caro: " ++ show caro
    putStrLn $ "Precio más barato: " ++ show barato
    putStrLn $ "Existe plato con precio 18.0: " ++ show existePlato

    putStrLn "Presione enter para finalizar..."
    _ <- getLine
    return ()
