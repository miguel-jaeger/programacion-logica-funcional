-- ============================================================================
-- SISTEMA DE REGLAS Y MOTOR DE INFERENCIA PARA CONTROL DE ACCESO
-- ============================================================================
-- Este programa implementa un sistema de control de acceso basado en niveles
-- de seguridad y requisitos de autorización.

-- Definimos el operador infijo :- para reglas de acceso
infix 5 :-
data Rule = String :- [String]  -- Regla: nivel_acceso :- [requisitos]

-- Alias de tipos
type BC = [Rule]      -- Base de Conocimiento (reglas de seguridad)
type Goal = String    -- Objetivo: nivel de acceso a verificar

-- ============================================================================
-- FUNCIÓN: consultar
-- ============================================================================
-- Propósito: Verificar si un usuario puede acceder a un nivel de seguridad
--            basándose en los requisitos de autorización.
-- 
-- Tipo: consultar :: BC -> Goal -> Bool
-- 
-- Parámetros:
--   - bc: Base de conocimiento con reglas de acceso
--   - goal: Nivel de acceso a verificar (ej: "acceso_nivel_2_juan")
-- 
-- Retorna: Bool - True si el usuario cumple todos los requisitos
consultar :: BC -> Goal -> Bool
consultar bc goal = probar bc goal []

-- ============================================================================
-- FUNCIÓN: probar
-- ============================================================================
-- Propósito: Motor de inferencia que verifica cumplimiento de requisitos
--            de seguridad usando encadenamiento hacia atrás.
-- 
-- Tipo: probar :: BC -> Goal -> [Goal] -> Bool
-- 
-- Parámetros:
--   - bc: Base de conocimiento con reglas de control de acceso
--   - goal: Nivel de acceso actual a verificar
--   - visitados: Niveles ya verificados (previene ciclos de autorización)
-- 
-- Retorna: Bool - True si se cumplen todos los requisitos
-- 
-- Proceso de verificación:
--   1. Prevenir ciclos: Si el nivel ya fue verificado -> False
--   2. Buscar regla: Encontrar regla que otorgue el acceso solicitado
--   3. Validar requisitos: Todos deben cumplirse recursivamente
probar :: BC -> Goal -> [Goal] -> Bool
probar _ goal visitados  
  | goal `elem` visitados = False  -- Evitar ciclos en cadenas de acceso
probar bc goal visitados = 
  any coincide bc 
    where
    coincide (cabeza :- cuerpo) =
        cabeza == goal && all (\subgoal -> probar bc subgoal (goal : visitados)) cuerpo

-- ============================================================================
-- BASE DE CONOCIMIENTO: SISTEMA DE SEGURIDAD CON NIVELES DE ACCESO
-- ============================================================================
-- Este sistema implementa control de acceso por niveles:
-- - Nivel 2: Requiere Nivel 1 Y autorización de limpieza de seguridad
-- - Nivel 1: Requiere autorización de limpieza de seguridad
-- - Limpieza de seguridad: Juan pasó esta verificación (hecho)
-- 
bcSeguridad :: BC
bcSeguridad = [
    -- REGLA 1: Acceso Nivel 2 para Juan requiere:
    --   1) Acceso Nivel 1, Y
    --   2) Limpieza de seguridad completada
    "acceso_nivel_2_juan" :- ["acceso_nivel_1_juan", "limpieza_seguridad_juan"],
    
    -- REGLA 2: Acceso Nivel 1 para Juan requiere:
    --   1) Limpieza de seguridad completada
    "acceso_nivel_1_juan" :- ["limpieza_seguridad_juan"],
    
    -- HECHO: Juan completó la limpieza de seguridad (verificado)
    "limpieza_seguridad_juan" :- []
    ]

-- ============================================================================
-- FUNCIÓN: main
-- ============================================================================
-- Propósito: Demostrar verificación de acceso escalonado con cadena
--            de requisitos de seguridad.
-- 
-- Explicación:
--   El programa verifica si Juan puede acceder al Nivel 2:
--   1. Necesita acceso_nivel_1_juan
--   2. Acceso_nivel_1 requiere limpieza_seguridad_juan
--   3. Limpieza_seguridad es un hecho (se comprueba)
--   4. También necesita limpieza_seguridad_juan directamente
--   5. Resultado: True (todos los requisitos se cumplen)
main :: IO ()
main = do   
    -- Consulta: ¿Tiene Juan acceso al Nivel 2?
    -- Resultado esperado: True (cumple todos los requisitos)
    let resultado = consultar bcSeguridad "acceso_nivel_2_juan"
    putStrLn $ "Consulta: consultar bcSeguridad \"acceso_nivel_2_juan\" -> " ++ show resultado
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()