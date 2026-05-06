puntos = [10,20..100]
 
main :: IO ()
main = menuPuntos 0
 
menuPuntos :: Int -> IO ()
menuPuntos acumulado = do
    putStrLn $ "\nPuntos acumulados hoy: " ++ show acumulado
    putStrLn "1. Consultar Puntos | 2. Ver Total Niveles | 3. Sumar | 4. Ver Lista | 0. Salir"
    op <- getLine
    case op of
        "1" -> do { putStrLn "Punto a buscar:"; p <- getLine; 
                    print (elem (read p :: Int) puntos); menuPuntos acumulado }
        "2" -> do { print (length puntos); menuPuntos acumulado }
        "3" -> do
            putStrLn "Ingrese puntos obtenidos:"
            m <- getLine
            let p = read m :: Int
            if p < 0 then error "Valor negativo" else menuPuntos (acumulado + p)
        "4"-> do{putStrLn "Lista generada:"; print puntos; menuPuntos acumulado}
            
        "0" -> putStrLn "Sesion cerrada."
        _   -> do { putStrLn "Opcion invalida"; menuPuntos acumulado }