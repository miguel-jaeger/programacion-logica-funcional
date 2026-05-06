import Data.Char (isDigit)
esNumerica :: String -> Bool
esNumerica [] = False
esNumerica s  = all isDigit s    -- Uso de all de alto nivel
main :: IO ()
main = do
    let cadena = "12345"
    let resultado = esNumerica cadena
    putStrLn $ "¿La cadena es numérica? " ++ show resultado