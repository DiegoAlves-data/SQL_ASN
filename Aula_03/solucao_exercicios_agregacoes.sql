-- Databricks notebook source
-- Tempo de foco Group By
-- 1. Qual estado tem mais vendedores?

SELECT descState      
       
FROM silver_olist.sellers

GROUP BY descState
ORDER BY COUNT(DISTINCT idSeller) desc

LIMIT 1

-- COMMAND ----------

--6. Qual a série histórica de pedidos por dia? E receita?

SELECT DATE(dtApproved) AS dtPedido, 
       COUNT(DISTINCT idOrder) AS qtPedido
FROM silver_olist.orders

GROUP BY dtPedido
ORDER BY dtPedido

-- COMMAND ----------

-- Consultar pedidos duplicados
SELECT idOrder,
       COUNT(*)
FROM silver_olist.orders

GROUP BY idOrder
HAVING COUNT(*) > 1

-- COMMAND ----------

-- como saber se há unique id duplicados
SELECT idUniqueCustomer, 

       COUNT (*),
       COUNT (DISTINCT idCustomer)
       
FROM silver_olist.customers

GROUP BY idUniqueCustomer
ORDER BY COUNT(*) ASC

-- COMMAND ----------

--5. Qual categoria tem maior peso médio de produto?

SELECT descCategoryName,
       AVG (vlWeightGramas) AS avgPeso

FROM silver_olist.products

GROUP BY descCategoryName
ORDER BY avgPeso DESC

LIMIT 1



-- COMMAND ----------

-- 4. Quantos produtos são de construção?
-- MOSTRANDO APENAS OS NOMES DAS CATEGORIAS
-- SELECT DISTINCT descCategoryName

-- FROM silver_olist.products

SELECT DISTINCT descCategoryName

FROM silver_olist.products

WHERE descCategoryName LIKE '%construcao%'

ORDER BY descCategoryName
