listaProgreso :: Int -> [Int]
listaProgreso n
    | n <= 1 = [1]
    | otherwise = n : listaProgreso (n - 3)
main :: IO ()
main = do
    print $ listaProgreso 10  -- Output: [10,7,4,1]
    print $ listaProgreso 9   -- Output: [9,6,3]
    print $ listaProgreso 1   -- Output: [1]
    print $ listaProgreso (-5) -- Output: [1]