data Arbol a = Vacio | Nodo a (Arbol a) (Arbol a) deriving (Show, Eq)

existe :: Eq a => a -> Arbol a -> Bool
existe _ Vacio = False
existe x (Nodo valor izq der)
    | x == valor = True                -- Éxito
    | otherwise  = existe x izq || existe x der -- Disyunción lógica (Backtracking)

contar :: Eq a => a -> Arbol a -> Int
contar _ Vacio = 0
contar x (Nodo valor izq der)
    | x == valor = 1 + contar x izq + contar x der
    | otherwise  = contar x izq + contar x der    


main :: IO ()
main = do
    --let arbol = Nodo 5 (Nodo 3 Vacio Vacio) (Nodo 7 (Nodo 4 Vacio Vacio) (Nodo 5 (Nodo 4 (Nodo 4 Vacio Vacio) (Nodo 4 Vacio Vacio)) (Nodo 7 Vacio Vacio)))
    let arbol = Nodo 1 (Nodo 2 (Nodo 4 Vacio Vacio) (Nodo 5 (Nodo 4 Vacio Vacio)  Vacio) ) (Nodo 3 (Nodo 6 (Nodo 9 (Nodo 4 Vacio Vacio)  (Nodo 4 Vacio Vacio) )  (Nodo 10 (Nodo 4 Vacio Vacio)  Vacio) )  (Nodo 7 (Nodo 4 Vacio Vacio)  Vacio) ) 
    -- Representación gráfica del árbol:
    --             1
    --        /         \   
    --       2           3
    --      / \          /   \
    --     4   5        6       7
    --           \      / \      \    
    --             4   9    10    4
    --                /      \   
    --               4       4  
                      
   
    --let elemento = 7
    putStrLn("Diga elemento a buscar")
    input<-getLine
    let elemento = read input::Int
    let existeE = if existe elemento arbol then "Si" else "No"


    let cantidad = contar elemento arbol 
       
    putStrLn $ "El elemento " ++ show elemento ++ " aparece " ++ show cantidad ++ " vez/veces en el árbol."
    putStrLn $ "¿El elemento " ++ show elemento ++ " existe en el arbol? " ++  existeE 
