-- Definimos el operador para reglas
infix 5 :-
data Rule = String :- [String]

-- Base de Conocimiento
type BC = [Rule]
type Goal = String

-- Motor de inferencia (encadenamiento hacia atrás)
consultar :: BC -> Goal -> Bool
consultar bc goal = probar bc goal []

probar :: BC -> Goal -> [Goal] -> Bool
probar _ goal visitados  | goal `elem` visitados = False
probar bc goal visitados =  any coincide bc 
    where
    coincide (cabeza :- cuerpo) =
        cabeza == goal && all (\subgoal -> probar bc subgoal (goal : visitados)) cuerpo

bcCurriculo :: BC
bcCurriculo = [
    "puede_ALG" :- ["aprobado_PROG"],
    "aprobado_PROG" :- ["aprobado_INTRO"],
    "aprobado_INTRO" :- [] -- Hecho
    ]
    
main :: IO ()
main = do
    let resultado = consultar bcCurriculo "aprobado_PROG"
    putStrLn $ "Consulta: consultar bcCurriculo \"aprobado_PROG\" -> " ++ show resultado
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()   