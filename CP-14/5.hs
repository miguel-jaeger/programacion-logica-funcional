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

bcSeguridad :: BC
bcSeguridad = [
    "acceso_nivel_2_juan" :- ["acceso_nivel_1_juan", "limpieza_seguridad_juan"],
    "acceso_nivel_1_juan" :- ["limpieza_seguridad_juan"],
    "limpieza_seguridad_juan" :- [] -- Hecho
    ]

main :: IO ()
main = do   
    let resultado = consultar bcSeguridad "acceso_nivel_2_juan"
    putStrLn $ "Consulta: consultar bcSeguridad \"acceso_nivel_2_juan\" -> " ++ show resultado
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()