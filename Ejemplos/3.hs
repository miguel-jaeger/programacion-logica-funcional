-- Representación básica de términos (similar a un lenguaje lógico)
data Termino
    = Atomo String        -- Constante simbólica
    | Numero Int          -- Valor numérico
    | Variable String     -- Variable lógica
    | Lista [Termino]     -- Lista de términos
    deriving (Show, Eq)

-- Representa un término simple o una estructura compuesta
data TerminoComplejo
    = Simple Termino
    | Estructura String [Termino]  -- Nombre del functor y argumentos
    deriving (Show, Eq)

-- Tipos posibles de respuesta del motor
data Respuesta
    = Ejecutado String
    | Valor Int
    | Error String
    deriving Show

-- Motor metalógico que interpreta dinámicamente el término
ejecutarMeta :: TerminoComplejo -> Respuesta

-- Caso 1: átomo específico que representa una acción
ejecutarMeta (Simple (Atomo "imprimir_menu")) =
    Ejecutado "Mostrando el menú de platos..."

-- Caso 2: si el término es un número, simplemente lo devuelve
ejecutarMeta (Simple (Numero n)) =
    Valor n

-- Caso 3: estructura bien formada "pedido" con exactamente 2 argumentos
-- patrón: pedido(Plato, Cantidad)
ejecutarMeta (Estructura "pedido" [Atomo plato, Numero cantidad]) =
    Ejecutado ("Procesando pedido: " ++ show cantidad ++ "x " ++ plato)

-- Caso por defecto: poda lógica (fallback)
ejecutarMeta _ =
    Error "Meta no reconocida o mal formada"

-- Programa principal
main :: IO ()
main = do
    -- Pedido correcto (2 argumentos como exige el patrón)
    let pedido1 = Estructura "pedido" [Atomo "Ceviche", Numero 2]

    putStrLn "Analizando la estructura del pedido..."
    putStrLn $ "Estructura: " ++ show pedido1

    -- Se ejecuta el motor metalógico
    print $ ejecutarMeta pedido1

    putStrLn "Presione Enter para continuar..."
    _ <- getLine
    return ()