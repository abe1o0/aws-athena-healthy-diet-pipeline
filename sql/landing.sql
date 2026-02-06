-- ============================================================
-- External table: Landing layer for healthy diet price dataset
-- Stored as raw text files in S3 (CSV format)
-- ============================================================

CREATE EXTERNAL TABLE healthy_diet_dev.landing_price_of_healthy_diet_clean (

    country_code   STRING,
    country        STRING,
    region         STRING,
    year           STRING,

    cost_health    STRING,
    cost_annual    STRING,
    cost_veg       STRING,
    cost_fruits    STRING,

    total_food     STRING,
    cost_category  STRING,
    data_quality   STRING

)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (

    'separatorChar' = ',',
    'quoteChar'     = '"',
    'escapeChar'    = '\\'

)
STORED AS TEXTFILE
LOCATION 's3://healthy-diet-projectone-dev-databricks/landing/price_of_healthy_diet_clean/v1/'

TBLPROPERTIES (

    'skip.header.line.count' = '1'

);
