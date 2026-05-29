cuadrado::Int -> Int
cuadrado x = x * x

main :: IO ()
main = do
    --Regla de oro: No puedes aplicar la función exterior hasta que todos los argumentos internos estén completamente reducidos a un valor final.
    -- Paso 1 (Reducción del argumento): Se resuelve la suma interna.
    -- 1+2=3 [por def. de +]
    -- Paso 2 (Aplicación de la función): Ahora que el argumento interno se ha reducido a un valor final, podemos aplicar la función cuadrado.
    -- cuadrado (3) [por def. de cuadrado]
    -- Paso 3 (Evaluación de la función): Se evalúa la función cuadrado con el argumento reducido.
    -- 3 * 3 [por def. de cuadrado]
    -- Paso 4 (Resultado final): Se obtiene el resultado final de la evaluación.
    -- 9--
    let resultado = cuadrado (1+2)
    putStrLn $ "El cuadrado de 3 es: " ++ show resultado
    putStrLn "Presione una tecla para terminar..."
    _ <- getLine
    return ()