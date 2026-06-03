
-- Use database for execution
USE DATABASE AURORA_DB;

-- Use CURATED schema for transformations
USE SCHEMA CURATED;

-- Create curated table with cleaned and typed data
CREATE OR REPLACE TABLE curated_superstore AS
SELECT
  category,
  city,
  country,
  customer_id,
  customer_name,
  TRY_TO_NUMBER(discount) AS discount,
  market,
  ji_lu_shu,
  order_date,
  order_id,
  order_priority,
  product_id,
  product_name,
  TRY_TO_NUMBER(profit) AS profit,
  TRY_TO_NUMBER(quantity) AS quantity,
  region,
  TRY_TO_NUMBER(row_id) AS row_id,
  TRY_TO_NUMBER(sales) AS sales,
  segment,
  ship_date,
  ship_mode,
  TRY_TO_NUMBER(shipping_cost) AS shipping_cost,
  state,
  sub_category,
  TRY_TO_NUMBER(year) AS year,
  market2,
  TRY_TO_NUMBER(weeknum) AS weeknum
FROM AURORA_DB.RAW.raw_superstore;

