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
probar _ goal visitados
  | goal `elem` visitados = False
probar bc goal visitados =
  any coincide bc
  where
    coincide (cabeza :- cuerpo) =
      cabeza == goal &&
      all (\subgoal -> probar bc subgoal (goal : visitados)) cuerpo
bcParentesco :: BC
bcParentesco = [
    "abuelo_pedro_luis" :- ["padre_pedro_juan", "padre_juan_luis"],
    "padre_pedro_juan" :- [],
    "padre_juan_luis" :- []
    ]
-- Consulta: consultar bcParentesco "abuelo_pedro_luis" -> True
main :: IO ()
main = do
        let resultado = consultar bcParentesco "abuelo_pedro_juan"
        putStrLn $ "Consulta: consultar bcParentesco \"abuelo_pedro_luis\" -> " ++ show resultado
        let resultado2 = consultar bcParentesco "padre_pedro_juan" 
        putStrLn $ "Consulta: consultar bcParentesco \"padre_pedro_juan\" -> " ++ show resultado2    
        putStrLn "Presione una tecla para finalizar..."
        _ <- getLine
        return ()