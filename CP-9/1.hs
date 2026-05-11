import Text.Read (readMaybe)
import System.IO
import Data.Maybe (mapMaybe)

-- Transforma el texto en una lista de IDs activos, ignorando errores y el 0
procesarSQL :: String -> [(Int, String)]
procesarSQL entrada = 
    let -- mapMaybe aplica una función que devuelve Maybe y descarta los Nothing
        ids = mapMaybe readMaybe (words entrada) :: [Int]
        -- para filtrar los IDs válidos, eliminamos el 0 y cualquier valor no numérico
        validos = filter (/= 0) ids 
    in map (\id -> if id > 0 
                then (id, "ACTIVO") 
                else (id, "INACTIVO")) ids 

main :: IO ()
main = do
    putStrLn "Ingrese IDs separados por espacios (ej: 1 3 5 0 hola):"
    hFlush stdout
    datosRaw <- getLine 
    
    let datosExternos = procesarSQL datosRaw
    putStrLn $ "Reporte de Base de Datos (Post-Procesamiento):"
    print datosExternos -- Ejemplo: [(1,"ACTIVO"),(3,"ACTIVO")]
    
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()