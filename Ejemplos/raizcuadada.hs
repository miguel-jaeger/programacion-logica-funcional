-- calculo de raiz cuadrada de valor entrado por teclado
raizcuadrada::Int->Float
raizcuadrada x = sqrt (fromIntegral x)

main::IO()
main = do
    putStrLn "Ingrese un numero entero para calcular su raiz cuadrada:"
    entrada <- getLine
    let numero = read entrada :: Int    
    let resultado = if numero >= 0 
                    then raizcuadrada numero 
                    else error "Raiz compleja: No se puede calcular la raiz de un negativo"
 
    
    putStrLn ("La raiz cuadrada de " ++ show numero ++ " es " ++ show resultado)
    putStrLn "Presiona Enter para finalizar..."
    getLine_ <- getLine
    return ()
