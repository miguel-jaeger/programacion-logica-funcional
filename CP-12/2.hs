type Nombre = String
data Termino = Var Nombre | Const Nombre deriving (Show, Eq)
data Formula = Pred Nombre [Termino] | Conj Formula Formula | Neg Formula deriving (Show, Eq)

evaluarAcceso :: Termino -> Termino -> Bool
evaluarAcceso user llave = (user == Const "Admin01") && (llave == Const "Gold")
-- Si el usuario no es Admin01, Haskell no evalúa la llave (Atajo Lógico) 

main :: IO ()
main = do 
    putStrLn "Ingrese usuario:"
    userInput <- getLine
    putStrLn "Ingrese llave:"
    llaveInput <- getLine
    let user = Const userInput
    let llave = Const llaveInput
    {--
     
    let admin = Const "Admin01"
    let user = Const "User01"
    let llaveCorrecta = Const "Gold"
    let llaveIncorrecta = Const "Silver"
    
    putStrLn "Evaluando acceso:"
    putStrLn $ "Admin con llave correcta: " ++ show (evaluarAcceso admin llaveCorrecta) -- Debería ser True
    putStrLn $ "Admin con llave incorrecta: " ++ show (evaluarAcceso admin llaveIncorrecta) -- Debería ser False
    putStrLn $ "User con llave correcta: " ++ show (evaluarAcceso user llaveCorrecta) -- Debería ser False
    putStrLn $ "User con llave incorrecta: " ++ show (evaluarAcceso user llaveIncorrecta) -- Debería ser False
    --}
    putStrLn "Evaluando acceso:"
    putStrLn $ "Usuario con llave ingresada: " ++ show (evaluarAcceso user llave)