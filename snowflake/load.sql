
-- Use warehouse for execution
USE WAREHOUSE AURORA_WH;

-- Use database for execution
USE DATABASE AURORA_DB;

-- Use RAW schema for ingestion
USE SCHEMA RAW;

-- Create RAW table for CSV dataset ingestion
-- All columns are defined as STRING to ensure accurate data loading
-- Column names are normalized from the original CSV headers

CREATE OR REPLACE TABLE raw_superstore (

  category STRING,
  city STRING,
  country STRING,
  customer_id STRING,
  customer_name STRING,
  discount STRING,
  market STRING,
  ji_lu_shu STRING,
  order_date STRING,
  order_id STRING,
  order_priority STRING,
  product_id STRING,
  product_name STRING,
  profit STRING,
  quantity STRING,
  region STRING,
  row_id STRING,
  sales STRING,
  segment STRING,
  ship_date STRING,
  ship_mode STRING,
  shipping_cost STRING,
  state STRING,
  sub_category STRING,
  year STRING,
  market2 STRING,
  weeknum STRING

);

-- Create stage for accessing S3 data
CREATE OR REPLACE STAGE s3_stage
  STORAGE_INTEGRATION = AURORA_S3_INTEGRATION
  URL = 's3://{{AWS_RAW_BUCKET}}/data/'
  FILE_FORMAT = csv_ff;

-- Test data access
LIST @s3_stage;

-- Load data from S3 into RAW table
COPY INTO raw_superstore
FROM @s3_stage
ON_ERROR = CONTINUE;


