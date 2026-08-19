promedioTresNotas :: Float -> Float -> Float -> Float
promedioTresNotas n1 n2 n3 = (n1 + n2 + n3) / 3.0

main :: IO ()
main = do
    putStrLn "Ingrese la primera nota:"
    inputNota1 <- getLine
    let nota1 = read inputNota1 :: Float

    putStrLn "Ingrese la segunda nota:"
    inputNota2 <- getLine
    let nota2 = read inputNota2 :: Float

    putStrLn "Ingrese la tercera nota:"
    inputNota3 <- getLine
    let nota3 = read inputNota3 :: Float

    let promedio = promedioTresNotas nota1 nota2 nota3
    putStrLn ("El promedio de las tres notas es: " ++ show promedio)