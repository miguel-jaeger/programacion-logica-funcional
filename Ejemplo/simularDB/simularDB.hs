import Data.Maybe

-- Simulamos datos que vienen de una tabla MySQL
-- Just 100 es un precio, Nothing es un NULL de la base de datos
datosExternos :: [Maybe Double]
datosExternos = [Just 100.50, Nothing, Just 200.0, Just 50.25]

-- Función que aplica impuesto a los datos reales
procesarSQL :: [Maybe Double] -> [Double]
procesarSQL lista = map (* 1.18) (catMaybes lista)

main :: IO ()
main = do
    let preciosFinales = procesarSQL datosExternos
    putStrLn "Reporte de Base de Datos Externa (Post-Impuestos):"
    print preciosFinales