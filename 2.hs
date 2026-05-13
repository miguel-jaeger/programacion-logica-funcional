soloAdultos :: [Int] -> [Int]
soloAdultos edades = [x | x <- edades, x >= 18]

-- Variante con filter
soloAdultosFilter :: [Int] -> [Int]
soloAdultosFilter edades = filter (>= 18) edades

main :: IO ()
main = do
    let edades = [15, 22, 17, 30, 12, 18]
    let adultos = soloAdultos edades
    putStrLn $ "Las edades de los adultos son: " ++ show adultos