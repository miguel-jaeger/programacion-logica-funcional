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


filtrarComanda :: [Termino] -> [String]
filtrarComanda [] = []
filtrarComanda (t:ts)
    | esAtomo t = let (Atomo plato) = t in plato : filtrarComanda ts -- Éxito
    | otherwise = filtrarComanda ts -- Poda: El término no es procesable en este nivel

main :: IO ()
main = do
    let comanda = [Atomo "Ceviche", Numero 2, Atomo "Arroz con Mariscos", Variable "X", Atomo "Lomo Saltado"]
    putStrLn "Filtrando la comanda para obtener solo los platos..."
    print $ filtrarComanda comanda -- Debería imprimir ["Ceviche", "Arroz con Mariscos", "Lomo Saltado"]
    putStrLn "Presione Enter para continuar..."
    _ <- getLine
    return ()
