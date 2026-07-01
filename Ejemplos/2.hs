-- Predicado de pertenencia (elem)
pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False
pertenece buscado (x:xs)
    | buscado == x = True
    | otherwise    = pertenece buscado xs

-- Relación de concatenación: apilar(L1, L2, L3)
apilar :: [a] -> [a] -> [a]
apilar [] ys = ys
apilar (x:xs) ys = x : apilar xs ys

main :: IO ()
main = do
    -- Ejemplo de uso del predicado de pertenencia
    let lista = [1, 2, 3, 4, 5]
    putStrLn "Ingrese un número para verificar si pertenece a la lista [1, 2, 3, 4, 5]: "
    numero <- readLn :: IO Int
    let resultadoPertenencia = pertenece numero lista
    putStrLn $ "¿El número pertenece a la lista? " ++ show resultadoPertenencia

    -- Ejemplo de uso de la relación de concatenación
    let lista1 = [1, 2]
    let lista2 = [3, 4]
    let resultadoConcatenacion = apilar lista1 lista2
    putStrLn $ "Resultado de concatenar " ++ show lista1 ++ " y " ++ show lista2 ++ ": " ++ show resultadoConcatenacion

    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()