SELECT
current_year.segment,
previous_year.revenue_eur_millions AS revenue_2024,
current_year.revenue_eur_millions AS revenue_2025,
current_year.revenue_eur_millions - previous_year.revenue_eur_millions AS increase_eur_millions,
ROUND(
(current_year.revenue_eur_millions - previous_year.revenue_eur_millions) / previous_year.revenue_eur_millions * 100,
 2) AS growth_pct

FROM segment_revenue AS current_year

JOIN segment_revenue AS previous_year
ON current_year.segment = previous_year.segment
WHERE current_year.year = 2025 AND previous_year.year = 2024
ORDER BY growth_pct DESC;

-- Share of revenue in 2025 by segment

SELECT segment, revenue_eur_millions, 
ROUND(revenue_eur_millions / SUM(revenue_eur_millions) OVER () * 100, 2) AS revenue_share_pct
FROM segment_revenue
WHERE year = 2025
ORDER BY revenue_share_pct DESC;

-- Each segment's share of the combined revenue increase

WITH segment_growth AS (SELECT current_year.segment, 
current_year.revenue_eur_millions - previous_year.revenue_eur_millions AS increase_eur_millions
FROM segment_revenue AS current_year
JOIN segment_revenue AS previous_year ON current_year.segment = previous_year.segment
WHERE current_year.year = 2025 AND previous_year.year = 2024)

SELECT segment, increase_eur_millions,
ROUND(increase_eur_millions / SUM(increase_eur_millions) OVER () * 100, 2) AS contribution_pct
FROM segment_growth
ORDER BY contribution_pct DESC;