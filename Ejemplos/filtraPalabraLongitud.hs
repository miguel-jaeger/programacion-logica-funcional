
-- Explicación: Cambiamos la firma para devolver una lista de tuplas [(String, Int)]
palabrasConLongitud :: [String] -> [(String, Int)]
palabrasConLongitud lista = 
    map (\p -> (p, length p)) (filter (\p -> length p > 3) lista)

main :: IO ()
main = do   
    let palabras = ["hola", "mundo", "hi", "programacion", "fun"]
    let resultado = palabrasConLongitud palabras
    
    putStrLn "Análisis de palabras (longitud > 3):"
    print resultado 
