-- Lista base
notas :: [Int]
notas = [11, 18, 09, 15, 20, 10, 14]

-- 1. Filtrado de Excelencia
notasExcelentes :: [Int] -> [Int]
notasExcelentes ns = filter (> 15) ns

-- 2. Bonificación Condicional (Recursividad con Guardas)
bonificar :: [Int] -> [Int]
bonificar [] = [] -- Caso base
bonificar (x:xs) -- Unificación de patrones
    | x < 20    = (x + 1) : bonificar xs -- Caso recursivo con incremento
    | otherwise = 20 : bonificar xs      -- Caso recursivo manteniendo el límite

-- 3. Estadística de Rango (Uso de Tuplas y Funciones Internas)
rangoNotas :: [Int] -> (Int, Int)
rangoNotas ns = (maximum ns, minimum ns)

-- 4. Análisis de Promedio (Composición de funciones)
analizarPromedio :: [Int] -> String
analizarPromedio ns 
    | prom > 17  = "Sobresaliente"
    | prom >= 11 = "Regular"
    | otherwise  = "Deficiente"
    where prom = fromIntegral (sum ns) / fromIntegral (length ns)

-- Menú de ejecución para los estudiantes
main :: IO ()
main = do
    putStrLn "--- Reporte Académico ---"
    putStrLn $ "Notas Originales: " ++ show notas
    putStrLn $ "1. Notas Excelentes (>15): " ++ show (notasExcelentes notas)
    putStrLn $ "2. Notas con Bonificación: " ++ show (bonificar notas)
    putStrLn $ "3. Nota Máxima y Mínima: " ++ show (rangoNotas notas)
    putStrLn $ "4. Estado de la sección: " ++ analizarPromedio notas
    --presione una tecla para terminar
    putStrLn "Presione Enter para terminar..."
    getLine_ <- getLine
    return ()

  