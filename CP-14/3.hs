-- ============================================================================
-- SISTEMA DE REGLAS Y MOTOR DE INFERENCIA PARA CURRÍCULUM EDUCATIVO
-- ============================================================================
-- Este programa usa un motor de inferencia para determinar qué cursos
-- pueden cursarse basándose en los prerrequisitos completados.

-- Definimos el operador infijo :- para reglas
infix 5 :-
data Rule = String :- [String]  -- Regla: conclusión :- [premisas requeridas]

-- Alias de tipos
type BC = [Rule]      -- Base de Conocimiento (cursos y prerrequisitos)
type Goal = String    -- Objetivo: curso a verificar

-- ============================================================================
-- FUNCIÓN: consultar
-- ============================================================================
-- Propósito: Verificar si un estudiante puede cursar una asignatura
--            basándose en los prerrequisitos y aprobaciones previas.
-- 
-- Tipo: consultar :: BC -> Goal -> Bool
-- 
-- Parámetros:
--   - bc: Base de conocimiento con reglas de prerrequisitos
--   - goal: Asignatura a verificar (ej: "puede_ALG")
-- 
-- Retorna: Bool - True si se cumplen todos los prerrequisitos
consultar :: BC -> Goal -> Bool
consultar bc goal = probar bc goal []

-- ============================================================================
-- FUNCIÓN: probar
-- ============================================================================
-- Propósito: Motor de inferencia que verifica si se cumplen todos los
--            prerrequisitos para un curso usando encadenamiento hacia atrás.
-- 
-- Tipo: probar :: BC -> Goal -> [Goal] -> Bool
-- 
-- Parámetros:
--   - bc: Base de conocimiento con cursos y sus prerrequisitos
--   - goal: Curso actual a verificar
--   - visitados: Cursos ya verificados (previene ciclos de prerequisitos)
-- 
-- Retorna: Bool - True si todos los prerequisitos se cumplen
-- 
-- Lógica:
--   1. Detectar ciclos: Si el curso ya fue visitado -> False
--   2. Buscar regla coincidente: Encontrar un curso que tenga el mismo nombre
--   3. Verificar prerequisitos: Todos deben cumplirse (all)
probar :: BC -> Goal -> [Goal] -> Bool
probar _ goal visitados  
  | goal `elem` visitados = False  -- Evitar ciclos en prerequisitos
probar bc goal visitados = 
  any coincide bc 
    where
    coincide (cabeza :- cuerpo) =
        cabeza == goal && all (\subgoal -> probar bc subgoal (goal : visitados)) cuerpo

-- ============================================================================
-- BASE DE CONOCIMIENTO: PLAN DE ESTUDIOS
-- ============================================================================
-- Este currículum define una cadena de prerrequisitos:
--   - Para cursar Álgebra, debes haber aprobado Programación
--   - Para aprobar Programación, debes haber aprobado Introducción
--   - Introducción ya fue aprobada (hecho base)
-- 
bcCurriculo :: BC
bcCurriculo = [
    -- REGLA 1: Se puede cursar Álgebra si se aprobó Programación
    "puede_ALG" :- ["aprobado_PROG"],
    
    -- REGLA 2: Se aprobó Programación si se aprobó Introducción
    "aprobado_PROG" :- ["aprobado_INTRO"],
    
    -- HECHO: Introducción fue aprobada (sin condiciones)
    "aprobado_INTRO" :- []
    ]
    
-- ============================================================================
-- FUNCIÓN: main
-- ============================================================================
-- Propósito: Demostrar cómo el motor de inferencia resuelve cadenas
--            de prerrequisitos en un currículum educativo.
-- 
-- Explicación:
--   Este programa verifica si se cumplen los requisitos para cursar
--   asignaturas basándose en aprobaciones previas.
main :: IO ()
main = do
    -- Consulta: ¿Se aprobó Programación?
    -- El motor demuestra:
    --   1. Para "aprobado_PROG" necesito "aprobado_INTRO"
    --   2. "aprobado_INTRO" es un hecho (lista vacía de condiciones)
    --   3. Resultado: True
    let resultado = consultar bcCurriculo "aprobado_PROG"
    putStrLn $ "Consulta: consultar bcCurriculo \"aprobado_PROG\" -> " ++ show resultado
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()   