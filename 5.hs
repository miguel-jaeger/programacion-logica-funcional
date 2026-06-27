suma :: [Integer] -> Integer
suma [] = 0
suma (x:xs) = x + suma xs

-- 1. Definición de la función con patrones de lista
-- Recibe una lista de Integer y devuelve un Integer 
suma :: [Integer] -> Integer

-- CASO BASE: [] solo unifica con una lista vacía y devuelve 0 
suma [] = 0

-- CASO RECURSIVO: (x:xs) unifica con listas de al menos un elemento 
-- 'x' es la cabeza y 'xs' el resto de la lista
suma (x:xs) = x + suma xs

main :: IO ()
main = do
putStrLn "Ingrese una lista de números separados por espacios (ej: 10 20 30):"
    
    -- Captura la entrada como String 
entrada <- getLine
    
    -- PROCESAMIENTO:
    -- 'words' separa el String en una lista de Strings ["10", "20", "30"]
    -- 'map read' convierte cada String a Integer 
let numeros = map read (words entrada) :: [Integer]
    
    -- Aplicación de la función recursiva
    let resultadoTotal = suma numeros
    
    -- Muestra el resultado convirtiendo el número a String con 'show’ 
putStrLn ("La suma total de la lista es: " ++ show resultadoTotal)
