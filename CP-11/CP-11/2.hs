-- Si evaluar f1 es False, el error nunca se dispara gracias a la pereza de la conjunción.  
main :: IO ()
main = print $ (2 == 1) && (error "No debería llegar aquí" == True)