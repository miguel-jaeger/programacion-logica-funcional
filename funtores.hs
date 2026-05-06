precios = [100.0, 200.0, 300.0]
preciosRebajados = fmap (* 0.85) precios 

main :: IO ()
main = do
    putStrLn $ "Precios originales: " ++ show precios
    putStrLn $ "Precios con rebaja del 15%: " ++ show preciosRebajados
    putStrLn "Presione Enter para terminar..."
    getLine_ <- getLine
    return ()
