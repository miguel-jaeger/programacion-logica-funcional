type Nombre = String
data Termino = Var Nombre | Const Nombre deriving (Show, Eq)
data Formula = Pred Nombre [Termino] | Conj Formula Formula | Neg Formula deriving (Show, Eq)

evaluar :: Formula -> (Termino -> Bool) -> Bool
evaluar (Pred _ [t]) pred = pred t
evaluar (Conj f1 f2) pred = evaluar f1 pred && evaluar f2 pred
evaluar (Neg form)   pred = not (evaluar form pred) 
evaluar _            _    = False

main :: IO ()
main = do
    let user = Const "Invitado"
    let tienePermisoEscritura (Const "Admin") = True
        tienePermisoEscritura _ = False
    putStrLn $ "¿Invitado NO tiene permiso? " ++ show (evaluar (Neg (Pred "Escritura" [user])) tienePermisoEscritura)
