import Data.Char (toLower)

-- Normaliza un String a minúsculas
normalizar :: String -> String
normalizar = map toLower

existeIngrediente :: String -> [String] -> Bool
existeIngrediente _ [] = False -- Caso Base 
existeIngrediente x (y:ys)
    | normalizar x == normalizar y    = True -- Éxito (Poda de búsqueda) 
    | otherwise = existeIngrediente x ys -- Backtracking manual 

main :: IO ()
main = do
    let ingredientes = ["Tomate", "Queso", "Lechuga", "Cebolla"]
    putStrLn "Ingrese el ingrediente a buscar:"
    ingrediente <- getLine
    if existeIngrediente ingrediente ingredientes
        then putStrLn $ ingrediente ++ " está disponible."
        else putStrLn $ ingrediente ++ " no está disponible."