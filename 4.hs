-- 1. Función que calcula el sucesor
sucesor :: Int -> Int
sucesor n = n + 1

-- 2. Función compuesta principal
-- Utiliza la composición (.) para aplicar sucesor y luego verificar si es par
esSucesorPar :: Int -> Bool
esSucesorPar = even . sucesor

-- 3. Interacción con el usuario (Main)
main :: IO ()
main = do
    putStrLn "--- Verificador de Sucesor Par ---"
    putStrLn "Introduzca un número entero:"
    
    -- Captura de entrada (String) y conversión a Int
    valorInput <- getLine
    let numero = read valorInput :: Int
    
    -- Evaluación mediante la función compuesta
    let resultado = esSucesorPar numero
    
    -- Salida de resultados
    putStrLn ("El sucesor de " ++ show numero ++ " es " ++ show (sucesor numero))
    if resultado 
        then putStrLn "El resultado es PAR."
        else putStrLn "El resultado es IMPAR."
        
    putStrLn "Presione una tecla para finalizar."
    _ <- getLine
    return ()


