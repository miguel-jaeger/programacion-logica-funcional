-- Sumar un % a una lista de precios
listaPrecios:: [Float]->Float->[Float]
listaPrecios l aum =fmap(\x -> x + (x * aum)) l

main = do
  putStrLn "Ingrese la lista!"
  input <- getLine
  let lista = map read (words input) :: [Float]
  
  putStrLn "Ingrese % aumento!"
  aumStr <- getLine
  let aum = read aumStr :: Float

  let precios=listaPrecios lista aum
  putStrLn ("Precios originales"++show lista)
  putStrLn ("Precios aumentados"++show precios)