ajedrezPares :: [(Int, Int)]
ajedrezPares = [(x, y) | x <- [1..8], y <- [1..8], even (x + y)]
main :: IO ()
main = do    
    putStrLn "Pares de coordenadas en un tablero de ajedrez (x, y):"
    print ajedrezPares  