
--infix 5 :-
data Rule = String :- [String]  -- Una regla: conclusión :- [premisas]

-- Alias de tipos para mayor claridad semántica
type BC = [Rule]      -- BC: Base de Conocimiento (conjunto de reglas)
type Goal = String    -- Goal: Objetivo/Meta a demostrar (String)


consultar :: BC -> Goal -> Bool
consultar bc goal = probar bc goal []

-- ============================================================================
-- FUNCIÓN: probar
-- ============================================================================

probar :: BC -> Goal -> [Goal] -> Bool
-- Caso base: Si el objetivo ya fue visitado, hay ciclo -> retornar False
probar _ goal visitados
  | goal `elem` visitados = False
-- Caso recursivo: Intentar encontrar una regla que coincida
probar bc goal visitados =
  any coincide bc  -- Retorna True si existe alguna regla que coincida
  where
    coincide (cabeza :- cuerpo) =
      -- La cabeza debe coincidir exactamente con el objetivo
      cabeza == goal &&
      -- TODAS las premisas del cuerpo deben poderse demostrar recursivamente
      all (\subgoal -> probar bc subgoal (goal : visitados)) cuerpo

-- ============================================================================
-- BASE DE CONOCIMIENTO: SISTEMA DE RUTAS DE RED
-- ============================================================================
--
--     A
--     |
--     |  (conecta_A_B)
--     v
--     B
--    / \
--   /   \
--  v     v
--  C     D
--      /   \
--     /     \  
--    E       F

--
-- Aristas etiquetadas:
--  A -[conecta_A_B]-> B
--  B -[conecta_B_C]-> C
--  B -[conecta_B_D]-> D
--  D -[conecta_D_E]-> E
--  D -[conecta_D_F]-> F

bcRed :: BC
bcRed = [
    -- REGLA 1: Existe ruta de A a C si hay conexión A->B y conexión B->C
    "ruta_A_C" :- ["conecta_A_B", "conecta_B_C"],
    --- REGLA 2: Existe ruta de A a D si hay conexión A->B y ruta de B a D
    "ruta_A_D" :- ["conecta_A_B", "ruta_B_D"],
    -- Para que `ruta_B_D` pueda demostrarse, añadimos la regla que
    -- la conecta con la existencia de la conexión directa B->D.
    "ruta_B_D" :- ["conecta_B_D"],
    --- REGLA 3: Existe ruta de A a E si hay conexión A->B y ruta de B a D
    "ruta_A_E" :- ["conecta_A_B", "ruta_B_D", "conecta_D_E"],
    --- REGLA 4: Existe ruta de A a E si hay conexión A->B y ruta de B a D
    "ruta_A_F" :- ["conecta_A_B", "ruta_B_D", "conecta_D_F"],
    -- HECHO 1: Existe conexión directa de A a B (sin condiciones)
    "conecta_A_B" :- [],    
    -- HECHO 2: Existe conexión directa de B a C (sin condiciones)
    "conecta_B_C" :- [],
    -- HECHO 3: Existe conexión directa de B a D (sin condiciones)
    "conecta_B_D" :- [],
    -- HECHO 4: Existe conexión directa de D a E (sin condiciones)
    "conecta_D_E" :- [],
    -- HECHO 5: Existe conexión directa de D a F (sin condiciones)
    "conecta_D_F" :- []
    ]
    
-- ============================================================================
-- FUNCIÓN: main
-- ============================================================================

main :: IO ()
main = do        
        -- Consulta: ¿Existe ruta de A a B?
        -- Resultado esperado: True (hay regla para "ruta_A_B")
        let resultado = consultar bcRed "ruta_A_E"
        putStrLn $ "Consulta: consultar bcRed \"ruta_A_E\" -> " ++ show resultado    
        
        putStrLn "Presione una tecla para finalizar..."
        _ <- getLine
        return ()