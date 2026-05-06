main :: IO ()
main = do
    putStrLn "Hola Haskell"
    putStrLn "Presiona Enter para finalizar..."
    _ <- getLine
    return ()
