-- Control de búsqueda mediante guardas
evaluarCredito :: Double -> String
evaluarCredito saldo
    | saldo < 0     = "Rechazado: Saldo Deudor" -- Poda inmediata
    | saldo > 10000 = "Aprobado: VIP"
    | otherwise     = "En revisión"

main :: IO ()
main = do
    --let saldoCliente = 5000
    putStrLn("Diga su saldo ")
    input<-getLine
    let saldoCliente=read input::Double
    putStrLn $ "Evaluación de crédito: " ++ evaluarCredito saldoCliente
