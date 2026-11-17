use [CUSTOMER _SHOPPING]
SELECT * FROM dbo.customer;
select customer_id from customer;
SELECT SUM(Purchase_Amount_USD) AS Total_Purchase_Amount
FROM dbo.customer;
select avg(Purchase_Amount_USD) as Total_avg_ammount
from dbo.customer;


1.'Are there missing values in critical fields such as Age, Gender, and Review Rating?'

SELECT * FROM dbo.customer WHERE Age IS NULL;
SELECT * FROM dbo.customer WHERE Gender IS NULL;
SELECT * FROM dbo.customer WHERE Review_Rating IS NULL;

2.'where Review_Rating is NULL'

DELETE FROM dbo.customer
WHERE Review_Rating IS NULL;

SELECT COUNT(Customer_ID) AS Total_Customers
FROM dbo.customer;

3.Are there any duplicate customer records in the dataset?
SELECT Customer_ID,
       COUNT(*) AS Duplicate_Count
FROM dbo.customer
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

4.Which product category generates the highest total revenue?

SELECT Category,
       SUM(Purchase_Amount_USD) AS Revenue
FROM dbo.customer
GROUP BY Category
ORDER BY Revenue DESC;

5.Which customer age group contributes the highest revenue?

SELECT
CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+'
END AS Age_Group,
SUM(Purchase_Amount_USD) AS Revenue
FROM dbo.customer
GROUP BY
CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+'
END
ORDER BY Revenue DESC;

6.Do subscribers generate more revenue than non-subscribers?

SELECT Subscription_Status,
       COUNT(*) AS Customers,
       SUM(Purchase_Amount_USD) AS Revenue,
       AVG(Purchase_Amount_USD) AS Avg_Purchase
FROM dbo.customer
GROUP BY Subscription_Status;

7.Which locations contribute the highest sales revenue?

SELECT Location,
       SUM(Purchase_Amount_USD) AS Revenue
FROM dbo.customer
GROUP BY Location
ORDER BY Revenue DESC;

8.What impact do discounts have on customer purchasing behavior and revenue?

SELECT Discount_Applied,
       AVG(Purchase_Amount_USD) AS Avg_Purchase,
       SUM(Purchase_Amount_USD) AS Total_Revenue
FROM dbo.customer
GROUP BY Discount_Applied;

9.Which season generates the highest revenue for the business?

SELECT Season,
       SUM(Purchase_Amount_USD) AS Revenue
FROM dbo.customer
GROUP BY Season
ORDER BY Revenue DESC;

10.Who are the Top 10 products on Total Revenue Generated?

SELECT TOP 10
       Item_Purchased,
       SUM(Purchase_Amount_USD) AS Revenue
FROM dbo.customer
GROUP BY Item_Purchased
ORDER BY Revenue DESC;



