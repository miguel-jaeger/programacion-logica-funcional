miLongitud :: [a] -> Int
miLongitud []     = 0                     -- Caso Base
miLongitud (_:xs) = 1 + miLongitud xs     -- Caso Recursivo: 1 más la longitud del resto

main :: IO ()
main = do
    let lista = ["uno", "dos", "tres", "cuatro"]
    let longitudLista = miLongitud lista
    putStrLn $ "La longitud de la lista es: " ++ show longitudLista