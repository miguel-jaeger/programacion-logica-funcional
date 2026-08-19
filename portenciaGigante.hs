calcularPotenciaGigante :: Integer -> Integer -> Integer
calcularPotenciaGigante base exponente = base ^ exponente

main::IO()
main=do 
    
    putStrLn "Ingrese la base:"
    inputBase <- getLine
    let base = read inputBase :: Integer

    putStrLn "Ingrese el exponente:"
    inputExponente <- getLine
    let exponente = read inputExponente :: Integer

    let resultado = calcularPotenciaGigante base exponente
    putStrLn ("El resultado de " ++ show base ++ " elevado a " ++ show exponente ++ " es: " ++ show resultado)  