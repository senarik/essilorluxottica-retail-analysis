# EssilorLuxottica Retail Performance & Sunglass Hut Store Footprint
## 2024-2025 Analysis

I previously worked at Sunglass Hut as a sales associate, and it made me interested in creating a retail analysis project using real data from the company. I used EssilorLuxottica's annual reports from 2024 and 2025 to compare revenue across business segments, examine currency effects, and track changes in store counts.

I used PostgreSQL for the analysis and Excel for the charts.
Link to workbook: [EssilorLuxottica_Analysis.xlsx](https://github.com/user-attachments/files/33225882/EssilorLuxottica_Analysis.xlsx)

## What I looked into
- Which business segment grew faster?
- Which region contributed most to the increase in revenue?
- How did reported growth compare with constant currency growth?
- How did Sunglass Hut's corporate store counts change by region?
- How did total store counts change across four selected retail chains?

## Findings

### Revenue by Business Segment

Professional Solutions revenue grew 8.39%, Direct to Consumer did 6.67%. Direct to Consumer remained to be the larger segment, with €14,891 million in revenue in 2025.

Revenue by business segment: <img width="2593" height="993" alt="segment_revenue" src="https://github.com/user-attachments/assets/87a15870-4b3c-4709-90c2-259014d842ef" />

### Revenue by Region

EMEA (Europe, the Middle East, and Africa) added €1,020 million in revenue, which accounted for approx. 51.4% of the company’s total revenue increase. North America remained to be the largest region by revenue.

Revenue by region: <img width="2587" height="1117" alt="regional_revenue" src="https://github.com/user-attachments/assets/b8fbdecd-496f-4fb4-882a-0613c0a5c4a4" />

### Currency Effects

Latin America’s revenue declined 0.5% as reported, but grew 7.6% at constant exchange rates. The 8.1 percentage point gap shows how currency movements affected the reported result.

Constant currency growth compares revenue using consistent exchange rates. The gap is measured in percentage points, not euros.

Reported and constant currency growth: <img width="1639" height="993" alt="currency_growth_comparison" src="https://github.com/user-attachments/assets/6d9c9bee-b699-4646-8906-ff12b58933a6" />

### Sunglass Hut Corporate Stores

Sunglass Hut’s corporate store count went down from 2,926 to 2,880 (net decrease of 46 stores). Latin America was the only region with an increase, with an addition of 21 stores. North America had the largest decrease, at 34 stores.

Sunglass Hut corporate stores by region: <img width="2458" height="1030" alt="sunglass_hut_regional_stores" src="https://github.com/user-attachments/assets/119b2c1c-c250-47f1-a06b-138630faa094" />

### Selected Retail Chains

Sunglass Hut had the most stores among the four selected chains in 2025, with 3,131 locations. Its total decreased by 37 stores. Oakley increased by 3, Ray-Ban was unchanged, and LensCrafters decreased by 4.

These totals include corporate, franchised, and licensed stores. Sunglass Hut’s franchised and licensed stores increased by 9, which partly offset the decrease in corporate stores.

Selected retail chain store counts: <img width="1798" height="1028" alt="selected_chain_store_comparison" src="https://github.com/user-attachments/assets/55645bde-5851-4f11-9da1-0b748a79c5d5" />

## Details on the Analysis

I took the revenue and store count data from the reports and entered it into PostgreSQL. I used SQL joins, aggregations, common table expressions, and window functions to compare the years, calculate growth rates, and measure contributions to growth.

I checked the number of rows in each table and made sure the regional revenue totals matched the reports. I also checked that Sunglass Hut’s corporate store counts across the regions added up to its reported total. Then I exported the results as CSV files and created the charts in Excel.

## Project Files

| File or Folder | Contents |
|---|---|
| [SQL](SQL/) | Database setup, analysis queries, and row-count checks |
| [Results](Results/) | Five CSV files exported from the analysis |
| [Charts](Charts/) | Five charts exported from Excel |
| [Excel workbook](EssilorLuxottica_Analysis.xlsx) | Summary, results tables, and charts |
