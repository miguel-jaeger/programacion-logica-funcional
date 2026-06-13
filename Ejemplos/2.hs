data Term = Const String deriving Show
type Termino = Term
esMayorDeEdad :: Termino -> Bool
esMayorDeEdad (Const "Sujeto1") = True
esMayorDeEdad _ = False

main :: IO ()
main = do   
    let sujeto = Const "Sujeto2"
    putStrLn ("El sujeto es: " ++ show sujeto)
    putStrLn ("¿Es mayor de edad? " ++ show (esMayorDeEdad sujeto))