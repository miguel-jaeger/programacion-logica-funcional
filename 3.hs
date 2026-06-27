evaluarRango :: Int -> String
evaluarRango n = 
    if n > 100 
        then "Alto" 
        else if n < 0 
            then "Negativo" 
            else "Normal"

main :: IO ()
main = do
    putStrLn "Introduzca el valor del rango:"
    entrada <- getLine
    let valor = read entrada :: Int
    putStrLn (evaluarRango valor)
    putStrLn "Presione una tecla para finalizar."
    _ <- getLine
    return ()