-- Predicado lógico-aritmético para evaluar crédito
esAptoCredito :: Int -> Float -> Bool
esAptoCredito edad salario
    | edad >= 18 && salario > 2500.0 = True
    | otherwise                      = False -- Cláusula de falla (negación)

-- Aplicación en una BC (Base de Conocimientos):
main :: IO ()
main = do
    -- Ingresar datos de ejemplo para evaluar el predicado
    putStrLn "Evaluando aptitud para crédito..."
    putStrLn "Ingrese edad: "
    edad <- readLn :: IO Int
    putStrLn "Ingrese salario: "
    salario <- readLn :: IO Float
    let resultado = esAptoCredito edad salario
    putStrLn $ "¿Es apto para crédito? " ++ show resultado

    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()