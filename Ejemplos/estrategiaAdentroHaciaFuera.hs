{--= mult ( 1+2, 2+3) [por def. de +]
= mult ( 3, 2+3) [por def. de +]
= mult ( 3, 5) [por def. de mult]
= 3 * 5 [por def. de mult]
= 15--}
-- Definición del soporte para tipos de datos (Naturales)
data Nat = Cero | S Nat deriving Show 

-- Implementación de las ecuaciones de la imagen
suma :: Nat -> Nat -> Nat
suma Cero x  = x                         -- Regla: suma 0 x = x
suma (S x) y = S (suma x y)              -- Regla: suma (S x) y = S suma x y

-- Función mult del ejemplo de evaluación
mult :: Int -> Int -> Int
mult x y = x * y    

main :: IO ()
main = do
    let resultado = mult (1 + 2) (2 + 3)   
    putStrLn $ "Evaluación paso a paso:"
    putStrLn $ "mult (1 + 2, 2 + 3) [por def. de +]"
    putStrLn $ "mult (3, 2 + 3) [por def. de +]"
    putStrLn $ "mult (3, 5)"
    putStrLn $ "3 * 5"
    putStrLn $ "15--"
    putStrLn $ "El resultado final es: " ++ show resultado
    putStrLn $ "¡Evaluación completa!"
    putStrLn "Presione una tecla para tewrminar..."
    _ <- getLine
    return ()