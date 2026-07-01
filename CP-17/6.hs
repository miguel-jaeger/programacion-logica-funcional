import Data.Char (toLower)

esAptoParaCocina :: Int -> Bool -> Bool
esAptoParaCocina stock categoriaOk = 
    all (== True) [stock > 0, categoriaOk] -- Conjunción de premisas 
    
main :: IO ()
main = do
    putStrLn "Ingrese el stock del ingrediente:"
    stockInput <- getLine
    let stock = read stockInput :: Int

    putStrLn "¿El ingrediente pertenece a la categoría correcta? (s/n)"
    categoriaInput <- getLine
    let categoriaOk = map toLower categoriaInput == "s" -- Evaluación booleana precisa

    if esAptoParaCocina stock categoriaOk
        then putStrLn "El ingrediente es apto para la cocina."
        else putStrLn "El ingrediente no es apto para la cocina."