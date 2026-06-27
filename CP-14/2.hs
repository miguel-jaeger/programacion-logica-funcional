-- ============================================================================
-- SISTEMA DE REGLAS Y MOTOR DE INFERENCIA PARA RELACIONES FAMILIARES
-- ============================================================================
-- Este programa implementa un motor de inferencia usando encadenamiento hacia
-- atrás para demostrar relaciones familiares basadas en relaciones base.

-- Definimos el operador infijo :- para representar reglas
infix 5 :-
data Rule = String :- [String]  -- Una regla: conclusión :- [premisas]

-- Alias de tipos para mayor claridad
type BC = [Rule]      -- Base de Conocimiento
type Goal = String    -- Objetivo a demostrar

-- ============================================================================
-- FUNCIÓN: consultar
-- ============================================================================
-- Propósito: Verificar si un objetivo sobre relaciones familiares se puede
--            demostrar usando la base de conocimiento.
-- 
-- Tipo: consultar :: BC -> Goal -> Bool
-- 
-- Parámetros:
--   - bc: Lista de reglas sobre relaciones familiares
--   - goal: Relación a demostrar (ej: "abuelo_pedro_luis")
-- 
-- Retorna: Bool - True si la relación se puede demostrar
consultar :: BC -> Goal -> Bool
consultar bc goal = probar bc goal []

-- ============================================================================
-- FUNCIÓN: probar
-- ============================================================================
-- Propósito: Motor de inferencia recursivo que demuestra relaciones familiares
--            usando encadenamiento hacia atrás.
-- 
-- Tipo: probar :: BC -> Goal -> [Goal] -> Bool
-- 
-- Parámetros:
--   - bc: Base de conocimiento con reglas de relaciones
--   - goal: Relación actual a demostrar
--   - visitados: Relaciones ya exploradas (previene ciclos)
-- 
-- Retorna: Bool - True si la relación se puede demostrar
-- 
-- Algoritmo:
--   1. Si la relación está en visitados, hay ciclo -> False
--   2. Buscar una regla cuya conclusión coincida con el objetivo
--   3. Demostrar todas las premisas (relaciones previas necesarias)
probar :: BC -> Goal -> [Goal] -> Bool
probar _ goal visitados
  | goal `elem` visitados = False  -- Evitar ciclos infinitos
probar bc goal visitados =
  any coincide bc
  where
    coincide (cabeza :- cuerpo) =
      cabeza == goal &&
      all (\subgoal -> probar bc subgoal (goal : visitados)) cuerpo
-- ============================================================================
-- BASE DE CONOCIMIENTO: ÁRBOL GENEALÓGICO
-- ============================================================================
-- Esta base de conocimiento define relaciones familiares:
--   Pedro es padre de Juan
--   Juan es padre de Luis
--   Por lo tanto, Pedro es abuelo de Luis
-- 
bcParentesco :: BC
bcParentesco = [
    -- REGLA: Pedro es abuelo de Luis si:
    --        1) Pedro es padre de Juan, Y
    --        2) Juan es padre de Luis
    --abuelos:
    "abuelo_pedro_luis" :- ["padre_pedro_juan",  "padre_juan_luis"],

    "abuelo_pedro_luisa" :- ["padre_pedro_juan", "padre_juan_luisa"],

    "abuelo_pedro_maria" :- ["padre_pedro_juana", "padre_juana_maria"],

    --hermanos:

    "hermano_juan_juana" :- ["padre_pedro_juan", "padre_pedro_juana"],

    "hermano_luis_luisa" :- ["padre_juan_luis", "padre_juan_luisa"],

    --tios:

    "tio_juan_maria" :- ["hermano_juan_juana", "padre_juana_maria"],
    
    "tio_juana_luis" :- ["hermano_juan_juana", "padre_juan_luis"],

    "tio_juana_luisa" :- ["hermano_juan_juana", "padre_juan_luisa"],

    --hechos:
    "padre_pedro_juana" :- [],

    "padre_juana_maria" :- [],

    "padre_pedro_juan" :- [],
    
    "padre_juan_luis" :- [],

    "padre_juan_luisa" :- []

    
    ]

