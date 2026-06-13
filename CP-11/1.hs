type Nombre = String
data Termino = Var Nombre | Const Nombre deriving (Show, Eq) -- [cite: 385, 386]
data Formula = Pred Nombre [Termino] | Conj Formula Formula deriving (Show, Eq) -- [cite: 389, 391]

esPar :: Termino -> Bool
esPar (Const n) = read n `mod` 2 == 0 
esPar _ = False

evaluar :: Formula -> Bool
evaluar (Pred "Par" [t]) = esPar t 
--evaluar (Conj f1 f2) = evaluar f1 && evaluar f2 -- Conjunción perezosa 
evaluar (Conj f1 f2) = evaluar f1 || evaluar f2 -- Conjunción perezosa

main :: IO ()
main = do
    putStrLn "Ingrese dos numeros para verificar si ambos son pares:"
    num1 <- getLine
    num2 <- getLine

    print $ evaluar (Conj (Pred "Par" [Const num1]) (Pred "Par" [Const num2]))