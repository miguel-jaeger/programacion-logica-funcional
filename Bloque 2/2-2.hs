procesarCola :: [Double] -> [Double]
procesarCola lista = (head sublista + 10.0) : tail sublista
    where
    sublista = tail lista
main :: IO ()
main = do
    putStrLn "Ingrese una lista de números decimales separados por espacios:"    
    input <- getLine
    let numeros = map read (words input) :: [Double]
    let resultado = procesarCola numeros
    putStrLn $ "El resultado de procesar la cola es: " ++ show resultado
    return ()