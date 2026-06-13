-- | Representación recursiva de fórmulas de lógica proposicional
data Formula
    = Var String           -- Átomo o variable proposicional (p, q, r)
    | Not Formula         -- Negación lógica (¬)
    | And Formula Formula -- Conjunción lógica (∧)
    | Or  Formula Formula -- Disyunción lógica (∨)
    | Imp Formula Formula -- Implicación lógica (→)
    deriving Show

    -- | Fase 1: Transforma implicaciones en disyunciones negadas
elimImp :: Formula -> Formula
elimImp (Var x)     = Var x
elimImp (Not f)     = Not (elimImp f)
elimImp (And a b)   = And (elimImp a) (elimImp b)
elimImp (Or  a b)   = Or (elimImp a) (elimImp b)
elimImp (Imp a b)   = Or (Not (elimImp a)) (elimImp b) -- Regla de eliminación de la flecha

-- | Fase 2: Empuja las negaciones hacia los átomos y aplica doble negación
pushNeg :: Formula -> Formula
pushNeg (Not (Not f))   = pushNeg f                                   -- Doble negación: ¬¬A ≡ A
pushNeg (Not (And a b)) = Or (pushNeg (Not a)) (pushNeg (Not b))      -- De Morgan: ¬(A ∧ B) ≡ ¬A ∨ ¬B
pushNeg (Not (Or a b))  = And (pushNeg (Not a)) (pushNeg (Not b))     -- De Morgan: ¬(A ∨ B) ≡ ¬A ∧ ¬B
pushNeg (And a b)       = And (pushNeg a) (pushNeg b)
pushNeg (Or  a b)       = Or (pushNeg a) (pushNeg b)
pushNeg f               = f                                           -- Caso base para Var o Not Var

-- | Fase 3: Distribuye el operador OR sobre el AND (Propiedad Distributiva)
dist :: Formula -> Formula
dist (Or a (And b c))   = And (dist (Or a b)) (dist (Or a c)) -- A ∨ (B ∧ C) ≡ (A ∨ B) ∧ (A ∨ C)
dist (Or (And b c) a)   = And (dist (Or b a)) (dist (Or c a)) -- (B ∧ C) ∨ A ≡ (B ∨ A) ∧ (C ∨ A)
dist (And a b)          = And (dist a) (dist b)
dist f                  = f                                   -- No hay más distribuciones posibles

-- | Función principal: Transforma cualquier fórmula a su equivalente en FNC
-- El flujo es: Eliminar Implicaciones -> Normalizar Negaciones -> Distribuir Disyunciones
toFNC :: Formula -> Formula
toFNC = dist . pushNeg . elimImp

main :: IO ()
main = do
    let formulaOriginal = Imp (And (Var "p") (Var "q")) (Or (Var "r") (Var "s"))
    putStrLn "Fórmula original:"
    print formulaOriginal
    let formulaFNC = toFNC formulaOriginal
    putStrLn "Fórmula en Forma Normal Conjuntiva (FNC):"
    print formulaFNC
    putStrLn "Proceso de transformación completo."
    _ <- getLine  -- Espera para mantener la consola abierta
    return ()