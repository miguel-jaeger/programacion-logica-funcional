analizarStock :: String -> String
analizarStock cadena
    | len == 0 = "Vacío"
    | len < 5 = "Crítico"
    | otherwise = "Óptimo"
    where
    len = length cadena

main :: IO ()
main = do
    putStrLn "Ingrese la cadena de stock:"    
    input <- getLine
    let resultado = analizarStock input
    putStrLn $ "El análisis del stock es: " ++ resultado
    return ()