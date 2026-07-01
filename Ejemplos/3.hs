data Arbol a = Vacio
    | Nodo a (Arbol a) (Arbol a)
    deriving (Show, Eq)

existe :: Eq a => a -> Arbol a -> Bool
existe _ Vacio = False
existe x (Nodo valor izq der)
    | x == valor = True
    | otherwise  = existe x izq || existe x der -- Disyunción lógica entre ramas

main :: IO ()
main = do
    -- Ejemplo de uso del predicado de pertenencia
   -- let arbol = Nodo 10 (Nodo 5 Vacio Vacio) (Nodo 15 Vacio Vacio)
   -- Arbol de la presentación:
    let arbol = Nodo 10 (Nodo 5 (Nodo 2 Vacio Vacio) (Nodo 7 Vacio Vacio)) (Nodo 15 (Nodo 12 Vacio Vacio) (Nodo 20 Vacio Vacio))
    putStrLn $ "¿Existe el valor 5 en el árbol? " ++ show (existe 5 arbol)
    putStrLn $ "¿Existe el valor 20 en el árbol? " ++ show (existe 20 arbol)
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()