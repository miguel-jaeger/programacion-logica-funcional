-- Representación básica de términos (similar a un lenguaje lógico)
data Termino
    = Atomo String        -- Constante simbólica
    | Numero Int          -- Valor numérico
    | Variable String     -- Variable lógica
    | Lista [Termino]     -- Lista de términos
    deriving (Show, Eq)

esAtomo :: Termino -> Bool
esAtomo (Atomo _) = True
esAtomo _ = False

filtrarPlatos :: [Termino] -> [String]
filtrarPlatos [] = [] -- Caso Base 
filtrarPlatos (Atomo n : xs) = n : filtrarPlatos xs -- Caso Recursivo 
filtrarPlatos (_ : xs) = filtrarPlatos xs -- Poda (ignora el resto) 

main :: IO ()
main = do
    let menu = [Atomo "Pizza", Atomo "Pasta", Numero 5, Variable "X", Atomo "Ensalada"]
    let platos = filtrarPlatos menu
    putStrLn "Platos disponibles en el menú:"
    putStrLn $ unwords platos