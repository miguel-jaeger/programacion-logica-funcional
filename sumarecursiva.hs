-- 1. Definición de la función recursiva con patrones
-- Recibe una lista de Integer y devuelve un Integer
sumaRecursiva :: [Integer] -> Integer

-- CASO BASE: [] unifica con lista vacía y devuelve 0
sumaRecursiva [] = 0

-- CASO RECURSIVO: (x:xs) separa la cabeza del resto
sumaRecursiva (x:xs) = x + sumaRecursiva xs

-- 2. Función principal para interactuar con el teclado
main :: IO ()
main = do
    putStrLn "--- Laboratorio UTP: Patrones Recursivos ---"
    putStrLn "Ingrese una lista de numeros separados por espacios (ej: 1 2 3):"
    
    -- Lectura de la entrada (String)
    entrada <- getLine
    
    -- Procesamiento de datos:
    -- 'words' separa el String por espacios en una lista de Strings
    -- 'map read' convierte cada String en un Integer
    let numeros = map read (words entrada) :: [Integer]
    
    -- Aplicación del patrón recursivo
    let resultado = sumaRecursiva numeros
    
    -- Salida de datos usando 'show' para convertir de vuelta a String
    putStrLn ("La lista ingresada es: " ++ show numeros)
    putStrLn ("El resultado de la suma recursiva es: " ++ show resultado)
    putStrLn "Presiona Enter para finalizar..."
    _ <- getLine
    return ()