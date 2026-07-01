-- 1. Representación de Datos (Átomos y Listas)
-- Usamos una lista de habilidades como una colección de hechos
type Habilidades = [String]
habilidadesRequeridas :: [String]
habilidadesRequeridas = ["Haskell", "Prolog", "Lógica"]

-- 2. Predicado Numérico con Guardas
-- Las guardas funcionan como precondiciones de una cláusula
esEdadValida :: Int -> Bool
esEdadValida edad
    | edad >= 18 && edad <= 55 = True  -- Filtro lógico aritmético 
    | otherwise = False

-- 3. Motor de Búsqueda (Uso de all/any)
-- 'all' valida que todas las premisas sean verdaderas (Conjunción).
-- 'any' gestiona el Backtracking al buscar en la lista de hechos.
esCandidatoApto :: Int -> Habilidades -> Bool
esCandidatoApto edad habs = 
    all (==True) [esEdadValida edad, any (=="Haskell") habs]

main :: IO ()
main = do
    let edadMiguel = 30
    let habilidadesMiguel = ["C++", "Prolog", "Haskell"]
    let esApto = esCandidatoApto edadMiguel habilidadesMiguel
    putStrLn $ "¿Miguel es un candidato apto? " ++ show esApto