import Data.Char (toUpper)

-- 1. Lista de nombres mal formateados
estudiantes :: [String]
estudiantes = ["jose", "miriam", "miguel", "bali"]

-- 2. Uso de Funtores (fmap): Convertir cada nombre a MAYÚSCULAS
-- Nota: Usamos composición de funciones para aplicar toUpper a cada String
nombresNormalizados = fmap (fmap toUpper) estudiantes

main :: IO ()
main = do
    putStrLn "--- Sistema de Registro UTP ---"
    putStrLn $ "Nombres originales: " ++ show estudiantes
    putStrLn $ "Nombres normalizados: " ++ show nombresNormalizados
    _ <- getLine
    return ()