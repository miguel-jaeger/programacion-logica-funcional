import Data.ByteString (cons)

-- Lista de precios de una mesa
consumoMesa :: [Float]
consumoMesa = [25.5, 42.0, 15.5, 30.0, 12.0]


-- Calculos simples con listas
-- segundo elemento de la lista
segundoElemento :: Float
segundoElemento = consumoMesa !! 1
--- cantidad de items consumidos
cantidadItems :: Int
cantidadItems = length consumoMesa

--- total consumido
totalConsumo :: Float
totalConsumo = sum consumoMesa

--- orden inverso de la lista
ordenInverso :: [Float]
ordenInverso = reverse consumoMesa

--- precio del primer pedido    
primerPedido :: Float
primerPedido = head consumoMesa

--- precio del ultimo pedido
ultimoPedido :: Float
ultimoPedido = last consumoMesa


-- Segunda parte
--Calcula la suma total de la lista y le añade el 10% de propina.
propina :: Float
propina = totalConsumo * 0.1

totalConPropina :: Float
totalConPropina = totalConsumo + propina

--Encuentra el precio máximo de la cuenta.
precioMaximo :: Float
precioMaximo = maximum consumoMesa  

--Filtra la lista y devuelve solo los precios mayores a 20.0.
preciosMayoresA20 :: [Float]
preciosMayoresA20 = filter (>20.0) consumoMesa


main :: IO ()    
main = do
    putStrLn ("Lista original: " ++ show consumoMesa)
    putStrLn ("Cantidad de items consumidos: " ++ show cantidadItems)
    putStrLn ("Total consumido: $" ++ show totalConsumo)
    putStrLn ("Orden inverso de la lista: " ++ show ordenInverso)
    putStrLn ("Precio del primer pedido: $" ++ show primerPedido)
    putStrLn ("Precio del ultimo pedido: $" ++ show ultimoPedido)
    putStrLn ("-------------------------------------------------")
    putStrLn ("Propina (10%): $" ++ show propina)
    putStrLn ("Total con propina: $" ++ show totalConPropina)
    putStrLn ("Precio máximo de la cuenta: $" ++ show precioMaximo)
    putStrLn ("Segundo elemento de la lista: $" ++ show segundoElemento)
    putStrLn ("Precios mayores a 20.0" ++ show preciosMayoresA20)

    putStrLn "Presiona Enter para finalizar..."
    getLine_ <- getLine
    return ()




