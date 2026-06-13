type Nombre = String

data Termino = Var Nombre | Const Nombre deriving (Show, Eq)

data Formula
  = Pred Nombre [Termino]
  | Neg Formula
  | Conj Formula Formula
  | ParaTodo Nombre Formula
  deriving (Show, Eq)

esPar :: Termino -> Bool
esPar (Const n) = read n `mod` 2 == 0
esPar _         = False

evaluar :: Formula -> Bool
evaluar (Pred "Par" [t]) = esPar t
evaluar (Conj f1 f2)     = evaluar f1 && evaluar f2
evaluar _                = False

main :: IO ()
main = do
    putStrLn "Ingrese el numero:"
    input1 <- getLine

    putStrLn "Ingrese el numero:"
    input2 <- getLine

    putStrLn "Ingrese el numero:"
    input3 <- getLine

    let formula1 = Pred "Par" [Const input1]
    let formula2 = Pred "Par" [Const input2]
    let formula3 = Pred "Par" [Const input3]

    putStrLn $ "¿Es " ++ input1 ++ " par? " ++ show (evaluar formula1)
    putStrLn $ "¿Es " ++ input2 ++ " par? " ++ show (evaluar formula2)
    putStrLn $ "¿Es " ++ input1 ++ " y " ++ input2 ++ " pares? " ++ show (evaluar formula1 && evaluar formula2)
    putStrLn $ "¿Es " ++ input1 ++ " y " ++ input3 ++ " pares? " ++ show (evaluar formula1 && evaluar formula3)
