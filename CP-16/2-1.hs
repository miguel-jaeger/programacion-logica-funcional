type Habilidades = [String]
type Habilidad = String

verificarHabilidad :: Habilidades -> Habilidad -> Bool
verificarHabilidad habs hab = any (== hab) habs

main :: IO ()
main = do
    putStrLn "Ingrese sus habilidades (separadas por espacios):"
    input <- getLine
    let habilidades = words input
    putStrLn "Ingrese la habilidad:"
    habilidad <- getLine
    if verificarHabilidad habilidades habilidad
        then putStrLn "Habilidad válida encontrada. Puede continuar."
        else putStrLn "Habilidad no válida. No puede continuar."