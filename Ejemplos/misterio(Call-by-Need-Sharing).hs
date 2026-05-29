-- Función misterio: Duplica su primer argumento e ignora el segundo
misterio :: Int -> Int -> Int
misterio x y = x + x

-- Función bucle: Una función recursiva que nunca termina
bucle :: Int -> Int
bucle n = bucle (n + 1)

main :: IO ()
main = do
    -- Regla mecánica: Igual a Call-by-Name, pero cuando una expresión se duplica en la expansión de la función, todas las copias resultantes apuntan a la misma dirección física de memoria (puntero compartido [p]).
    --Estado inicial:
    -- misterio (1 + 3) (bucle 0)
    -- Paso 1 (Aplicación con Sharing): e ejecuta la función exterior. El argumento redundante de la derecha se elimina y el parámetro duplicado se asocia al mismo puntero [p].
        -- [p] + [p] donde [p]=(1+3) [por def. de misterio  y sharing]
        -- Estado después del Paso 1:
        -- misterio (4) (bucle 0)
    -- Paso 2 (Reducción y actualización simultánea): Se evalúa por única vez el valor dentro de [p].
        -- 1 + 3 = 4 [p] ahora apunta a 4 [por def. de + y sharing]
        -- Estado después del Paso 2:   
        -- misterio (4) (bucle 0)

    -- Paso 3 Cálculo final: Se resuelve la suma primitiva.
        -- 4 + 4 = 8 [por def. de +]
        -- Estado después del Paso 3: 
        -- misterio (8) (bucle 0)   
    
        -- Total de reducciones (pasos): 3 operaciones matemáticas.
    let resultado = misterio (1 + 3) (bucle 0)
    putStrLn $ "El resultado de misterio es: " ++ show resultado
    putStrLn "Presione una tecla para terminar..."
    _ <- getLine
    return ()