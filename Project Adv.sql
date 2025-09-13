use project;

-- Count of Total Number Rows
select count(*) from dataset;

-- Custom Product wise Sales
select productname, concat(round(sum(salesamount), 2), "K") as Sales from dataset
where productname = 'Hitch Rack - 4-Bike';

-- Region Wise Sales
select Region, concat(round(sum(salesamount), 2), "K") as total_sales from dataset
group by Region
order by total_sales desc;
 
-- Top 5 Performing Products 
select productname, concat(round(sum(profit), 2), "K") as total_profit from dataset
group by productname
order by total_profit DESC
limit 5; 

-- Ranking Months wise Sales
select MONTHFULLNAME,concat(round(sum(salesamount), 2), "K") as total_sales,
rank() over (order by concat(round(sum(salesamount), 2), "K") desc) as sales_rank
from dataset
group by 1;

-- Country wise our loyal Customers
select Region, count(distinct CustomerKey) as number_of_customers from dataset
group by Region
order by number_of_customers desc;
    
-- Average Price of Products
select productname, avg(UnitPrice) as average_price from dataset
group by 1
order by 2 desc;

-- Which Month Had Best Sales Performance
select MONTHFULLNAME, format(sum(salesamount), 2) as total_sales
from dataset
group by MONTHFULLNAME
order by total_sales desc
limit 1;

-- Customer with Highest Sales 
select customerfullname, concat(format(sum(salesamount), 2), "k") as total_customer_sales from dataset
where customerfullname = "Gina E Martin"
group by 1;
  
-- Top 10 Profitable Products
select productname, sum(profit) as total_profit from dataset
group by productname
order by total_profit desc
limit 10;

-- Top 3 Customers
select customerfullname, sum(salesamount) as total_customer_sales from dataset
group by 1
order by 2 desc
limit 3;

-- Total orders company got Monthly wise
select MONTHFULLNAME, count(SalesOrderNumber) as total_orders from dataset
group by 1
order by 2 desc;
  
-- UnitPrice per Product
select productname, count(UnitPrice) as UnitPrice
from dataset
where UnitPrice > 1000
group by productname;

-- Country wise Average Profit, Average Sales
select Region, concat(round(avg(profit), 2), "K") as average_profit, concat(round(avg(salesamount), 2), "k") as average_sales
from dataset
group by Region
order by average_sales desc;

-- Year wise Order Count and Sales
 select yrs, count(salesordernumber) as No_of_orders, concat(round(sum(salesamount), 2), "K") as Total_Sales from dataset
 group by 1
 order by 1;

