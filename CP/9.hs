coordenadasIdenticas :: [(Int, Int)]
coordenadasIdenticas = [(x, y) | x <- [1..5], y <- [1..5], x == y]
main :: IO ()
main = do
    putStrLn $ "Las coordenadas identicas son: " ++ show coordenadasIdenticas