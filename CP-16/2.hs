type Habilidades = [String]

verificarHabilidad :: Habilidades -> Bool
verificarHabilidad habs = any (== "Haskell") habs

main :: IO ()
main = do
    putStrLn "Ingrese sus habilidades (separadas por espacios):"
    input <- getLine
    let habilidades = words input
    if verificarHabilidad habilidades
        then putStrLn "Habilidad válida encontrada. Puede continuar."
        else putStrLn "Habilidad no válida. No puede continuar."