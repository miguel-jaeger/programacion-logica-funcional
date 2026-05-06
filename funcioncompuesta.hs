-- 1. Definición de funciones puras
-- Esta función recibe dos enteros y devuelve su suma.
sumar :: Int -> Int -> Int
sumar a b = a + b

-- Esta función toma un entero (la salida de la anterior) y lo eleva al cuadrado.
alCuadrado :: Int -> Int
alCuadrado n = n * n

-- 2. Función principal (Manejo de teclado y flujo)
main :: IO ()
main = do
    putStrLn "--- Calculadora Funcional ---"
    
    -- Solicitar datos al usuario
    putStrLn "Ingrese el primer número:"
    input1 <- getLine
    putStrLn "Ingrese el segundo número:"
    input2 <- getLine
    
    -- Conversión de String a Int (Tipado fuerte)
    let n1 = read input1 :: Int
    let n2 = read input2 :: Int
    
    -- FLUJO: La salida de 'sumar' es la entrada de 'alCuadrado'
    let resultadoSuma = sumar n1 n2
    let resultadoFinal = alCuadrado resultadoSuma
    
    -- Mostrar resultado convirtiéndolo a String para la pantalla
    putStrLn ("La suma es: " ++ show resultadoSuma)
    putStrLn ("El resultado final (suma al cuadrado) es: " ++ show resultadoFinal)
    putStrLn "Presiona Enter para finalizar..."
    _ <- getLine
    return ()

