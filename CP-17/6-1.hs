import Data.Char (toLower)


-- Normaliza texto para comparación sin distinguir mayúsculas
normalizar :: String -> String
normalizar = map toLower

-- Verifica si el ingrediente existe en la lista
existeIngrediente :: String -> [String] -> Bool
existeIngrediente _ [] = False
existeIngrediente x (y:ys)
    | normalizar x == normalizar y = True
    | otherwise = existeIngrediente x ys

-- Evalúa si es apto: existe y tiene stock
esAptoParaCocina :: String -> Int -> [String] -> Bool
esAptoParaCocina nombre stock lista =
    existeIngrediente nombre lista && stock > 0

main :: IO ()
main = do
    --let ingredientesDisponibles = ["Tomate", "Queso", "Lechuga", "Cebolla"]

    putStrLn "Ingrese el listado de ingredientes:"
    input <- getLine
    let ingredientesDisponibles = words input

    putStrLn "Ingrese el nombre del ingrediente:"
    nombre <- getLine

    putStrLn "Ingrese la cantidad disponible:"
    cantidadInput <- getLine
    let cantidad = read cantidadInput :: Int

    if esAptoParaCocina nombre cantidad ingredientesDisponibles
        then putStrLn "El ingrediente está disponible y es apto para la cocina."
        else putStrLn "El ingrediente no está disponible o no tiene stock suficiente."