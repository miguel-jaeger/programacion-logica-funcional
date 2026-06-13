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

bcRed :: BC
bcRed = [
    "ruta_A_C" :- ["conecta_A_B", "conecta_B_C"],
    "conecta_A_B" :- [],
    "conecta_B_C" :- []
    ]
    
main :: IO ()
main = do        
        let resultado = consultar bcRed "ruta_A_J"
        putStrLn $ "Consulta: consultar bcRed \"ruta_A_J\" -> " ++ show resultado
        putStrLn "Presione una tecla para finalizar..."
        _ <- getLine
        return ()