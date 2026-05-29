cuadrado::Int -> Int
cuadrado x = x * x
main :: IO ()
main = do
    --Regla de oro: Es igual a Call-by-Name (de afuera hacia adentro), pero cuando una expresión se duplica, ambas copias apuntan a la misma dirección física de memoria (punteros compartidos). 
    --              Esto significa que si una de las copias se evalúa, el resultado se comparte entre todas las copias, evitando la duplicación de trabajo y mejorando la eficiencia.
    -- Paso 1 (Expansión con punteros compartidos): Se aplica la función exterior. Las variables resultantes no copian el texto, sino que apuntan a la misma dirección [p].
    --  [p]*[p] donde [p]=(1+2) [por def. de cuadrado]
    -- Paso 2 Paso 2 (Reducción del primer puntero y actualización del segundo puntero): Para resolver la multiplicación, el compilador evalúa el primer [p].
    -- 1+2=3 [p] ahora apunta a 3 [por def. de +]
    -- Paso 3 (Cálculo final): Se resuelve la multiplicación.
    -- 3*3=9 [por def. de cuadrado]
    -- Total de reducciones (pasos): 3 operaciones matemáticas.
    let resultado = cuadrado (1+2)
    putStrLn $ "El cuadrado de 3 es: " ++ show resultado
    putStrLn "Presione una tecla para terminar..."
    _ <- getLine
    return ()