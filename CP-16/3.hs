type Habilidades = [String]

esEdadValida :: Int -> Bool
esEdadValida edad
    | edad >= 18 && edad <= 55 = True  -- Filtro activo
    | otherwise                = False -- Poda inmediata

esCandidatoApto :: Int -> Habilidades -> Bool
esCandidatoApto edad habs = 
    all (== True) [esEdadValida edad, any (== "Haskell") habs]
main :: IO ()
main = do    
    putStrLn "Ingrese su edad:"
    inputEdad <- getLine
    let edad = read inputEdad :: Int
    
    putStrLn "Ingrese sus habilidades (separadas por espacios):"
    inputHabs <- getLine
    let habilidades = words inputHabs
    
    if esCandidatoApto edad habilidades
        then putStrLn "Candidato apto. Puede continuar."
        else putStrLn "Candidato no apto. No puede continuar."
    putStrLn "Presione una tecla apra finalizar..."   
    _ <- getLine
    return ()