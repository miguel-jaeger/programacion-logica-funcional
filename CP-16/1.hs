esEdadValida :: Int -> Bool
esEdadValida edad
    | edad >= 18 && edad <= 55 = True  -- Filtro activo
    | otherwise                = False -- Poda inmediata

main = do
    putStrLn "Ingrese su edad:"
    input <- getLine
    let edad = read input :: Int
    if esEdadValida edad
        then putStrLn "Edad válida. Puede continuar."
        else putStrLn "Edad no válida. No puede continuar."