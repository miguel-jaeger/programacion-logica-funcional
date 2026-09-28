import Data.Char (isDigit)

esTelefono :: String -> Bool
esTelefono [] = False
--esTelefono s  = all isDigit s -- 'all' es una función de alto nivel sobre listas
esTelefono s  = length s == 9 && all isDigit s -- Verifica que tenga 9 dígitos y que todos sean dígitos
main :: IO ()
main = do
    let telefono1 = "1234567890"
    let telefono2 = "123-456-7890"
    let telefono3 = "abc1234567"
    
    putStrLn $ telefono1 ++ " es un teléfono válido: " ++ show (esTelefono telefono1)
    putStrLn $ telefono2 ++ " es un teléfono válido: " ++ show (esTelefono telefono2)
    putStrLn $ telefono3 ++ " es un teléfono válido: " ++ show (esTelefono telefono3)