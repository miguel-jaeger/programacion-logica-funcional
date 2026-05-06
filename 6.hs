nombresCortos :: [String] -> [(String, Int)]
nombresCortos lista = [(n, length n) | n <- lista, length n < 5]
main :: IO ()
main = do   
    let nombres = ["Ana", "Luis", "Pedro", "Eva", "Juan"]
    let resultado = nombresCortos nombres
    putStrLn $ "Los nombres cortos y sus longitudes son: " ++ show resultado