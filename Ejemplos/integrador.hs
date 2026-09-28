
-- 1. Filtramos palabras largas y obtenemos sus longitudes
obtenerLongitudes :: [String] -> [Int]
obtenerLongitudes lista = [length p | p <- lista, length p > 3]

-- 2. Multiplicamos todos los elementos de la lista resultante
multiplicarElementos :: [Int] -> Int
multiplicarElementos = product

main :: IO ()
main = do
    let palabras = ["hola", "mundo", "hi", "programacion"]
    let longitudes = obtenerLongitudes palabras
    let resultadoFinal = multiplicarElementos longitudes
    
    putStrLn $ "Lista de palabras: " ++ show palabras
    putStrLn $ "Longitudes (>3): " ++ show longitudes
    putStrLn $ "El producto de las longitudes es: " ++ show resultadoFinal