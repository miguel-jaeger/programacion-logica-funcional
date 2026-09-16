incrementar::[Int]->[Int]
incrementar x = fmap(+5) x

incrementarpar::[Int]->[Int]
incrementarpar x = map incrementa x
    where
        incrementa n
            | even n    = n + 5
            | otherwise = n 


main = do
    putStrLn("EScriba la lista de numeros separados por espacio")
    input<-getLine
    let lista = map read(words input)::[Int]
    putStrLn("La lista original es: "++show lista)
    putStrLn("La lista incrementada en 5 es: "++ show (incrementar lista))
    putStrLn("La lista incrementada en 5 los pares: "++ show (incrementarpar lista))
