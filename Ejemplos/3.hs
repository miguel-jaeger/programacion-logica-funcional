-- Definimos un operador infijo para representar reglas lógicas.
-- Ejemplo: "a" :- ["b","c"]  significa  a <- b ∧ c
infix 5 :-
data Rule = String :- [String]

-- Base de Conocimiento (BC): lista de reglas
type BC = [Rule]

-- Sinónimo para mayor claridad semántica
type Goal = String

-- 1. Definición de la Base de Conocimiento
-- Cada regla tiene la forma: cabeza :- cuerpo
-- Si el cuerpo es vacío ([]), se trata de un hecho.
bcRed :: BC
bcRed =
    [ "acceso_total_juan" :- ["credenciales_admin_juan", "servidor_activo"]
    , "credenciales_admin_juan" :- []
    , "servidor_activo" :- []
    ]

-- 2. Función principal de consulta
-- Recibe una BC y un objetivo (goal)
-- Devuelve True si el objetivo puede demostrarse, False en caso contrario
consultar :: BC -> Goal -> Bool
consultar bc goal = probar bc goal []

-- 3. Motor de inferencia (encadenamiento hacia atrás)
-- bc: base de conocimiento
-- goal: objetivo actual a demostrar
-- visitados: lista de metas ya visitadas (evita ciclos infinitos)
probar :: BC -> Goal -> [Goal] -> Bool
probar _ goal visitados
-- Si ya visitamos esta meta, detenemos la búsqueda
-- para evitar recursión infinita
    | goal `elem` visitados = False

probar bc goal visitados =
    -- Buscamos reglas cuya cabeza coincida con el objetivo
    -- y verificamos que todos sus subobjetivos sean demostrables
    any coincide bc
    where
    coincide (cabeza :- cuerpo) =
        cabeza == goal &&
        all (\subgoal -> probar bc subgoal (goal : visitados)) cuerpo

-- 4. Programa principal
main :: IO ()
main = do
    let consulta = "acceso_total_juan"
    if consultar bcRed consulta
        then putStrLn $ "La consulta '" ++ consulta ++ "' es verdadera."
        else putStrLn $ "La consulta '" ++ consulta ++ "' es falsa."
    
    putStrLn "Presione una tecla para finalizar."   
    _ <- getLine
    return ()