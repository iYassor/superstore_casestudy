-- FIND THE MAXIMUM Quantity SOLD IN A TRANSACTION
SELECT
 MAX(Quantity)
 , COUNT(*)
FROM tr_orderdetails ;

-- FIND THE UNIQUE PRODUCTS IN ALL THE TRANSACTIONS
SELECT distinct 
ProductID
, Quantity
from tr_orderdetails
WHERE Quantity = 3
ORDER BY ProductID ASC, Quantity DESC ;

-- ALSO, FIND THE UNIQUE PRPERTIES
SELECT distinct PropertyID
FROM tr_orderdetails;

-- FIND THE PRODUCT CATEGORY THAT HAS MAXIMUM PRODUCTS
SELECT distinct productcategory
 , COUNT(*) AS count
FROM tr_products
GROUP BY `ProductCategory` 
ORDER BY 2 DESC;


-- FIND THE STATE WHERE MOST STORES ARE PRESENT
SELECT PropertyState
, COUNT(*) AS count
FROM tr_propertyinfo
GROUP BY PropertyState
ORDER BY 2 DESC;


-- FIND THE TOP 5 PRODUCT IDs THAT DID MAXIMUM SALES IN TERMS OF QUANTITY
SELECT ProductID
, SUM(Quantity) AS Total_Quantity
FROM tr_orderdetails
GROUP BY ProductID
ORDER BY 2 DESC
LIMIT 5 ;
-- FIND THE TOP 5 PROPERTY ID's THAT DID MAXIMUM QUANTITY
SELECT PropertyID
, SUM(Quantity) AS Total_Quantity
FROM tr_orderdetails
GROUP BY PropertyID
ORDER BY Total_Quantity
LIMIT 5 ;

/* FIND THE TOP 5 PRODUCT NAMES THAT DID MAXIMUM SALES IN TERMS OF QUANTITY
THEN FIND THE TOP 5 PRODUCTS THAT DID MAXMUM SALES */
SELECT
p.ProductName
, SUM(o.Quantity) AS Total_Quantity
FROM tr_orderdetails AS o
LEFT JOIN tr_products AS p 
ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY 2 DESC
LIMIT 5 ;

SELECT
p.ProductName
, SUM(o.Quantity*p.price) as sales
FROM tr_orderdetails o
LEFT JOIN tr_products p
ON o.ProductID = p.ProductID 
GROUP BY p.ProductName
ORDER BY sales DESC 
LIMIT 5 ;


-- FIND THE TOP 5 CITIES THAT DID MAXIMUM SALES
SELECT
pi.PropertyState
, SUM(o.Quantity*p.price) AS sales
FROM tr_orderdetails o 
LEFT JOIN tr_products p 
on o.ProductID = p.ProductID
LEFT JOIN tr_propertyinfo pi 
on o.PropertyID = pi.`Prop ID`
GROUP BY pi.PropertyState
ORDER BY sales DESC
LIMIT 5 ;


/* FIND THE TOP 5 PRODUCTS IN EACH OF THE CITIES 
--WHAT WILL IS LOOK LIKE FOR STATES */
SELECT
 pi.PropertyState
, p.ProductName
, SUM(o.Quantity*p.price) AS sales
FROM tr_orderdetails o 
LEFT JOIN tr_products p 
on o.ProductID = p.ProductID
LEFT JOIN tr_propertyinfo pi 
on o.PropertyID = pi.`Prop ID`
WHERE pi.PropertyState = 'Arlington'
GROUP BY pi.PropertyState , p.ProductName
ORDER BY sales DESC 
LIMIT 5;


SELECT
 pi.PropertyState
, p.ProductName
, SUM(o.Quantity*p.price) AS sales
FROM tr_orderdetails o 
LEFT JOIN tr_products p 
on o.ProductID = p.ProductID
LEFT JOIN tr_propertyinfo pi 
on o.PropertyID = pi.`Prop ID`
GROUP BY pi.PropertyState , p.ProductName
ORDER BY sales DESC 
LIMIT 5;
