esMayorDeEdad :: Int -> Bool
esMayorDeEdad edad = edad >= 18

main:: IO ()
main = do
    putStrLn "Ingrese su edad:"
    input <- getLine
    let edad = read input :: Int
    if esMayorDeEdad edad
        then putStrLn "Eres mayor de edad."
        else putStrLn "No eres mayor de edad."