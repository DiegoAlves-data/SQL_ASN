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
   OR seller_state = 'SP'

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
WHERE (product_category_name = 'perfumaria'
   OR product_category_name = 'bebes')
  AND product_height_cm > '5'

-- COMMAND ----------

-- OUTRA FORMA DE SOLUCIONAR Selecione produtos de perfumaria e bebes com altura maior que 5cm
SELECT *
FROM bronze_olist.olist_products_dataset
WHERE product_category_name in ('perfumaria', 'bebes', 'artes')
  AND product_height_cm > '5' 

-- COMMAND ----------

-- TEMPO DE FOCO
-- 1. Lista de pedidos com mais de um item.
SELECT *
FROM bronze_olist.olist_order_items_dataset
WHERE order_item_id > 1

-- COMMAND ----------

-- 2. Lista de pedidos que o frete é mais caro que o item
SELECT *
FROM bronze_olist.olist_order_items_dataset
WHERE freight_value > price

-- COMMAND ----------

--3. Lista de pedidos que ainda não foram enviados.
SELECT * 
FROM bronze_olist.olist_orders_dataset
WHERE order_status != 'delivered'
  AND order_status != 'shipped'

-- COMMAND ----------

--4. Lista de pedidos que foram entregues com atraso.
SELECT * 
FROM bronze_olist.olist_orders_dataset
WHERE order_estimated_delivery_date < order_delivered_customer_date

-- COMMAND ----------


