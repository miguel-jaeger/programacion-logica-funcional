import Data.Char (toUpper)

enMayusculas :: String -> String
enMayusculas = map toUpper

buscarYConvertir :: [String] -> String -> [String]
buscarYConvertir lista palabra = 
    map (\w -> if w == palabra then enMayusculas w else w) lista

main :: IO ()
main = do
    putStrLn "Escribe una lista de palabras separadas por espacios:"
    inputLista <- getLine
    let lista = words inputLista

    putStrLn "Escribe la palabra a buscar y convertir a mayúsculas:"
    palabra <- getLine

    let resultado = buscarYConvertir lista palabra
    putStrLn $ "Lista resultante: " ++ unwords resultado
