notas :: [Int] -> [(Int, String)]
notas = fmap (\n -> (n, if n > 12 then "aprobado" else "suspenso"))

main :: IO ()
main = do
    putStrLn "Ingrese las notas (separadas por espacios):"
    entrada <- getLine
    let notasIngresadas = map read (words entrada) :: [Int]
    let notasAprobadas = notas notasIngresadas
    putStrLn "Notas aprobadas:"
    print notasAprobadas
    putStrLn "Presione una tecla para salir..."
    _ <- getLine
    return ()

