-- | Definición de la estructura de una Regla (Cláusula de Horn)
-- cuerpo: Lista de condiciones (literales negativos en forma clausada)
-- cabeza: Conclusión (literal positivo, opcional para permitir restricciones)
data Regla = Regla
    { cuerpo :: [String]    
    , cabeza :: Maybe String 
    } deriving (Show, Eq)
    
-- | COMPONENTE DE CONTROL: Verifica si una regla es disparable 
-- Comprueba si el conjunto de hechos actuales satisface todas las premisas 
aplicable :: [String] -> Regla -> Bool
aplicable hechos (Regla condiciones _) = all (`elem` hechos) condiciones 

-- | MOTOR DE INFERENCIA: Realiza una pasada sobre las reglas 
-- Extrae conclusiones nuevas que no estaban en la base de hechos inicial 
inferir :: [String] -> [Regla] -> [String]
inferir hechos reglas =
    [ h | r@(Regla _ (Just h)) <- reglas  -- Selecciona reglas con conclusión 
        , aplicable hechos r              -- Filtra las que cumplen sus premisas 
        , h `notElem` hechos ]            -- Evita redundancia (hechos nuevos) 
-- Definición de las reglas de inferencia 
r1 = Regla ["soleado"] (Just "calor")
r2 = Regla ["calor"] (Just "helado")
r3 = Regla ["viento"] (Just "frio")


-- Ejecución del motor [cite: 116]
-- Resultado esperado: ["calor"]
resultadoPasada1 = inferir ["viento"] [r1, r2, r3] 

main :: IO ()
main = do   
    putStrLn $ "Regla 1: " ++ show r1
    putStrLn $ "Regla 2: " ++ show r2
    putStrLn $ "Regla 3: " ++ show r3
    putStrLn $ "Resultado de la pasada 1: " ++ show resultadoPasada1
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()