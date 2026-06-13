data Termino = Var String | Const String deriving Show

-- Implementación segura con Pattern Matching 
verPrimerTermino :: [Termino] -> String
verPrimerTermino (x:_) = "El primer término es: " ++ show x
verPrimerTermino []    = "La lista de términos está vacía"

main :: IO ()
main = do
    let terminos = [ Var "x",Const "Lima"]
    putStrLn $ verPrimerTermino terminos