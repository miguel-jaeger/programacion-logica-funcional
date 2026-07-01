--categoriasPrioridad = ["Salud", "Alimentos", "Seguridad"]

puedeDespachar :: Int -> String -> [String] -> Bool
puedeDespachar stock cat lista = stock > 0 && elem cat lista

main :: IO ()
main = do
    putStrLn "Ingrese el stock disponible: "
    stock <- readLn :: IO Int
    putStrLn "Ingrese la lista de categorias disponibles: "
    categorias <- getLine
    
    let categoriasPrioridad = words categorias
    putStrLn "Ingrese la categoría del producto (Salud, Alimentos, Seguridad): "
    categoria <- getLine
    let resultado = puedeDespachar stock categoria categoriasPrioridad
    putStrLn $ "¿Puede despachar el producto? " ++ show resultado

    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()