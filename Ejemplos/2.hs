-- Representación de la ontología de términos
data Termino = Atomo String
    | Numero Int 
    | Variable String 
    | Lista [Termino] 
    deriving (Show, Eq)

-- Extendemos nuestro ADT para incluir estructuras complejas
data TerminoComplejo = Simple Termino 
                    | Estructura String [Termino] 
                    deriving (Show, Eq)

-- Emulación de los predicados 'functor' y 'arity'
analizarEstructura :: TerminoComplejo -> (String, Int)
analizarEstructura (Simple (Atomo n)) = (n, 0) -- Un átomo tiene aridad 0
analizarEstructura (Simple (Numero _)) = ("numero", 0)
analizarEstructura (Estructura nombre argumentos) = (nombre, length argumentos)

-- Aplicación Práctica:
-- let pedido1 = Estructura "pedido" [Atomo "Ceviche", Numero 2, Atomo "Mesa5"]
-- analizarEstructura pedido1 -> ("pedido", 3)
main :: IO ()
main = do
    let pedido1 = Estructura "pedido" [Atomo "Ceviche", Numero 2, Atomo "Mesa5"]
    putStrLn "Analizando la estructura del pedido..."
    putStrLn $ "Estructura: " ++ show pedido1
    print $ analizarEstructura pedido1 
    putStrLn "Presione Enter para continuar..."
    _ <- getLine
    return ()
