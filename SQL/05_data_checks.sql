-- Check row counts across project tables

SELECT 'segment_revenue' AS table_name, COUNT(*) AS row_count
FROM segment_revenue

UNION ALL

SELECT 'regional_revenue', COUNT(*)
FROM regional_revenue

UNION ALL

SELECT 'regional_growth_rates', COUNT(*)
FROM regional_growth_rates

UNION ALL

SELECT 'store_footprint', COUNT(*)
FROM store_footprint

UNION ALL

SELECT 'store_ownership', COUNT(*)
FROM store_ownership

ORDER BY table_name;