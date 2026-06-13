-- Definición de tipos de datos para términos y fórmulas
-- Definimos Nombre como un alias de String para mayor claridad
type Nombre = String
-- Definimos los Objetos (Términos)
{-
Significado Técnico por Partes
•	data Termino: Define un nuevo Tipo de Dato Algebraico (ADT). Le estás diciendo a Haskell: "A partir de ahora, existe una categoría llamada Termino que voy a usar para mis objetos lógicos".
•	=: Indica que vas a definir las formas que puede tomar ese tipo.
•	Var Nombre: Es el primer constructor. Representa una Variable (como x o y) que contiene un Nombre (un String).
•	|: Se lee como un "O" lógico. Separa las diferentes formas que puede tener el dato.
•	Const Nombre: Es el segundo constructor. Representa una Constante (un objeto fijo como "Juan" o el número "2").
•	deriving (Show, Eq): Es una instrucción automática para que Haskell dote a este tipo de dos capacidades:
o	Show: Permite que el término se pueda convertir a texto y mostrarse en la consola (ghci).
o	Eq: Permite comparar si dos términos son iguales (por ejemplo, saber si Var "x" es lo mismo que Var "x").
-}

data Termino = Var Nombre | Const Nombre deriving (Show, Eq)

-- Definimos las Fórmulas lógicas
data Formula = Pred Nombre [Termino] 
            | Neg Formula 
            | Conj Formula Formula 
            | ParaTodo Nombre Formula 
            deriving (Show, Eq)

-- Recibe un término constante y verifica si su valor numérico es par
esPar :: Termino -> Bool
esPar (Const n) = read n `mod` 2 == 0
esPar _         = False

-- 2. Función Evaluadora (Corregida)
-- Error corregido: El nombre de la función debe ser el mismo en la firma y en el cuerpo.
-- Se agregó el caso base para evitar errores de ejecución.
evaluar :: Formula -> Bool
evaluar (Pred "Par" [t]) = esPar t
evaluar (Conj f1 f2)     = evaluar f1 && evaluar f2
evaluar _                = False -- Caso base: cualquier otra fórmula devuelve False

main :: IO ()
main = do
    let formula1 = Pred "Par" [Const "4"]
    let formula2 = Pred "Par" [Const "5"]
    let formula3 = Pred "Par" [Const "6"]
    
    -- Error corregido: Llamamos a 'evaluar', que es el nombre definido arriba.
    putStrLn $ "Son 4 y 5 pares? " ++ show (evaluar formula1 && evaluar formula2)
    putStrLn $ "Son 4 y 6 pares? " ++ show (evaluar formula1 && evaluar formula3)
    putStrLn $ "¿Es 4 par? " ++ show (evaluar formula1)
    putStrLn $ "¿Es 5 par? " ++ show (evaluar formula2)