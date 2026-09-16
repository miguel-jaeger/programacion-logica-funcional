gestionStock :: Int -> IO ()
gestionStock actual = do
    putStrLn $ "Stock actual: " ++ show actual ++ ". 1. Retirar | 0. Salir"
    op <- getLine
    case op of
        "1" -> do
            putStrLn "Cantidad:"
            c <- getLine
            let cant = read c
            if cant > actual then error "Insuficiente" else gestionStock (actual - cant)
        "0" -> putStrLn "Cerrando..."
        _   -> gestionStock actual

main :: IO ()
main = do
    putStrLn "Ingrese stock inicial:"
    s <- getLine
    let stockInicial = read s
    gestionStock stockInicial
    putStrLn ("Stock final: " ++ show stockInicial)


    putStrLn "Presione una tecla para salir..."
    _ <- getLine
    return ()


