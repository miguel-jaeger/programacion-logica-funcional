longitudPalabrasLargas :: [String] -> [Int]
longitudPalabrasLargas lista = map length (filter (\p -> length p > 3) lista)

main :: IO ()
main = do   
    let palabras = ["hola", "mundo", "hi", "programacion", "fun"]
    let resultado = longitudPalabrasLargas palabras
    putStrLn $ "Las longitudes de las palabras largas son: " ++ show resultado