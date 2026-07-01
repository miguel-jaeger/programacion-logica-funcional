data Estructura = Estructura { argumentos :: [String] }

obtenerAridad :: Estructura -> Int
obtenerAridad est = length (argumentos est)

validarComplejidad :: Estructura -> String
validarComplejidad est
    | obtenerAridad est <= 1 = "Simple"
    | otherwise = "Compleja" -- Evaluación booleana precisa 

main :: IO ()
main = do   
    -- Calcular la aridad de una estructura y validar su complejidad
    putStrLn "Ingrese los argumentos de la estructura separados por espacios:"
    input <- getLine
    
    -- Convertimos la entrada en lista
    let listaArgumentos = words input
    let estructura = Estructura listaArgumentos
    putStrLn $ "Aridad calculada: " ++ show (obtenerAridad estructura)
    putStrLn $ "Clasificación: " ++ validarComplejidad estructura
