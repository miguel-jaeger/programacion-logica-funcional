import Data.Char (toUpper)

esValidoPorSexoYEdad :: Char -> Int -> Bool
esValidoPorSexoYEdad sexo edad
    | toUpper sexo == 'H' = edad >= 18 && edad <= 65
    | toUpper sexo == 'M' = edad >= 18 && edad <= 55
    | otherwise           = False

main :: IO ()
main = do
    putStrLn "Ingrese el sexo"
    sexoInput <- getLine

    let sexo = head sexoInput
    putStrLn "Ingrese su edad:"
    edadInput <- getLine

    let edad = read edadInput::Int

    let resultado = if esValidoPorSexoYEdad sexo edad
            then "Edad válida. Puede continuar."
            else "Edad no válida. No puede continuar."

    putStrLn resultado