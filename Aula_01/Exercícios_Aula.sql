-- Databricks notebook source
-- Selecione todos os clientes Paulistanos
SELECT * 
FROM bronze_olist.olist_customers_dataset
WHERE customer_city = 'sao paulo'

-- COMMAND ----------

-- Selecione todos os clientes Paulistas
SELECT * 
FROM bronze_olist.olist_customers_dataset
WHERE customer_state = 'SP'

-- COMMAND ----------

SELECT *
FROM bronze_olist.olist_sellers_dataset

-- COMMAND ----------

-- Selecione todos vendedores cariocas e paulistas
SELECT *
FROM bronze_olist.olist_sellers_dataset
WHERE seller_city = 'rio de janeiro'
  AND
      seller_state = 'SP'

-- COMMAND ----------

-- Uma solução diferente para o problema acima
SELECT *
FROM bronze_olist.olist_sellers_dataset
WHERE seller_city = 'rio de janeiro'
  OR seller_city = 'sao paulo'

-- COMMAND ----------

-- Selecione produtos de perfumaria e bebes com altura maior que 5cm
SELECT *
FROM bronze_olist.olist_products_dataset
WHERE product_category_name = 'perfumaria'
   OR product_category_name = 'bebes'
  AND product_height_cm > '5'
