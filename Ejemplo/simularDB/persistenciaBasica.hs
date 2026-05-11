main = do
    -- Leemos "Base de Datos" (archivo)
    contenido <- readFile "datos.txt" 
    -- Procesamos como lista
    let registros = words contenido
    print registros