data Estructura = Estructura { argumentos :: [String] }

-- La aridad es el número de argumentos
obtenerAridad :: Estructura -> Int
obtenerAridad e = length (argumentos e)

totalArgumentos :: [Estructura] -> Int
totalArgumentos [] = 0
totalArgumentos (e:es) = obtenerAridad e + totalArgumentos es

main :: IO ()
main = do
    let e1 = Estructura ["a","b"]        -- aridad 2
    let e2 = Estructura ["x"]            -- aridad 1
    let e3 = Estructura ["p","q","r"]    -- aridad 3

    let lista = [e1, e2, e3]

    putStrLn $ "Aridad de e1: " ++ show (obtenerAridad e1)
    putStrLn $ "Aridad de e2: " ++ show (obtenerAridad e2)
    putStrLn $ "Aridad de e3: " ++ show (obtenerAridad e3)    

    putStrLn $ "Carga total de trabajo: " ++ show (totalArgumentos lista)