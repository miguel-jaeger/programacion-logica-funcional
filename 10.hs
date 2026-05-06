import Data.Char (toUpper)
-- Implementación combinando filter y map
procesarPares :: [String] -> [String]
procesarPares lista = map (map toUpper) (filter (even . length) lista)
main :: IO ()
main = do   
    let lista = ["uno", "dos", "tres", "cuatro", "cinco"]
    let resultado = procesarPares lista
    putStrLn $ "Los pares en mayúsculas son: " ++ show resultado