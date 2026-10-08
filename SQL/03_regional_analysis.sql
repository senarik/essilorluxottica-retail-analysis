-- Annual totals from regional revenue

SELECT year, COUNT(*) AS region_count, SUM(revenue_eur_millions) AS total_revenue_eur_millions
FROM regional_revenue
GROUP BY year
ORDER BY year;

-- Regional revenue growth from 2024 to 2025

SELECT
current_year.region,
previous_year.revenue_eur_millions AS revenue_2024,
current_year.revenue_eur_millions AS revenue_2025,
current_year.revenue_eur_millions - previous_year.revenue_eur_millions AS increase_eur_millions,
ROUND(
(current_year.revenue_eur_millions - previous_year.revenue_eur_millions) / previous_year.revenue_eur_millions * 100, 2) AS growth_pct
FROM regional_revenue AS current_year
JOIN regional_revenue AS previous_year
ON current_year.region = previous_year.region
WHERE current_year.year = 2025 AND previous_year.year = 2024
ORDER BY growth_pct DESC;

-- Each region's contribution to the revenue increase

WITH regional_growth AS (
SELECT 
current_year.region,
current_year.revenue_eur_millions - previous_year.revenue_eur_millions AS increase_eur_millions
FROM regional_revenue AS current_year
JOIN regional_revenue AS previous_year
ON current_year.region = previous_year.region
WHERE current_year.year = 2025 AND previous_year.year = 2024
)
SELECT
region,
increase_eur_millions,
ROUND(increase_eur_millions / SUM(increase_eur_millions) OVER () * 100, 2) AS contribution_pct
FROM regional_growth
ORDER BY contribution_pct DESC;

-- Difference between reported and constant currency growth

SELECT
region,
reported_growth_pct,
constant_currency_growth_pct,
constant_currency_growth_pct - reported_growth_pct AS growth_gap_pp
FROM regional_growth_rates
WHERE year = 2025
ORDER BY growth_gap_pp DESC;