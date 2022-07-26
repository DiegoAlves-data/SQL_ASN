-- Databricks notebook source
SELECT *
FROM bronze_olist.olist_sellers_dataset

-- COMMAND ----------

SELECT *
FROM bronze_olist.olist_sellers_dataset
WHERE seller_city = 'rio de janeiro'

-- COMMAND ----------

SELECT seller_id
FROM bronze_olist.olist_sellers_dataset
WHERE seller_city = 'rio de janeiro'

-- COMMAND ----------

SELECT *
FROM bronze_olist.olist_orders_dataset
WHERE order_delivered_customer_date > order_estimated_delivery_date --FILTRO DE ATRASO 

-- COMMAND ----------

SELECT *
FROM bronze_olist.olist_orders_dataset
WHERE date(order_delivered_customer_date) > date(order_estimated_delivery_date) --FILTRO DE ATRASO com a data apenas, sem horas. 

-- COMMAND ----------

SELECT *,
       DATE(order_delivered_customer_date) AS data_entrega
       DATE(order_estimated_delivery_date) AS data_prometida
        
FROM bronze_olist.olist_orders_dataset

WHERE DATE(order_delivered_customer_date) > DATE(order_estimated_delivery_date) --FILTRO DE ATRASO com a data apenas, sem horas
