type Atomo = String
data Clausula = Atomo :- [Atomo] -- Constructor infijo: Cabeza :- Cuerpo
type BC = [Clausula]

-- Función principal: Busca si existe AL MENOS UNA rama de éxito
consultar :: BC -> Atomo -> Bool
consultar bc objetivo = any (demostrar bc) reglasCoincidentes  
    where
        -- Filtramos cláusulas cuya cabeza unifica con el objetivo
        reglasCoincidentes = [r | r@(h :- _) <- bc, h == objetivo]
--Función auxiliar: Verifica si TODAS las premisas del cuerpo son ciertas
demostrar :: BC -> Clausula -> Bool
demostrar bc (_ :- []) = True -- Caso base: Es un hecho (sin premisas)
demostrar bc (_ :- cuerpo) = all (consultar bc) cuerpo

-- Ejemplo de base de conocimiento
bc :: BC
bc =    [ "p" :- ["q", "r"],
    "q" :- ["s"],
    "r" :- [],
    "s" :- [] ]
-- Ejemplo de consulta
main :: IO ()
main = do   
    let consulta = "q"
    if consultar bc consulta
        then putStrLn $ "La consulta '" ++ consulta ++ "' es verdadera."
        else putStrLn $ "La consulta '" ++ consulta ++ "' es falsa."
    
    putStrLn "Presione una tecla para finalizar."   
    _ <- getLine
    return ()   