-- ============================================================================
-- FUNCIÓN: main
-- ============================================================================
-- Propósito: Demostrar el uso del motor de inferencia con relaciones familiares.
-- 
-- Explicación:
--   Se ejecutan dos consultas para mostrar cómo el sistema puede:
--   1. Demostrar relaciones complejas (abuelo) a partir de relaciones simples
--   2. Demostrar hechos directos de la base de conocimiento
main :: IO ()
main = do
        -- Consulta 1: ¿Es Pedro abuelo de Juan?

        -- Consulta 2: ¿Es Pedro padre de Juan?
   
         -- Resultado: True (es un hecho directo en la base de conocimiento)
        let resultado5 = consultar bcParentesco "abuelo_pedro_maria" 
        putStrLn $ "Consulta 5: consultar bcParentesco \"abuelo_pedro_maria\" -> " ++ show resultado5
              
        -- Consulta 3: ¿Es Pedro abuelo de Luis?
        -- Resultado: True (es un hecho directo en la base de conocimiento)
        let resultado3 = consultar bcParentesco "abuelo_pedro_luis" 
        putStrLn $ "Consulta 3: consultar bcParentesco \"abuelo_pedro_luis\" -> " ++ show resultado3    

        -- Consulta 4: ¿Es Pedro abuelo de Luisa?
        -- Resultado: True (es un hecho directo en la base de conocimiento)
        let resultado4 = consultar bcParentesco "abuelo_pedro_luisa" 
        putStrLn $ "Consulta 4: consultar bcParentesco \"abuelo_pedro_luisa\" -> " ++ show resultado4

        -- Resultado: True (es un hecho directo en la base de conocimiento)
        let resultado2 = consultar bcParentesco "padre_pedro_juan" 
        putStrLn $ "Consulta 2: consultar bcParentesco \"padre_pedro_juan\" -> " ++ show resultado2 

        let resultado2 = consultar bcParentesco "padre_pedro_juana" 
        putStrLn $ "Consulta 2: consultar bcParentesco \"padre_pedro_juana\" -> " ++ show resultado2 

        let resultado2 = consultar bcParentesco "padre_juan_luis" 
        putStrLn $ "Consulta 2: consultar bcParentesco \"padre_juan_luis\" -> " ++ show resultado2 

        let resultado2 = consultar bcParentesco "padre_juan_luisa" 
        putStrLn $ "Consulta 2: consultar bcParentesco \"padre_juan_luisa\" -> " ++ show resultado2 

        let resultado2 = consultar bcParentesco "padre_juana_maria" 
        putStrLn $ "Consulta 2: consultar bcParentesco \"padre_juana_maria\" -> " ++ show resultado2 

        -- Resultado: False (no existe la regla, se consulta "abuelo_pedro_juan")
        let resultado = consultar bcParentesco "hermano_juan_juana"
        putStrLn $ "Consulta 1: consultar bcParentesco \"hermano_juan_juana\" -> " ++ show resultado
        
        let resultado = consultar bcParentesco "hermano_luis_luisa"
        putStrLn $ "Consulta 1: consultar bcParentesco \"hermano_luis_luisa\" -> " ++ show resultado
        
        -- Consulta 5: ¿Es Pedro abuelo de Luisa?
        -- Resultado: True (es un hecho directo en la base de conocimiento)
        let resultado5 = consultar bcParentesco "tio_juan_maria" 
        putStrLn $ "Consulta 5: consultar bcParentesco \"tio_juan_maria\" -> " ++ show resultado5
        let resultado5 = consultar bcParentesco "tio_juana_luis" 
        putStrLn $ "Consulta 5: consultar bcParentesco \"tio_juana_luis\" -> " ++ show resultado5
        let resultado5 = consultar bcParentesco "tio_juana_luisa" 
        putStrLn $ "Consulta 5: consultar bcParentesco \"tio_juana_luisa\" -> " ++ show resultado5

        let resultado5 = consultar bcParentesco "padre_pedro_maria" 
        putStrLn $ "Consulta 5: consultar bcParentesco \"padre_pedro_maria\" -> " ++ show resultado5

        -- Consulta 5: ¿Es Juan abuelo de Maria?
               
        putStrLn "Presione una tecla para finalizar..."
        _ <- getLine
        return ()