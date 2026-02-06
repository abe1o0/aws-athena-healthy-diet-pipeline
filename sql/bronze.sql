-- ============================================================
-- Bronze layer table: Parsed and typed healthy diet price data
-- Converts raw string fields into numeric types
-- Stored as Parquet for efficient analytics
-- ============================================================

CREATE TABLE healthy_diet_dev.bronze_price_of_healthy_diet
WITH (

    format = 'PARQUET',
    external_location = 's3://healthy-diet-projectone-dev-databricks/bronze/price_of_healthy_diet/',
    parquet_compression = 'SNAPPY'

) AS
SELECT

    country_code,
    country,
    region,

    -- Cast year to integer
    TRY_CAST(year AS INTEGER) AS year,

    -- Convert cost fields to numeric values
    TRY_CAST(cost_health  AS DOUBLE) AS cost_health,
    TRY_CAST(cost_annual  AS DOUBLE) AS cost_annual,
    TRY_CAST(cost_veg     AS DOUBLE) AS cost_veg,
    TRY_CAST(cost_fruits  AS DOUBLE) AS cost_fruits,
    TRY_CAST(total_food   AS DOUBLE) AS total_food,

    cost_category,
    data_quality

FROM healthy_diet_dev.landing_price_of_healthy_diet_clean;
