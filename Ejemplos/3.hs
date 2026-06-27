import System.IO (hFlush, stdout)

-- | Tipo de dato para representar sujetos (usuarios, dispositivos, etc.)
type Termino = String

-- | Predicados: Funciones que evalúan una propiedad sobre un término
type Predicado = Termino -> Bool

-- | Evalúa la política de acceso utilizando cortocircuito (Short-circuit evaluation)
-- Implementa la implicación lógica: (EsUsuario(x) ∧ TieneLlave(x)) → Acceso(x)
-- Basado en la equivalencia: P ∧ Q → R  ≡  ¬P ∨ ¬Q ∨ R
evaluarAcceso :: Termino -> Predicado -> Predicado -> Bool
evaluarAcceso x esUser tieneLlave = esUser x && tieneLlave x   

    -- | Simulación de base de datos de usuarios registrados
usuariosRegistrados :: [Termino]
usuariosRegistrados = ["Miguel", "Miriam", "Socrates"]

-- | Hecho: Verifica si el término pertenece al grupo de usuarios
esUser :: Predicado
esUser x = x `elem` usuariosRegistrados

-- | Hecho: Verifica si el sujeto posee el token/llave de acceso
tieneLlave :: Predicado
tieneLlave x = x == "Miguel" || x == "Miriam"

-- | Punto de entrada para probar la lógica de acceso
main :: IO ()
main = do
    -- Solicitar nombre del sujeto para evaluar su acceso (Miguel, Miriam, etc.)
    putStr "Ingrese el nombre del sujeto: "
    hFlush stdout  -- IMPORTANTE: Fuerza la aparición del texto en pantalla inmediatamente
    sujeto <- getLine
    let resultado = evaluarAcceso sujeto esUser tieneLlave
    
    putStrLn $ "Evaluando acceso para: " ++ sujeto
    if resultado 
        then putStrLn "ACCESO CONCEDIDO" 
        else putStrLn "ACCESO DENEGADO"
    putStrLn "Evaluación completa. Presione Enter para salir."
    _ <- getLine  -- Espera para mantener la consola abierta    
    return ()