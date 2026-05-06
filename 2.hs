soloAdultos :: [Int] -> [Int]
soloAdultos edades = [x | x <- edades, x >= 18]
main :: IO ()
main = do
    let edades = [15, 22, 17, 30, 12, 18]
    let adultos = soloAdultos edades
    putStrLn $ "Las edades de los adultos son: " ++ show adultos