data Termino = Const String | Var String

isConst :: Termino -> Bool
isConst (Const _) = True
isConst _         = False

-- Simulación de cuantificador universal ∀ [cite: 190, 205]
paraTodoConstante :: [Termino] -> Bool
paraTodoConstante lista = all isConst lista

main :: IO ()
main = do
    let listaPrueba = [Var "Haskell", Const "Prolog", Const "y"]
    putStrLn $ "¿Son todos constantes?: " ++ show (paraTodoConstante listaPrueba)