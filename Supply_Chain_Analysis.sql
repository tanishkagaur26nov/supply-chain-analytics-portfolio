create database supply_chain_analysis;
use supply_chain_analysis;

select *
from factsupplychain;

-- Total Revenue and Units Sold by Product Type --

select
p.`Product ID`,
sum(f.UnitsSold) total_units_sold,
Round(sum(f.Revenue),2) total_revenue
from factsupplychain f
join dimproduct p on f.`Product ID` = p.`Product ID`
group by p.`Product ID`
order by total_revenue desc
;

-- Supplier Performance (Defect Rate and Lead Time) -- 

select 
s.SupplierName,
s.SupplierLocation,
Round(avg(SupplierLeadTime),2) avg_lead_time,
Round(avg(DefectRate),2) avg_defect_rate,
Round(avg(MfgCost),2) avg_mfg_cost
from dimsupplier s
group by s.SupplierName, s.SupplierLocation
order by avg_defect_rate
;

-- Average Shipping Time by Carrier and Transport Mode --

select
sh.Carrier,
sh.TransportMode,
Round(avg(ShippingTime),2) avg_shipping_time,
Round(avg(ShippingCost),2) avg_shipping_cost,
Round(avg(LogisticsCost),2) avg_logistic_cost
from factsupplychain f
join dimshipping sh on f.`Shipping ID` = sh.`Shipping ID`
group by sh.Carrier, sh.TransportMode
order by avg_shipping_time desc
;

-- Inventory / Stock Level Analysis --

select 
p.ProductType,
p.SKU,
f.StockLevel,
f.OrderQty,
f.LeadTime
from factsupplychain f
join dimproduct p on f.`Product ID` = p.`Product ID`
where f.StockLevel < 20
order by f.StockLevel
;

-- Revenue by Supplier Location (Regional Sales Trend) --

select
s.SupplierLocation,
count(f.`Product ID`) total_orders,
Round(sum(f.Revenue),2) total_revenue,
Round(avg(f.UnitsSold),0) avg_units_sold
from factsupplychain f
join dimsupplier s on f.`Supplier ID` = s.`Supplier ID`
group by s.SupplierLocation
order by total_revenue desc
;

-- Inspection Result Summary (Quality Control) --

select 
s.InspectionResult,
count(*) as count,
round(count(*) * 100 / (select count(*) from dimsupplier),1 ) as Percentage
from dimsupplier s
group by s.InspectionResult
order by count desc
;

-- Top 10 SKUs by Revenue -- 

select
p.ProductType,
p.SKU,
Round(sum(Revenue),2) total_revenue,
sum(UnitsSold) total_units_sold
from factsupplychain f
join dimproduct p on f.`Product ID` = p.`Product ID`
group by p.ProductType, p.SKU
order by total_revenue desc
;
