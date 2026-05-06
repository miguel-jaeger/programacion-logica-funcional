-- Intervalos
intervalo=[1..20]
pares=[2,4..20]


main :: IO ()  
main = do
    putStrLn "Elementos del intervalo de 1 a 20:"
    print intervalo
    putStrLn "Elementos pares:"
    print pares
    putStrLn "Concatenando listas:"
    print (pares ++ intervalo)

    putStrLn "Agregando a la cabeza de la lista:"  
    print (1:pares)
    putStrLn "Presiona Enter para finalizar..."
    getLine_ <- getLine
    return ()

