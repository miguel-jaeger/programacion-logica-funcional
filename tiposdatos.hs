main :: IO ()
main = do
    putStrLn "Tipos de Datos en Haskell"    
    let nombre :: String
        nombre = "Juan"
    let edad :: Int
        edad = 25   

    putStrLn ("Mi nombre es: " ++ nombre ++" y tengo " ++ show edad ++ " años.")
    putStrLn "Presiona Enter para finalizar..."
    _ <- getLine
    return ()
