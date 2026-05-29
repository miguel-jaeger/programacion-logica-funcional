cuadrado::Int -> Int
cuadrado x = x * x
main :: IO ()
main = do
    --Regla de oro: Aplica la función del extremo exterior primero. Pasa los argumentos tal y como están, como si fueran fórmulas cerradas, sin importar lo complejas que sean.
    -- Paso 1 (Expansión de la función): Se aplica la función cuadrado a la expresión completa sin evaluar los argumentos internos.
    --  (1+2)*(1+2) [por def. de cuadrado]
    -- Paso 2 Paso 2 (Reducción del primer término): Se resuelve la suma interna.
    -- 1+2=3 [por def. de +]
    -- Paso 3 (Reducción del segundo término): Se resuelve la suma interna.
    -- 1+2=3 [por def. de +]
    -- Paso 4 (Evaluación de la función): Se evalúa la función cuadrado con los argumentos reducidos.
    -- 3 * 3 [por def. de cuadrado]
    -- Paso 5 (Resultado final): Se obtiene el resultado final de la evaluación.
    -- 9--
    let resultado = cuadrado (1+2)
    putStrLn $ "El cuadrado de 3 es: " ++ show resultado
    putStrLn "Presione una tecla para terminar..."
    _ <- getLine
    return ()