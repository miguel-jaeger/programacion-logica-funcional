data Arbol a = Vacio
    | Nodo a (Arbol a) (Arbol a)
    deriving (Show, Eq)

existe :: Eq a => a -> Arbol a -> Bool
existe _ Vacio = False
existe x (Nodo valor izq der)
    | x == valor = True
    | otherwise  = existe x izq || existe x der -- Disyunción lógica entre ramas

-- Construcción del árbol del ejemplo
{-
        10
       /  \
      5    15
     / \   / \
    2   7 12  20   -}

miArbol :: Arbol Int
miArbol = Nodo 10 
            (Nodo 5 (Nodo 2 Vacio Vacio) (Nodo 7 Vacio Vacio)) 
            (Nodo 15 (Nodo 12 Vacio Vacio) (Nodo 20 Vacio Vacio))
main :: IO ()
main = do   
    putStrLn $ "¿Existe el valor 5 en el árbol? " ++ show (existe 5 miArbol)
    putStrLn $ "¿Existe el valor 20 en el árbol? " ++ show (existe 20 miArbol)
    putStrLn $ "¿Existe el valor 100 en el árbol? " ++ show (existe 100 miArbol)
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()   