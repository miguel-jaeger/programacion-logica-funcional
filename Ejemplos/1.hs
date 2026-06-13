import GHC.Internal.System.Posix.Internals (puts)
-- | Definición de la estructura de una Regla en el sistema
-- Utiliza un registro para separar condiciones (cuerpo) de la consecuencia (cabeza)
data Regla = Regla
    { cuerpo :: [String]    -- Premisas: Lista de hechos que deben ser ciertos
    , cabeza :: Maybe String -- Conclusión: Hecho derivado (o 'Nothing' si es restricción)
    } deriving Show

-- | HECHO: Regla con cuerpo vacío (axioma)
-- Representa una afirmación inicial en la base de conocimientos
hecho :: Regla
hecho = Regla [] (Just "HumanoSocrates")

-- | REGLA DE INFERENCIA: Implicación lógica convencional
-- Representa: "Si HumanoSocrates es verdadero, entonces MortalSocrates es verdadero"
regla :: Regla
regla = Regla ["HumanoSocrates"] (Just "MortalSocrates")

-- | RESTRICCIÓN DE INTEGRIDAD: Define una inconsistencia
-- No genera nuevos hechos; se usa para validar que P y Q no coexistan
restriccion :: Regla
restriccion = Regla ["P", "Q"] Nothing

-- | COMPONENTE DE CONTROL: Verifica si una regla es disparable
-- Comprueba si el conjunto de hechos actuales satisface todas las premisas del cuerpo
aplicable :: [String] -> Regla -> Bool
aplicable hechos (Regla cuerpo _) = all (`elem` hechos) cuerpo

-- | MOTOR DE INFERENCIA (Encadenamiento hacia adelante)
-- Realiza una pasada sobre las reglas para extraer nuevas conclusiones no conocidas
inferir :: [String] -> [Regla] -> [String]
inferir hechos reglas =
    [ h | r@(Regla _ (Just h)) <- reglas  -- Selecciona reglas con conclusión (cabeza)
        , aplicable hechos r              -- Filtra las que cumplen sus premisas
        , h `notElem` hechos ]            -- Evita redundancia (el hecho no debe existir ya)

main :: IO ()
main = do
    let hechosIniciales = ["HumanoSocrates"]  -- Hechos conocidos inicialmente
    let reglas = [hecho, regla, restriccion]  -- Conjunto de reglas en el sistema
    let nuevosHechos = inferir hechosIniciales reglas  -- Inferencia de nuevos hechos
    putStrLn "Hechos iniciales:"
    print hechosIniciales
    putStrLn "Nuevos hechos inferidos:"
    print nuevosHechos
    putStrLn "Restricción de integridad (P y Q no pueden coexistir):"
    print restriccion
    putStrLn "Inferirencia completa. Verificar si la restricción se cumple..."
    print $ aplicable ["P", "Z"] restriccion  -- Verifica si la restricción se viola
    putStrLn "Fin del programa de inferencia."
    _ <- getLine  -- Espera para mantener la consola abierta
    return ()