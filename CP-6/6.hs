lotes ::[Int] -> [Int]
lotes l= fmap (+10) l

main :: IO ()
main = do
    putStrLn "Ingrese los lotes separados por espacios (ej: 15 30 0 12):"
    entrada <- getLine

    -- Explicación del procesamiento:
    -- 1. words entrada: separa "15 30" en ["15", "30"]
    -- 2. map read: convierte ["15", "30"] en [15, 30]
    let lotesIngresados = map read (words entrada) :: [Int]
    -- Llamada a la función pasando la lista como parámetro
    let lotesActualizados = lotes lotesIngresados
    
    putStrLn "Lotes actualizados (+10):"
    print lotesActualizados

    putStrLn "Presione una tecla para salir..."
    _ <- getLine
    return ()