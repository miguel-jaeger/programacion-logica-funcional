data Term = Const String deriving Show
sujetos :: [Term]
sujetos = [Const "AlumnoA", Const "ProfesorB", Const "Aula101"]

main :: IO ()
main = do
    putStrLn ("Los sujetos son: " ++ show sujetos)
