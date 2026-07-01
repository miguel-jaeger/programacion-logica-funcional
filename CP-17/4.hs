soloPreciosValidos :: [Int] -> [Int]
soloPreciosValidos [] = []
soloPreciosValidos (p:ps)
    | p > 0     = p : soloPreciosValidos ps
    | otherwise = soloPreciosValidos ps -- Poda inmediata de valores basura 

main :: IO ()
main = do
    let precios = [10, -5, 20, 0, 15]
    putStrLn "Ingrese el listado de precios separados por espacio:"
    input <- getLine
    let precios = map read (words input) :: [Int]
    let preciosValidos = soloPreciosValidos precios
    putStrLn "Precios válidos:"
    print preciosValidos