import Data.Char (isDigit)
esNumerica :: String -> Bool
esNumerica [] = False
esNumerica s  = all isDigit s    -- Uso de all de alto nivel

-- variante con foldr
esNumericaFold :: String -> Bool
esNumericaFold s = foldr (\c acc -> isDigit c && acc) True s

main :: IO ()
main = do
    --let cadena = "12345"
    putStrLn "Escriba una cadena para verificar si es numérica:"
    input <- getLine
    let cadena = input
    let resultado = esNumerica cadena
    putStrLn $ "¿La cadena es numérica? " ++ show resultado