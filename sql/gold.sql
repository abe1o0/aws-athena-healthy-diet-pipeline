-- ============================================================
-- Gold layer table: Average daily healthy diet cost by region
-- Aggregates cleaned silver layer data for business analysis
-- Stored as Parquet for optimized query performance
-- ============================================================

CREATE TABLE healthy_diet_dev.gold_avg_daily_cost_by_region_year
WITH (

    format = 'PARQUET',
    external_location = 's3://healthy-diet-projectone-dev-databricks/gold/avg_daily_cost_by_region_year/',
    parquet_compression = 'SNAPPY'

) AS
SELECT

    region,
    year,

    -- Business metric: average daily cost per region per year
    CAST(
        ROUND(AVG(daily_cost_estimate), 2) 
        AS DECIMAL(10, 2)
    ) AS avg_daily_cost

FROM healthy_diet_dev.silver_price_of_healthy_diet

GROUP BY
    region,
    year;
