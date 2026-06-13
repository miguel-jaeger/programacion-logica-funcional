type Atomo = String
data Clausula = Atomo :- [Atomo] -- Constructor infijo: Cabeza :- Cuerpo
type BC = [Clausula]
-- Ejemplo de base de conocimiento
bc :: BC
bc = [ "p" :- ["q", "r"],
       "q" :- ["s"],
       "r" :- [],
       "s" :- [] ]
-- Función para obtener la cabeza de una cláusula
cabeza :: Clausula -> Atomo
cabeza (a :- b) = a
-- Función para obtener el cuerpo de una cláusula
cuerpo :: Clausula -> [Atomo]
cuerpo (a :- b) = b
-- Función para buscar una cláusula por su cabeza en la base de conocimiento
buscarClausula :: Atomo -> BC -> Maybe Clausula
buscarClausula a [] = Nothing
buscarClausula a (c:cs)
    | cabeza c == a = Just c
    | otherwise = buscarClausula a cs   
-- Función para resolver una consulta dada una base de conocimiento 
resolver :: Atomo -> BC -> Bool
resolver a bc = case buscarClausula a bc of
    Nothing -> False -- No se encontró la cláusula, no se puede resolver
    Just c -> all (`resolver` bc) (cuerpo c) -- Resuelve el cuerpo de la cláusula   
-- Ejemplo de uso
main :: IO ()
main = do
    let consulta = "q"
    if resolver consulta bc
        then putStrLn $ "La consulta '" ++ consulta ++ "' es verdadera."
        else putStrLn $ "La consulta '" ++ consulta ++ "' es falsa."
    
    putStrLn "Presione una tecla para finalizar."   
    _ <- getLine
    return ()
    
    