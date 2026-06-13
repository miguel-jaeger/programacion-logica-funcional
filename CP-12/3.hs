type Nombre = String
data Termino = Var Nombre | Const Nombre deriving (Show, Eq)
data Formula = Pred Nombre [Termino] | Conj Formula Formula | Neg Formula deriving (Show, Eq)

evaluar :: Formula -> (Termino -> Bool) -> Bool
evaluar (Pred _ [t]) pred = pred t
evaluar (Conj f1 f2) pred = evaluar f1 pred && evaluar f2 pred
evaluar (Neg form)   pred = not (evaluar form pred)

esAdmin :: Termino -> Bool
esAdmin = \t -> case t of
    Const "Admin01" -> True
    _               -> False -- Semántica por defecto

main :: IO ()
main = do
    putStrLn "Ingrese usuario admin:"
    adminInput <- getLine
    let admin = Const adminInput
    
    putStrLn "Ingrese usuario:"
    userInput <- getLine
    let user = Const userInput
    --let admin = Const "Admin01"
    --let user = Const "User01"
    
    putStrLn "Evaluando permisos de escritura:"
    putStrLn $ "Admin tiene permiso de escritura: " ++ show (evaluar (Pred "Escritura" [admin]) esAdmin) -- Debería ser True
    putStrLn $ "User tiene permiso de escritura: " ++ show (evaluar (Pred "Escritura" [user]) esAdmin) -- Debería ser False

