-- ============================================================================
-- SISTEMA DE REGLAS Y MOTOR DE INFERENCIA PARA RUTAS
-- ============================================================================
-- Este programa implementa un motor de inferencia usando encadenamiento hacia
-- atrás (backward chaining) para determinar si existen rutas entre puntos.

-- Definimos el operador infijo :- para representar reglas (cabeza :- cuerpo)
-- El nivel de precedencia 5 permite asociatividad adecuada en expresiones
infix 5 :-
data Rule = String :- [String]  -- Una regla: conclusión :- [premisas]

-- Alias de tipos para mayor claridad semántica
type BC = [Rule]      -- BC: Base de Conocimiento (conjunto de reglas)
type Goal = String    -- Goal: Objetivo/Meta a demostrar (String)

-- ============================================================================
-- FUNCIÓN: consultar
-- ============================================================================
-- Propósito: Función principal que verifica si un objetivo se puede probar
--            usando la base de conocimiento.
-- 
-- Tipo: consultar :: BC -> Goal -> Bool
-- 
-- Parámetros:
--   - bc (Base de Conocimiento): Lista de reglas disponibles
--   - goal (Objetivo): Meta a demostrar
-- 
-- Retorna: Bool - True si el objetivo se puede demostrar, False en caso contrario
-- 
-- Explicación:
--   Esta función es la interfaz pública del motor de inferencia. Inicia el
--   proceso de demostración con una lista vacía de objetivos visitados para
--   detectar ciclos infinitos.
consultar :: BC -> Goal -> Bool
consultar bc goal = probar bc goal []

-- ============================================================================
-- FUNCIÓN: probar
-- ============================================================================
-- Propósito: Motor de inferencia recursivo que usa encadenamiento hacia atrás
--            para demostrar un objetivo.
-- 
-- Tipo: probar :: BC -> Goal -> [Goal] -> Bool
-- 
-- Parámetros:
--   - bc (Base de Conocimiento): Lista de reglas disponibles
--   - goal (Objetivo actual): Meta que intentamos demostrar
--   - visitados (Objetivos visitados): Objetivos ya explorados (previene ciclos)
-- 
-- Retorna: Bool - True si el objetivo se puede demostrar, False en caso contrario
-- 
-- Explicación:
--   Esta función implementa el algoritmo de backward chaining:
--   
--   1. Verificación de ciclos: Si el objetivo ya está en 'visitados', retorna
--      False para evitar bucles infinitos.
--   
--   2. Búsqueda en la base de conocimiento: Para cada regla en BC, intenta
--      hacer coincidir la cabeza de la regla con el objetivo.
--   
--   3. Demostración de premisas: Si la cabeza coincide, debe demostrar TODAS
--      las premisas (cuerpo) de la regla de forma recursiva.
--   
--   4. Recursión: Para cada subobjetivo, llama recursivamente a probar,
--      agregando el objetivo actual a la lista de visitados.
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
-- Esta base de conocimiento define las rutas disponibles en una red de puntos
-- conectados. Una ruta existe si se pueden seguir conexiones intermedias.
--
-- Grafo (ASCII) — nodos, conexiones directas y rutas derivadas:
-- Grafo (ASCII) — nodos, aristas etiquetadas con funciones de conexión:
--
--     A
--     |
--     |  (conecta_A_B)
--     v
--     B
--    / \\
--   /   \\
--  v     v
--  C     D
--
-- Aristas etiquetadas:
--  A -[conecta_A_B]-> B
--  B -[conecta_B_C]-> C
--  B -[conecta_B_D]-> D
--
-- Rutas derivadas (ejemplos):
--  - ruta_B_D: B -> D (por conecta_B_D)
--  - ruta_A_C: A -> B -> C (por conecta_A_B y conecta_B_C)
--  - ruta_A_D: A -> B -> D (por conecta_A_B y ruta_B_D)
--
-- Versión mermaid (texto) con etiquetas en aristas:
-- ```mermaid
-- flowchart TD
--   A((A))
--   B((B))
--   C((C))
--   D((D))
--
--   A -- "conecta_A_B" --> B
--   B -- "conecta_B_C" --> C
--   B -- "conecta_B_D" --> D
--
--   %% rutas derivadas (conceptuales)
--   A -- "ruta_A_C (via B)" --> C
--   A -- "ruta_A_D (via B)" --> D
-- ```
bcRed :: BC
bcRed = [
    -- REGLA 1: Existe ruta de A a C si hay conexión A->B y conexión B->C
    "ruta_A_C" :- ["conecta_A_B", "conecta_B_C"],
    --- REGLA 2: Existe ruta de A a D si hay conexión A->B y ruta de B a D
    "ruta_A_D" :- ["conecta_A_B", "ruta_B_D"],
    -- Para que `ruta_B_D` pueda demostrarse, añadimos la regla que
    -- la conecta con la existencia de la conexión directa B->D.
    "ruta_B_D" :- ["conecta_B_D"],
    -- HECHO 1: Existe conexión directa de A a B (sin condiciones)
    "conecta_A_B" :- [],    
    -- HECHO 2: Existe conexión directa de B a C (sin condiciones)
    "conecta_B_C" :- [],
    -- HECHO 3: Existe conexión directa de B a D (sin condiciones)
    "conecta_B_D" :- []
    ]
    
-- ============================================================================
-- FUNCIÓN: main
-- ============================================================================
-- Propósito: Punto de entrada del programa. Ejecuta consultas de demostración
--            y muestra los resultados.
-- 
-- Explicación:
--   Este programa demuestra cómo usar el motor de inferencia para consultar
--   la base de conocimiento.
main :: IO ()
main = do        
        -- Consulta: ¿Existe ruta de A a B?
        -- Resultado esperado: True (hay regla para "ruta_A_B")
        let resultado = consultar bcRed "ruta_A_D"
        putStrLn $ "Consulta: consultar bcRed \"ruta_A_D\" -> " ++ show resultado    
        
        putStrLn "Presione una tecla para finalizar..."
        _ <- getLine
        return ()