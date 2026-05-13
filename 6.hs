nombresCortos :: [String] -> [(String, Int)]
nombresCortos lista = [(n, length n) | n <- lista, length n < 5]

-- Variante con filter
nombresCortosFilter :: [String] -> [(String, Int)]
nombresCortosFilter lista = map (\n -> (n, length n)) (filter (\n -> length n < 5) lista)

main :: IO ()
main = do   
   -- let nombres = ["Ana", "Luis", "Pedro", "Eva", "Juan"]
    putStrLn "Escriba la lista de nombres separadas por espacios:"
    input <- getLine
    let nombres = map read (words input) :: [String]
    let resultado = nombresCortos nombres
    putStrLn $ "Los nombres cortos y sus longitudes son: " ++ show resultado