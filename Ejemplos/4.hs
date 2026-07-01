data Arbol a = Vacio | Nodo a (Arbol a) (Arbol a) deriving (Show, Eq)

existe :: Eq a => a -> Arbol a -> Bool
existe _ Vacio = False
existe x (Nodo valor izq der)
    | x == valor = True                -- Éxito
    | otherwise  = existe x izq || existe x der -- Disyunción lógica (Backtracking)

main :: IO ()
main = do
    let arbol = Nodo 5 (Nodo 3 Vacio Vacio) (Nodo 7 (Nodo 4 Vacio Vacio) (Nodo 2 Vacio Vacio))
    -- Representación gráfica del árbol:
    --         5
    --        / \   
    --       3   7
    --          / \
    --         4   2
   
    let elemento = 2
    putStrLn $ "¿El elemento " ++ show elemento ++ " existe en el árbol? " ++ show (existe elemento arbol)    