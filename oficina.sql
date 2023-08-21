SELECT Ano, SUM(ValorTotalVendas) AS ValorTotalVendas, SUM(ValorTotalServiçosRealizados) AS ValorTotalServiçosRealizados
FROM (
    SELECT YEAR(data) AS Ano, SUM(valorTotalDaCompra) AS ValorTotalVendas, 0 AS ValorTotalServiçosRealizados
    FROM Compras_Cliente
    GROUP BY Ano
    UNION ALL
    SELECT YEAR(data) AS Ano, 0 AS ValorTotalVendas, SUM(valorCobrado) AS ValorTotalServiçosRealizados
    FROM Atendimento
    GROUP BY Ano
) AS AnoStats
GROUP BY Ano;
