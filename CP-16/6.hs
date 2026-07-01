data Arbol a = Vacio | Nodo a (Arbol a) (Arbol a) deriving (Show, Eq)

existe :: Eq a => a -> Arbol a -> Bool
existe _ Vacio = False
existe x (Nodo valor izq der)
    | x == valor = True                -- Éxito (Poda)
    | otherwise  = existe x izq || existe x der -- Backtracking (Retroceso)


main :: IO ()
main = do
    let arbol = Nodo 5 (Nodo 3 Vacio Vacio) (Nodo 7 (Nodo 4 Vacio Vacio) (Nodo 2 Vacio Vacio))
    putStrLn "Ingrese un valor para buscar en el árbol:"
    input <- getLine
    let valor = read input :: Int
    
    putStrLn $ "El Arbol es: " ++ show arbol
    putStrLn $ "¿El elemento " ++ show valor ++ " existe en el árbol? " ++ show (existe valor arbol)
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()
    