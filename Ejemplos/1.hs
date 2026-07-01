-- Representación de la ontología de términos
data Termino = Atomo String
    | Numero Int 
    | Variable String 
    | Lista [Termino] 
    deriving (Show, Eq)

-- Predicados Metalógicos de Clasificación
esConstante :: Termino -> Bool
esConstante (Atomo _) = True
esConstante (Numero _) = True
esConstante _ = False -- Si es Variable o Lista, no es una constante simple

-- Implementación de un filtro de seguridad
validarDato :: Termino -> String
validarDato t
    | esConstante t = "Dato listo para procesar."
    | otherwise     = "Error: Se requiere instanciar la variable o expandir la lista."
-- Ejemplo de uso
main :: IO ()
main = do
    let dato1 = Atomo "Hola"
    let dato2 = Variable "X"
    let dato3 = Lista [Atomo "A", Numero 5]

    putStrLn $ validarDato dato1 -- Dato listo para procesar.
    putStrLn $ validarDato dato2 -- Error: Se requiere instanciar la variable o expandir la lista.
    putStrLn $ validarDato dato3 -- Error: Se requiere instanciar la variable o expandir la lista.
