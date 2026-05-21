filtrarCodigosImpares :: [Int] -> [Int]
filtrarCodigosImpares codigos = filter odd codigos
main :: IO ()
main = do
    let codigos = [101, 202, 303, 404, 505]
    print $ filtrarCodigosImpares codigos  -- Output: [101, 303, 505]