evaluarDescuento :: Int -> String
evaluarDescuento edad
    | edad < 0          = error "Edad no valida"
    | edad <= 12        = "Descuento Ninos: 50%"
    | edad >= 65        = "Descuento Adulto Mayor: 40%"
    | otherwise         = "Precio Regular"
main :: IO ()
main = do
    -- Pedir la edad del cliente por teclado
    putStrLn "Ingrese la edad del cliente:"
    input <- getLine
    let edad = read input :: Int
    let descuento = evaluarDescuento edad
    putStrLn $ "El descuento aplicable es: " ++ descuento   
    
    putStrLn "Presione una tecla para terminar..."
    _ <- getLine
    return ()
