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
                 /            \
            5                   15
           /    \           /       \
          2       7        12       20
         / \     / \      / \      / \
        4  1    9  8     14 13    25 21
-}
miArbol :: Arbol Int
miArbol = Nodo 10
            (Nodo 5
                (Nodo 2 (Nodo 4 (Nodo 6 Vacio Vacio) Vacio) (Nodo 1 Vacio Vacio))
                (Nodo 7 (Nodo 9 (Nodo 11 Vacio Vacio) Vacio) (Nodo 8 Vacio Vacio)))
            (Nodo 15
                (Nodo 12 (Nodo 14 (Nodo 16 Vacio Vacio) Vacio) (Nodo 13 Vacio Vacio))
                (Nodo 20 (Nodo 25 (Nodo 3 Vacio Vacio) Vacio) (Nodo 21 Vacio Vacio)))
main :: IO ()
main = do
    putStrLn $ "¿Existe el valor 25 en el árbol? " ++ show (existe 25 miArbol)
    putStrLn $ "¿Existe el valor 20 en el árbol? " ++ show (existe 20 miArbol)
    putStrLn $ "¿Existe el valor 100 en el árbol? " ++ show (existe 100 miArbol)   