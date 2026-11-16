main :: IO ()
main = do  
    let valores =[1..10]
    let quinto= valores !! 5
    putStrLn ("Los valores de la lista son: "++ show valores)
    putStrLn ("El quinto valor es: "++ show quinto)