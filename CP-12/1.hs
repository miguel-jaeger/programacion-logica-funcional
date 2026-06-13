type Nombre = String
data Termino = Var Nombre | Const Nombre deriving (Show, Eq)
data Formula = Pred Nombre [Termino] | Conj Formula Formula | Neg Formula deriving (Show, Eq)

esAdmin :: Termino -> Bool
esAdmin (Const "Admin01") = True
esAdmin _                = False -- Semántica por defecto

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
    putStrLn $ "Admin tiene permiso de escritura: " ++ show (esAdmin admin) -- Debería ser True
    putStrLn $ "User tiene permiso de escritura: " ++ show (esAdmin user) -- Debería ser False