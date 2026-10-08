-- Sunglass Hut corporate store totals

SELECT
year,
banner,
COUNT(*) AS region_count,
SUM(corporate_store_count) AS corporate_store_count
FROM store_footprint
WHERE banner = 'Sunglass Hut'
GROUP BY year, banner
ORDER BY year;

-- Change in Sunglass Hut corporate stores by region

SELECT
current_year.region,
previous_year.corporate_store_count AS stores_2024,
current_year.corporate_store_count AS stores_2025,
current_year.corporate_store_count - previous_year.corporate_store_count AS net_change,
ROUND((current_year.corporate_store_count - previous_year.corporate_store_count) * 100.0 / previous_year.corporate_store_count, 2) AS change_pct
FROM store_footprint AS current_year
JOIN store_footprint AS previous_year
ON current_year.banner = previous_year.banner
AND current_year.region = previous_year.region
WHERE current_year.year = 2025
AND previous_year.year = 2024
AND current_year.banner = 'Sunglass Hut'
ORDER BY net_change DESC;

-- Regional share of Sunglass Hut corporate stores in 2025

SELECT
region,
corporate_store_count,
ROUND(corporate_store_count * 100.0 / SUM(corporate_store_count) OVER (),2) AS store_share_pct
FROM store_footprint
WHERE year = 2025
AND banner = 'Sunglass Hut'
ORDER BY store_share_pct DESC;

-- Total Sunglass Hut locations across ownership types

SELECT
year,
banner,
SUM(store_count) AS total_store_count
FROM store_ownership
WHERE banner = 'Sunglass Hut'
GROUP BY year, banner
ORDER BY year;

-- Compare regional corporate counts with published ownership totals

WITH regional_totals AS (
SELECT
year,
banner,
SUM(corporate_store_count) AS regional_total
FROM store_footprint
GROUP BY year, banner
)
SELECT
regional_totals.year,
regional_totals.banner,
regional_totals.regional_total,
store_ownership.store_count AS published_corporate_total,
regional_totals.regional_total - store_ownership.store_count AS difference
FROM regional_totals
JOIN store_ownership
ON regional_totals.year = store_ownership.year
AND regional_totals.banner = store_ownership.banner
WHERE store_ownership.ownership_type = 'Corporate'
AND regional_totals.banner = 'Sunglass Hut'
ORDER BY regional_totals.year;

-- Change in Sunglass Hut stores by ownership type

SELECT
current_year.ownership_type,
previous_year.store_count AS stores_2024,
current_year.store_count AS stores_2025,
current_year.store_count - previous_year.store_count AS net_change,
ROUND(
(current_year.store_count - previous_year.store_count) * 100.0 / previous_year.store_count, 2) AS change_pct
FROM store_ownership AS current_year
JOIN store_ownership AS previous_year
ON current_year.banner = previous_year.banner
AND current_year.ownership_type = previous_year.ownership_type
WHERE current_year.year = 2025
AND previous_year.year = 2024
AND current_year.banner = 'Sunglass Hut'
ORDER BY net_change DESC;

-- Rank selected chains by total locations in 2025

SELECT
banner,
SUM(store_count) AS total_store_count,
RANK() OVER (ORDER BY SUM(store_count) DESC) AS store_rank
FROM store_ownership
WHERE year = 2025
GROUP BY banner
ORDER BY store_rank, banner;

-- Change in total locations for selected chains

WITH store_totals AS (
SELECT
year,
banner,
SUM(store_count) AS total_stores
FROM store_ownership
GROUP BY year, banner
)
SELECT
current_year.banner,
previous_year.total_stores AS stores_2024,
current_year.total_stores AS stores_2025,
current_year.total_stores - previous_year.total_stores AS net_change,
ROUND(
(current_year.total_stores - previous_year.total_stores) * 100.0 / previous_year.total_stores, 2) AS change_pct
FROM store_totals AS current_year
JOIN store_totals AS previous_year
ON current_year.banner = previous_year.banner
WHERE current_year.year = 2025
AND previous_year.year = 2024
ORDER BY change_pct DESC;