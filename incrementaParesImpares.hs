incParesImparesFuntor :: [Integer] -> [Integer]
incParesImparesFuntor lista = fmap incrementaCondicional lista
  where
    incrementaCondicional x
      | even x    = x + 1
      | otherwise = x + 2

main:: IO ()
main = do 
    putStrLn "--- INCREMENTA PARES E IMPARES CON FUNCTOR ---"
    putStrLn "Ingrese una lista de números enteros separados por espacios:"
    linea <- getLine
    let numeros = map read (words linea) :: [Integer]
    let resultado = incParesImparesFuntor numeros
    putStrLn $ "La lista original: " ++ show numeros
    putStrLn $ "La lista resultante después de incrementar pares e impares es: " ++ show resultado
    putStrLn "Presione enter para finalizar..."
    _ <- getLine
    return ()
