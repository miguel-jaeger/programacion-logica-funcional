procesarUsuarios :: String -> [(Int, String)]
procesarUsuarios entrada = 
    let ids = map read (words entrada) :: [Int] -- Paso 1 
        validos = filter (/= 0) ids             -- Paso 2 
    in map (\id -> (id, "Verificado")) validos  -- Paso 3 

main :: IO ()
main = do
    putStrLn "Ingrese IDs de usuarios (ej: 101 0 202):"
    input <- getLine
    let resultado = procesarUsuarios input
    print resultado
    putStrLn "Usuarios procesados exitosamente."
    putStrLn "Presione una tecla para finalizar."
    _ <- getLine 
    return ()