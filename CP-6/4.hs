import Data.Char (toUpper)
estudiantes = ["jose", "miriam", "miguel"]
nombresMayus = fmap (fmap toUpper) estudiantes -- Funtor anidado (String es lista)

main :: IO ()
main = do
    putStrLn "Estudiantes:"
    print estudiantes
    putStrLn "Nombres en mayúsculas:"
    print nombresMayus

    putStrLn "Presione una tecla para salir..."
    _ <- getLine
    return ()