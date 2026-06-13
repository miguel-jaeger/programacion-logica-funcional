unos :: [Integer]
unos = 12 : unos -- Estructura infinita genera una secuencia de 12s, no es perezosa porque el primer elemento es 12, no se evalúa hasta que se accede a él
--unos = 1 : unos -- Estructura infinita, genera solo unos 

-- Definimos una función segura usando Pattern Matching [cite: 24]
obtenerPrimero :: Show a => [a] -> String -- La función es segura porque maneja el caso de lista vacía
obtenerPrimero (x:_) = show x
obtenerPrimero []    = "Lista vacía"

main :: IO ()
main = do
    putStr "Primer elemento (head): "
    let (primero:_) = unos
    print primero
    
    -- Uso de take 5: Se evalúan solo los primeros 5 elementos [cite: 76, 115]
    putStr "Primeros 5 elementos (take 5): "
    print $ take 5 unos
