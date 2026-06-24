-- ============================================================================
-- SISTEMA DE REGLAS Y MOTOR DE INFERENCIA PARA DIAGNÓSTICO TÉCNICO
-- ============================================================================
-- Este programa implementa un sistema experto para diagnóstico de problemas
-- de soporte técnico usando encadenamiento hacia atrás.

-- Definimos el operador infijo :- para representar reglas de diagnóstico
infix 5 :-
data Rule = String :- [String]  -- Regla: síntoma/conclusión :- [causas posibles]

-- Alias de tipos
type BC = [Rule]      -- Base de Conocimiento (reglas de diagnóstico)
type Goal = String    -- Objetivo: problema a diagnosticar

-- ============================================================================
-- FUNCIÓN: consultar
-- ============================================================================
-- Propósito: Consultar si un problema de soporte técnico puede ser diagnosticado
--            basándose en los síntomas conocidos.
-- 
-- Tipo: consultar :: BC -> Goal -> Bool
-- 
-- Parámetros:
--   - bc: Base de conocimiento con reglas de diagnóstico
--   - goal: Problema a diagnosticar (ej: "falla_encendido")
-- 
-- Retorna: Bool - True si el problema puede diagnosticarse
consultar :: BC -> Goal -> Bool
consultar bc goal = probar bc goal []

-- ============================================================================
-- FUNCIÓN: probar
-- ============================================================================
-- Propósito: Motor de inferencia que realiza diagnóstico encadenando síntomas
--            hacia atrás para encontrar causas raíz.
-- 
-- Tipo: probar :: BC -> Goal -> [Goal] -> Bool
-- 
-- Parámetros:
--   - bc: Base de conocimiento con reglas de diagnóstico
--   - goal: Síntoma/problema actual a investigar
--   - visitados: Síntomas ya investigados (previene ciclos diagnósticos)
-- 
-- Retorna: Bool - True si el problema puede diagnosticarse
-- 
-- Estrategia diagnóstica:
--   1. Prevenir bucles: Si el síntoma ya fue investigado -> False
--   2. Buscar causas posibles: Encontrar reglas que expliquen el síntoma
--   3. Verificar causas: Todas las causas posibles deben verificarse
probar :: BC -> Goal -> [Goal] -> Bool
probar _ goal visitados  
  | goal `elem` visitados = False  -- Evitar ciclos en el diagnóstico
probar bc goal visitados = 
  any coincide bc 
    where
    coincide (cabeza :- cuerpo) =
        cabeza == goal && all (\subgoal -> probar bc subgoal (goal : visitados)) cuerpo

-- ============================================================================
-- BASE DE CONOCIMIENTO: SISTEMA DE DIAGNÓSTICO TÉCNICO
-- ============================================================================
-- Este sistema diagnostica problemas de dispositivos:
-- - El encendido falla si hay problema de energía O si el botón está roto
-- - Hay problema de energía si no hay luz Y no hay batería
-- - Se confirmó que no hay luz (hecho observado)
-- 
bcSoporte :: BC
bcSoporte = [
    -- REGLA 1: Falla en encendido por problema de energía
    -- (Primera alternativa de diagnóstico)
    "falla_encendido" :- ["falla_energia"],
    
    -- REGLA 2: Falla en encendido por botón roto
    -- (Segunda alternativa de diagnóstico)
    "falla_encendido" :- ["boton_roto"],
    
    -- REGLA 3: Hay falla de energía si:
    --   1) No hay luz, Y
    --   2) No hay batería
    "falla_energia" :- ["sin_luz", "sin_bateria"],
    
    -- HECHO: Se observó que no hay luz (hecho confirmado)
    "sin_luz" :- []
  ]

-- ============================================================================
-- FUNCIÓN: main
-- ============================================================================
-- Propósito: Demostrar el motor de inferencia en diagnóstico técnico.
-- 
-- Explicación:
--   El programa intenta diagnosticar "falla_encendido":
--   1. Primera opción: Necesita "falla_energia"
--   2. Para "falla_energia" necesita "sin_luz" Y "sin_bateria"
--   3. "sin_luz" se comprueba (es un hecho)
--   4. Pero "sin_bateria" no tiene regla que lo compruebe -> False
--   5. Retorna False (no puede diagnosticar con los hechos disponibles)
main :: IO ()
main = do   
    -- Consulta: ¿Existe falla en el encendido?
    -- Resultado esperado: False (no se pueden demostrar todas las causas)
    let resultado = consultar bcSoporte "falla_encendido"
    putStrLn $ "Consulta: consultar bcSoporte \"falla_encendido\" -> " ++ show resultado
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()  