# Supply Chain Analytics Dashboard

## Project Overview
An end-to-end supply chain analytics project built using SQL and Power BI.
The goal was to analyse supplier performance, logistics efficiency,
inventory health, and regional revenue trends across 100 SKUs.

## Dashboard
- 📄 [View Interactive Dashboard (PDF)](dashboard/supply_chain_dashboard.pdf)

## Tools Used
- SQL (DB Browser for SQLite)
- Microsoft Power BI Desktop
- Microsoft Excel (data source)
- GitHub (version control and portfolio hosting)

## Data Model
Star schema with one fact table and three dimension tables:
- FactSupplyChain (central fact table)
- DimProduct
- DimSupplier
- DimShipping

## Key Business Questions Answered
1. Which product type generates the highest revenue?
2. Which suppliers have the highest defect rates and longest lead times?
3. Which carrier and transport mode is most cost-efficient?
4. Which SKUs are at critically low stock levels?
5. Which supplier locations drive the most revenue?

## Project Structure
- /data → Exported CSV results from all 7 SQL queries
- /sql → Complete SQL query file containing all 7 queries
- /dashboard → Power BI dashboard exported as PDF
