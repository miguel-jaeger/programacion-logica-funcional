type Nombre = String
data Termino = Var Nombre | Const Nombre deriving (Show, Eq)
data Formula = Pred Nombre [Termino] | Conj Formula Formula | Neg Formula deriving (Show, Eq)

invitados :: [Termino]
invitados = [Const ("Inv" ++ show n) | n <- [1..10]] 

evaluar :: Formula -> (Termino -> Bool) -> Bool
evaluar (Conj (Pred "EsAdmin" [Const "Admin01"]) (Pred "EnLista" invitados)) esAdmin = esAdmin (Const "Admin01") && (Const "Admin01" `elem` invitados)
evaluar (Pred "EsAdmin" [t]) esAdmin = esAdmin t    
evaluar (Pred "EnLista" [t]) esAdmin = t `elem` invitados
evaluar (Conj f1 f2) esAdmin = evaluar f1 esAdmin && evaluar f2 esAdmin
evaluar (Neg f) esAdmin = not (evaluar f esAdmin)

esAdmin :: Termino -> Bool
esAdmin = \t -> case t of
    Const "Admin01" -> True
    _               -> False -- Semántica por defecto

main :: IO ()
main = do
    putStrLn "Evaluando permisos de escritura:"
    putStrLn $ "Admin tiene permiso de escritura: " ++ show (evaluar (Pred "EsAdmin" [Const "Admin01"]) esAdmin) -- Debería ser True
    putStrLn $ "User tiene permiso de escritura: " ++ show (evaluar (Pred "EsAdmin" [Const "User01"]) esAdmin) -- Debería ser False
    putStrLn $ "Lista de invitados: " ++ show (invitados) -- Debería ser False
    putStrLn $ "Inv5 está en la lista de invitados: " ++ show (evaluar (Pred "EnLista" [Const "Inv5"]) esAdmin) -- Debería ser True
    putStrLn $ "User está en la lista de invitados: " ++ show (evaluar (Pred "EnLista" [Const "User01"]) esAdmin) -- Debería ser False  