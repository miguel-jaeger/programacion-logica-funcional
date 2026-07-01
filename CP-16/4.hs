data Arbol a = Vacio | Nodo a (Arbol a) (Arbol a) deriving (Show, Eq)

existe :: Eq a => a -> Arbol a -> Bool
existe _ Vacio = False
existe x (Nodo valor izq der)
    | x == valor = True                -- Éxito (Poda)
    | otherwise  = existe x izq || existe x der -- Backtracking (Retroceso)

main :: IO ()
main = do
    putStrLn "Ingrese un valor:"
    input <- getLine
    let valor = read input :: Int
    let arbol = Nodo 5 (Nodo 3 Vacio Vacio) (Nodo 7 Vacio Vacio) -- Ejemplo de árbol
    putStrLn "Arbol de búsqueda"
    putStrLn $ show arbol
    if existe valor arbol
        then putStrLn "Valor encontrado en el árbol."
        else putStrLn "Valor no encontrado en el árbol."
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()