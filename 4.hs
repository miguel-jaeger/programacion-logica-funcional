import Data.Char (toUpper)

enMayusculas :: String -> String
enMayusculas cadena = map toUpper cadena
main :: IO ()
main = do
    let texto = "hola mundo"
    let resultado = enMayusculas texto
    putStrLn $ "El texto en mayúsculas es: " ++ resultado