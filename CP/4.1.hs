import Data.Char (toUpper)

enMayusculas :: String -> String
enMayusculas = map toUpper

mayusculas :: [Char] -> [Char]
mayusculas xs = fmap (toUpper) xs

buscarYConvertir :: [String] -> String -> [String]
buscarYConvertir lista palabra = 
    map (\w -> if w == palabra then enMayusculas w else w) lista

main :: IO ()
main = do
    putStrLn "Escribe una lista de palabras separadas por espacios:"
    inputLista <- getLine
    
    let aa = inputLista :: [Char]
    putStrLn ("Lista original: " ++ show aa)
    putStrLn ( "Lista resultante: " ++ mayusculas aa)
   -- putStrLn "Escribe la palabra a buscar y convertir a mayúsculas:"
--palabra <- getLine

    --let resultado = mayusculas aa 
   -- putStrLn ( "Lista resultante: " ++ resultado)
