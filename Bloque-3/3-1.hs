paresHaciaAbajo :: Int -> [Int]
paresHaciaAbajo n
    | n <= 0 = [0]
    | odd n = pairsDown (n - 1)
    | otherwise = n : pairsDown (n - 2)
    where
        pairsDown x
            | x <= 0 = [0]
            | otherwise = x : pairsDown (x - 2)

main :: IO ()
main = do
    print $ paresHaciaAbajo 10  -- Output: [10,8,6,4,2,0]
    print $ paresHaciaAbajo 9   -- Output: [8,6,4,2,0]
    print $ paresHaciaAbajo 0   -- Output: [0]
    print $ paresHaciaAbajo (-5) -- Output: [0]
