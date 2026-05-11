import Data.Maybe (catMaybes)
-- Simulamos la lógica de recibir datos de MySQL
-- El resultado de SQL llega como una lista de registros
procesarSQL :: [Maybe Double] -> [Double]
procesarSQL registros = map (* 1.18) (catMaybes registros) 
-- catMaybes elimina los NULL de la base de datos automáticamente
main :: IO ()
main = do   
    let datosExternos = [Just 100.50, Nothing, Just 200.0, Just 50.25]
    let preciosFinales = procesarSQL datosExternos
    putStrLn "Reporte de Base de Datos Externa (Sin-Impuestos):"
    print datosExternos
    putStrLn "Reporte de Base de Datos Externa (Post-Impuestos):"
    print preciosFinales
    putStrLn "Proceso finalizado. Presione una tecla para salir."
    _ <- getLine
    return ()