import System.IO
import System.Directory (doesFileExist)
import Data.List (isInfixOf)

-- Función para crear un nuevo usuario y guardarlo en archivo
crearUsuario :: IO ()
crearUsuario = do
    putStrLn "Ingrese su nombre:"
    nombre <- getLine
    putStrLn "Ingrese su código:"
    codigo <- getLine
    putStrLn "Ingrese su correo:"
    correo <- getLine
    let lineaTxt = "Nombre: " ++ nombre ++ " | Codigo: " ++ codigo ++ " | Correo: " ++ correo ++ "\n"
    appendFile "usuarios_local.txt" lineaTxt
    putStrLn " Datos respaldados en TXT "

-- Función para listar todos los usuarios guardados
listarUsuarios :: IO ()
listarUsuarios = do
    existe <- doesFileExist "usuarios_local.txt"
    if not existe then putStrLn "No hay usuarios guardados."
    else do
        contenido <- readFile "usuarios_local.txt"
        putStrLn "\nUsuarios guardados:"
        putStrLn contenido

-- Función para eliminar un usuario por su código
eliminarUsuario :: IO ()
eliminarUsuario = do
    putStrLn "Ingrese el código del usuario a eliminar:"
    codigoEliminar <- getLine
    existe <- doesFileExist "usuarios_local.txt"
    if not existe
      then putStrLn "No hay usuarios para eliminar."
      else do
        contenido <- withFile "usuarios_local.txt" ReadMode $ \h -> do
            c <- hGetContents h
            length c `seq` return c -- fuerza lectura completa
        let lineas = lines contenido
        let filtradas = filter (not . (codigoEliminar `isInfixOf`)) lineas
        writeFile "usuarios_local.txt" (unlines filtradas)
        putStrLn $ "Usuario(s) con código \"" ++ codigoEliminar ++ "\" eliminados si existían."-- Menú principal
menu :: IO ()
menu = do
    putStrLn "\nMENU:"
    putStrLn "1 - Crear nuevo usuario"
    putStrLn "2 - Listar usuarios"
    putStrLn "3 - Eliminar usuario"
    putStrLn "4 - Salir"
    putStr "Ingrese una opción: "
    --hFlush stdout
    opcion <- getLine
    case opcion of
      "1" -> crearUsuario >> menu
      "2" -> listarUsuarios >> menu
      "3" -> eliminarUsuario >> menu
      "4" -> putStrLn "Saliendo..."
      _   -> putStrLn "Opción inválida. Intente de nuevo." >> menu

main :: IO ()
main = menu
