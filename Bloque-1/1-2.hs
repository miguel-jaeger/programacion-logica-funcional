evaluarNota :: Double -> String
evaluarNota notaIngresada
    | notaFinal < 10.5 = "Reprobado"
    | notaFinal <= 14.0 = "Regular"
    | otherwise = "Destacado"
    where
    notaFinal = notaIngresada + 1.0
main :: IO ()
main = do
    putStrLn "Ingrese la nota del estudiante:"    
    input <- getLine
    let nota = read input :: Double
    let resultado = evaluarNota nota
    putStrLn $ "El resultado de la evaluación es: " ++ resultado
    return ()