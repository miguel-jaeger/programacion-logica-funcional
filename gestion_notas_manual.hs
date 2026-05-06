-- 1. Función Recursiva para Captura de Datos
ingresarNotas :: IO [Int]
ingresarNotas = do
    putStrLn "Ingrese una nota (o un número negativo para finalizar):"
    entrada <- getLine
    let valor = read entrada :: Int
    if valor < 0 
        then return [] -- Caso Base: detiene el ingreso y devuelve lista vacía
        else do
            resto <- ingresarNotas -- Llamada recursiva directa
            return (valor : resto) -- Construye la lista usando el operador cons (:)

-- 2. Filtrado de Excelencia (Uso de filter)
notasExcelentes :: [Int] -> [Int]
notasExcelentes ns = filter (> 15) ns

-- 3. Bonificación Condicional (Recursividad con Guardas)
bonificar :: [Int] -> [Int]
bonificar [] = [] 
bonificar (x:xs) 
    | x < 20    = (x + 1) : bonificar xs 
    | otherwise = 20 : bonificar xs      

-- 4. Estadística de Rango
rangoNotas :: [Int] -> (Int, Int)
rangoNotas ns = (maximum ns, minimum ns)

-- 5. Análisis de Promedio
analizarPromedio :: [Int] -> String
analizarPromedio ns 
    | prom > 17  = "Sobresaliente"
    | prom >= 11 = "Regular"
    | otherwise  = "Deficiente"
    where prom = fromIntegral (sum ns) / fromIntegral (length ns)

-- 6. Menú Principal de Ejecución
main :: IO ()
main = do
    putStrLn "--- Bienvenida al Sistema de Gestión de Notas ---"
    listaUsuario <- ingresarNotas -- Llamado a la función de captura
    
    if null listaUsuario -- Verificación de lista vacía
        then putStrLn "No se ingresaron notas para procesar."
        else do
            putStrLn "\n--- REPORTE GENERADO ---"
            putStrLn $ "Lista ingresada: " ++ show listaUsuario
            putStrLn $ "1. Notas Excelentes (>15): " ++ show (notasExcelentes listaUsuario)
            putStrLn $ "2. Notas con Bonificación (+1): " ++ show (bonificar listaUsuario)
            putStrLn $ "3. Rango (Máxima, Mínima): " ++ show (rangoNotas listaUsuario)
            putStrLn $ "4. Estado de la sección: " ++ analizarPromedio listaUsuario
            --presione una tecla para terminar
            putStrLn "Presione Enter para terminar..."
            getLine_ <- getLine
            return ()