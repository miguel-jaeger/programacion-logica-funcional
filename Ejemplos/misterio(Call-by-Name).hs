-- Función misterio: Duplica su primer argumento e ignora el segundo
misterio :: Int -> Int -> Int
misterio x y = x + x

-- Función bucle: Una función recursiva que nunca termina
bucle :: Int -> Int
bucle n = bucle (n + 1)

main :: IO ()
main = do
    -- Regla mecánica: Evaluar todos los argumentos internos de adentro hacia afuera, antes de aplicar la función externa.
    -- Redexes iniciales identificados:
    --R_1 = 1 + 3 (Argumento 1)
    --R_2 = bucle(0) (Argumento 2)
    --Estado inicial:
    -- misterio (1 + 3) (bucle 0)
    -- Paso 1 (Reducción del primer argumento): Se resuelve la suma interna
        -- 1 + 3 = 4 [por def. de +]
        -- Estado después del Paso 1:
        -- misterio (4) (bucle 0)
    -- Paso 2 (Reducción del segundo argumento): Se aplica la función bucle.
        -- bucle (0) [por def. de bucle]
        -- Estado después del Paso 2: 
        -- misterio (4) (bucle 1)
        -- Nota: En este punto, el programa entra en un bucle infinito debido a la naturaleza recursiva de la función bucle. Sin embargo, siguiendo la regla mecánica, se continúa evaluando los argumentos internos antes de aplicar la función misterio.  

    -- Paso 3 Paso 3 (Siguiente llamada recursiva):
        -- bucle (1) [por def. de bucle]
        -- Estado después del Paso 3:
        -- misterio (4) (bucle 2)   
        -- El programa sigue entrando en un bucle infinito, incrementando el valor de n en cada llamada recursiva a bucle.
    let resultado = misterio (1 + 3) (bucle 0)
    putStrLn $ "El resultado de misterio es: " ++ show resultado
    putStrLn "Presione una tecla para terminar..."
    _ <- getLine
    return ()