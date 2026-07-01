import Data.Char (toLower)


-- Función auxiliar para normalizar cadenas
normalizar :: String -> String
normalizar s = map toLower s

prioridad :: [String]
prioridad = ["Salud", "Alimentos", "Higiene", "Ropa", "Electrónica"] -- Hechos (Base de conocimiento)

esDespachable :: String -> Int -> Bool
esDespachable categoria stock
    | stock <= 0 = False                       -- Poda (Control de búsqueda)--| otherwise  = any (== categoria) prioridad -- Búsqueda en lista de hechos
    -- Si el stock es positivo, verificamos la categoría con normalización para evitar problemas de mayúsculas/minúsculas
    |otherwise = any (\p -> normalizar p == normalizar categoria) prioridad
main :: IO ()
main = do
    putStrLn "Ingrese la categoría del producto:"
    categoria <- getLine
    putStrLn "Ingrese el stock disponible:"
    inputStock <- getLine
    let stock = read inputStock :: Int
    if esDespachable categoria stock
        then putStrLn "Producto despachable. Puede continuar."
        else putStrLn "Producto no despachable. No puede continuar."