-- Definición del predicado según la lógica de primer orden [cite: 136]
esEstudiante :: String -> Bool
esEstudiante "Juan" = True -- Solo Juan es estudiante, el resto no lo es
esEstudiante _      = False -- Cualquier otro nombre no es estudiante

-- Función principal obligatoria para la ejecución [cite: 252]
main :: IO ()
main = do
    -- Demostración de Conjunción Perezosa 
    -- Si el primer operando es False, el segundo (con error) no se evalúa.
    let p1 = esEstudiante "Pedro"
    let p2 = error "¡Esto no debería evaluarse!"
    
    putStrLn "--- Prueba de Conjunción Perezosa ---"
    putStrLn $ "¿Ambos son estudiantes? " ++ show (p1 && p2)
    putStrLn "El programa no falló porque p1 es False."