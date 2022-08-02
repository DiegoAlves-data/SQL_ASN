-- Databricks notebook source
-- Quantos sellers estão com a Olist

SELECT count (*) -- número de linhas

FROM silver_olist.sellers

-- COMMAND ----------

-- Revisar valores repetidos das colunas, como dois sellers repetidos
SELECT COUNT (*) AS qtLinhas, -- número de linhas
       COUNT( DISTINCT idSeller ) as qtSeller

FROM silver_olist.sellers

-- COMMAND ----------

-- em quantos Estados temos sellers da Olist
SELECT COUNT (*) AS qtLinhas, -- número de linhas
       COUNT( DISTINCT idSeller ) AS qtSeller, -- Sellers Distintos
       COUNT( DISTINCT descState) AS qtEstadosDistinct -- Estados distintos

FROM silver_olist.sellers

-- COMMAND ----------

--Em média quanto tempo um pedido demora dado que ele atrasou em dias

SELECT 
       COUNT(DISTINCT idOrder) AS qtPedidos, 
       --DATEDIFF (dtDeliveredCustomer, dtEstimatedDelivered) AS qtDiasAtraso    --Total de dias de atraso
       AVG(DATEDIFF (dtDeliveredCustomer, dtEstimatedDelivered)) AS avgDiasAtraso,   -- Média de dias de atraso
       STD(DATEDIFF (dtDeliveredCustomer, dtEstimatedDelivered)) AS stdDiasAtraso,    -- Desvio padrão
       
       MIN(DATEDIFF (dtDeliveredCustomer, dtEstimatedDelivered)) AS minDiasAtraso,   --Dias que menos atrasaram
       MAX(DATEDIFF (dtDeliveredCustomer, dtEstimatedDelivered)) AS maxDiasAtraso   -- Máximo dias de atraso

      
FROM silver_olist.orders

WHERE DATE(dtDeliveredCustomer) > DATE(dtEstimatedDelivered)

-- COMMAND ----------

--Quantas vendas tive de um produto tipo perfumaria

SELECT COUNT(DISTINCT idProduct) AS qtProduto

FROM silver_olist.products

WHERE descCategoryName = 'perfumaria'


-- COMMAND ----------

--Quantas vendas tive de um produto tipo bebes

SELECT COUNT(DISTINCT idProduct) AS qtProduto

FROM silver_olist.products

WHERE descCategoryName = 'bebes'

-- COMMAND ----------

--Quantas vendas tive de um produto tipo artes

SELECT COUNT(DISTINCT idProduct) AS qtProduto

FROM silver_olist.products

WHERE descCategoryName = 'artes'

-- COMMAND ----------

--Para não precisar repetir código nestas consultas podemos agrupar coisas via Group By

SELECT 
      descCategoryName,
      COUNT(DISTINCT idProduct) AS qtProduto

FROM silver_olist.products

GROUP BY descCategoryName

-- COMMAND ----------

-- CALCULAR MÉDIA DO PESO DOS PRODUTO E PRODUTOS CATEGORIA

SELECT 
      descCategoryName,
      COUNT(DISTINCT idProduct) AS qtProduto,
      AVG (vlWeightGramas) AS avgPeso
      
FROM silver_olist.products

GROUP BY descCategoryName

-- COMMAND ----------

-- qual é o produto que mais temos atualmente? 
SELECT 
      descCategoryName,
      COUNT(DISTINCT idProduct) AS qtProduto,
      AVG (vlWeightGramas) AS avgPeso
      
FROM silver_olist.products

WHERE descCategoryName IS NOT NULL -- retiro os nulos da tabela

GROUP BY descCategoryName

ORDER BY qtProduto DESC


-- COMMAND ----------

-- Ordenar pela quantidade ascendente excluindo quem tem menos de 50 produtos. 
SELECT 
      descCategoryName,
      COUNT(DISTINCT idProduct) AS qtProduto,
      AVG (vlWeightGramas) AS avgPeso
      
FROM silver_olist.products

WHERE descCategoryName IS NOT NULL -- retiro os nulos da tabela

GROUP BY descCategoryName

HAVING COUNT(DISTINCT idProduct) >= 50 -- realiza um filtro dentro do where

ORDER BY qtProduto DESC


