-- ============================================================
-- Silver layer table: Cleaned healthy diet price data
-- Applies basic data quality filters and derives daily cost
-- Stored as Parquet for efficient downstream analytics
-- ============================================================

CREATE TABLE healthy_diet_dev.silver_price_of_healthy_diet
WITH (

    format = 'PARQUET',
    external_location = 's3://healthy-diet-projectone-dev-databricks/silver/price_of_healthy_diet/',
    parquet_compression = 'SNAPPY'

) AS
SELECT

    country_code,
    country,
    region,
    year,

    cost_health,
    cost_annual,
    cost_veg,
    cost_fruits,
    total_food,

    cost_category,
    data_quality,

    -- Derived metric: average daily cost
    cost_annual / 365.0 AS daily_cost_estimate

FROM healthy_diet_dev.bronze_price_of_healthy_diet

WHERE
    year IS NOT NULL
    AND cost_annual IS NOT NULL;
