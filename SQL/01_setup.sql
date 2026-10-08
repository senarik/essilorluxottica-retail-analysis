-- Data from "2025 Universal Registration Document" pg. 128

CREATE TABLE segment_revenue (
year INTEGER NOT NULL,
segment TEXT NOT NULL,
revenue_eur_millions NUMERIC(12, 2) NOT NULL,
PRIMARY KEY (year, segment),
CHECK (revenue_eur_millions >= 0)
);

INSERT INTO segment_revenue (year, segment, revenue_eur_millions)

VALUES
(2024, 'Professional Solutions', 12547),
(2024, 'Direct to Consumer', 13960),
(2025, 'Professional Solutions', 13600),
(2025, 'Direct to Consumer', 14891);

-- Annual revenue by region

CREATE TABLE regional_revenue (
year INTEGER NOT NULL,
region TEXT NOT NULL,
revenue_eur_millions NUMERIC(12, 2) NOT NULL,
PRIMARY KEY (year, region),
CHECK (revenue_eur_millions >= 0)
);

-- Pg. 130

INSERT INTO regional_revenue (year, region, revenue_eur_millions)
VALUES
(2024, 'North America', 11979),
(2024, 'EMEA', 9759),
(2024, 'Asia-Pacific', 3247),
(2024, 'Latin America', 1523),
(2025, 'North America', 12787),
(2025, 'EMEA', 10779),
(2025, 'Asia-Pacific', 3410),
(2025, 'Latin America', 1515);

-- Published regional growth rates for 2025 versus 2024

CREATE TABLE regional_growth_rates (
year INTEGER NOT NULL,
region TEXT NOT NULL,
reported_growth_pct NUMERIC(5, 2) NOT NULL,
constant_currency_growth_pct NUMERIC(5, 2) NOT NULL,
PRIMARY KEY (year, region)
);

-- Pg. 130

INSERT INTO regional_growth_rates (
year,
region,
reported_growth_pct,
constant_currency_growth_pct
)
VALUES
(2025, 'North America', 6.7, 11.6),
(2025, 'EMEA', 10.4, 11.8),
(2025, 'Asia-Pacific', 5.0, 10.1),
(2025, 'Latin America', -0.5, 7.6);

-- Corporate owned stores by region at year-end

CREATE TABLE store_footprint (
year INTEGER NOT NULL,
banner TEXT NOT NULL,
region TEXT NOT NULL,
corporate_store_count INTEGER NOT NULL,
PRIMARY KEY (year, banner, region),
CHECK (corporate_store_count >= 0)
);

-- Corporate stores at December 31 of each year

INSERT INTO store_footprint (
year,
banner,
region,
corporate_store_count
)
VALUES
(2024, 'Sunglass Hut', 'North America', 1609),
(2024, 'Sunglass Hut', 'EMEA', 577),
(2024, 'Sunglass Hut', 'Asia-Pacific', 311),
(2024, 'Sunglass Hut', 'Latin America', 429),
(2025, 'Sunglass Hut', 'North America', 1575),
(2025, 'Sunglass Hut', 'EMEA', 548),
(2025, 'Sunglass Hut', 'Asia-Pacific', 307),
(2025, 'Sunglass Hut', 'Latin America', 450);

-- Year end store totals by retail chain and ownership type

CREATE TABLE store_ownership (
year INTEGER NOT NULL,
banner TEXT NOT NULL,
ownership_type TEXT NOT NULL,
store_count INTEGER NOT NULL,
PRIMARY KEY (year, banner, ownership_type),
CHECK (store_count >= 0)
);

INSERT INTO store_ownership (
year,
banner,
ownership_type,
store_count
)
VALUES
(2024, 'Sunglass Hut', 'Corporate', 2926),
(2024, 'Sunglass Hut', 'Franchising & Licensing', 242),
(2025, 'Sunglass Hut', 'Corporate', 2880),
(2025, 'Sunglass Hut', 'Franchising & Licensing', 251);

-- Selected chains for store network comparison

INSERT INTO store_ownership (
year,
banner,
ownership_type,
store_count
)
VALUES
(2024, 'LensCrafters', 'Corporate', 1094),
(2024, 'LensCrafters', 'Franchising & Licensing', 8),
(2025, 'LensCrafters', 'Corporate', 1087),
(2025, 'LensCrafters', 'Franchising & Licensing', 11),
(2024, 'Oakley', 'Corporate', 300),
(2024, 'Oakley', 'Franchising & Licensing', 72),
(2025, 'Oakley', 'Corporate', 297),
(2025, 'Oakley', 'Franchising & Licensing', 78),
(2024, 'Ray-Ban', 'Corporate', 282),
(2024, 'Ray-Ban', 'Franchising & Licensing', 0),
(2025, 'Ray-Ban', 'Corporate', 282),
(2025, 'Ray-Ban', 'Franchising & Licensing', 0);