palabrasConLongitud' :: [String] -> [(String, Int)]
palabrasConLongitud' lista = [(p, length p) | p <- lista, length p > 3]
main :: IO ()
main = do   
    let palabras = ["hola", "mundo", "hi", "programacion", "fun"]
    let resultado = palabrasConLongitud' palabras
    
    putStrLn "Análisis de palabras (longitud > 3):"
    print resultado