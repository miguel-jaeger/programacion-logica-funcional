import Data.Maybe

procesarTransacciones :: String -> [String]
procesarTransacciones entrada = 
    let montos = map read (words entrada) :: [Double] 
        -- Solo aceptamos transacciones reales > 0
        validos = filter (> 0) montos 
    in map (("S/ " ++) . show) validos 

main :: IO ()
main = do
    putStrLn "Ingrese montos de la DB (espaciados):"
    input <- getLine
    let resultado = procesarTransacciones input
    putStrLn "Registros procesados y validados:"
    print resultado
    putStrLn "Proceso finalizado. Presione una tecla para salir."
    _ <- getLine
    return ()