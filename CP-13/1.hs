-- | Definición de la estructura de una Regla (Cláusula de Horn)
-- cuerpo: Lista de condiciones (literales negativos en forma clausada)
-- cabeza: Conclusión (literal positivo, opcional para permitir restricciones)
data Regla = Regla
    { cuerpo :: [String]    
    , cabeza :: Maybe String 
    } deriving (Show, Eq)

-- | Verifica si las premisas de una regla están contenidas en los hechos conocidos
aplicable :: [String] -> Regla -> Bool
aplicable hechos (Regla condiciones _) = all (`elem` hechos) condiciones
-- Definición de la base de conocimientos
reglaAcceso :: Regla
reglaAcceso = Regla ["admin", "token"] (Just "acceso") -- [cite: 97, 98]

hechoAdmin :: Regla
hechoAdmin = Regla [] (Just "admin") 

hechoToken :: Regla
hechoToken = Regla [] (Just "token") 

-- Verificación de aplicabilidad
-- Resultado esperado: True
evaluacion = aplicable ["admin", "token"] reglaAcceso 

main :: IO ()
main = do   
    putStrLn $ "Regla de acceso: " ++ show reglaAcceso
    putStrLn $ "Hecho admin: " ++ show hechoAdmin
    putStrLn $ "Hecho token: " ++ show hechoToken    
    putStrLn $ "¿Es aplicable la regla de acceso? " ++ show evaluacion  
    putStrLn "Presione una tecla para finalizar..."
    _ <- getLine
    return ()
