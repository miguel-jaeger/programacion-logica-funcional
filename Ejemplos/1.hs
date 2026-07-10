-- 1. Representación de Datos (Átomos y Listas)
-- Usamos una lista de habilidades como una colección de hechos
type Habilidades = [String]
type Habilidad = String

{--habilidadesRequeridas :: [String]
habilidadesRequeridas = ["Haskell", "Prolog", "Lógica"]--}

-- 2. Predicado Numérico con Guardas
-- Las guardas funcionan como precondiciones de una cláusula
esEdadValida :: Int -> Bool
esEdadValida edad
    | edad >= 18 && edad <= 55 = True  -- Filtro lógico aritmético 
    | otherwise = False

-- 3. Motor de Búsqueda (Uso de all/any)
-- 'all' valida que todas las premisas sean verdaderas (Conjunción).
-- 'any' gestiona el Backtracking al buscar en la lista de hechos.
esCandidatoApto :: Int -> Habilidad->Habilidades -> Bool
esCandidatoApto edad hab habs = 
    all (==True) [esEdadValida edad, any (==hab) habs]

main :: IO ()
main = do
   -- let edadMiguel = 30
    putStrLn "Diga su edad"
    input1 <- getLine
    let edadMiguel = read input1 :: Int

    putStrLn "Diga la habilidad a buscar"
    habilidad <- getLine
    
    --let habilidadesMiguel = ["C++", "Prolog", "Haskell"]
    putStrLn("Diga sus habilidades separadas por espacio")
    input<-getLine
    let habilidadesMiguel= words input::[String]
    putStrLn("Lista de habilidades de Miguel"++ show habilidadesMiguel)
    let esApto = esCandidatoApto edadMiguel habilidad habilidadesMiguel
    let msg= if esApto
        then  "Si cumple."
        else  "No cumple."
    putStrLn $ "¿Miguel es un candidato apto? " ++ msg
