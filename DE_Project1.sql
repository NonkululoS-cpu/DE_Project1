create table DE_PROJECT1.DBO.customers(
customer_id varchar(250)
,customer_name varchar(250)
,email varchar(250)
,province varchar(250)
,signup_date datetime
)

create table DE_PROJECT1.DBO.Products(
product_ID varchar(250)
,product_name varchar(250)
,category varchar(250)
,unit_price int
)

create table DE_PROJECT1.DBO.ORDERS(
ORDER_ID VARCHAR(250)
,CUSTOMER_ID VARCHAR(250)
,PRODUCT_ID VARCHAR(250)
,ORDER_DATE DATETIME
,QUANTITY INT
)

select count(*) from DE_PROJECT1.DBO.CUSTOMERS;
select count(*) from DE_PROJECT1.DBO.PRODUCTS;
select count(*) from DE_PROJECT1.DBO.ORDERS;

SELECT 
    o.ORDER_ID,
    o.ORDER_DATE,
    o.QUANTITY,
    p.unit_price,
    c.customer_name,
    p.product_name,
    p.category,
    (o.QUANTITY * p.unit_price) AS line_revenue
FROM DE_PROJECT1.DBO.ORDERS o
INNER JOIN DE_PROJECT1.DBO.customers c 
    ON o.CUSTOMER_ID = c.customer_id
INNER JOIN DE_PROJECT1.DBO.Products p 
    ON o.PRODUCT_ID = p.product_ID;


SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.QUANTITY * p.unit_price) AS total_revenue
FROM DE_PROJECT1.DBO.customers c
INNER JOIN DE_PROJECT1.DBO.ORDERS o 
    ON c.customer_id = o.CUSTOMER_ID
INNER JOIN DE_PROJECT1.DBO.Products p 
    ON o.PRODUCT_ID = p.product_ID
GROUP BY 
    c.customer_id,
    c.customer_name
ORDER BY 
    total_revenue DESC;


SELECT 
    p.category,
    SUM(o.QUANTITY * p.unit_price) AS total_revenue
FROM DE_PROJECT1.DBO.Products p
INNER JOIN DE_PROJECT1.DBO.ORDERS o 
    ON p.product_ID = o.PRODUCT_ID
GROUP BY 
    p.category
ORDER BY 
    total_revenue DESC;



SELECT TOP 5
    c.customer_id,
    c.customer_name,
    SUM(o.QUANTITY * p.unit_price) AS total_spend
FROM DE_PROJECT1.DBO.customers c
INNER JOIN DE_PROJECT1.DBO.ORDERS o 
    ON c.customer_id = o.CUSTOMER_ID
INNER JOIN DE_PROJECT1.DBO.Products p 
    ON o.PRODUCT_ID = p.product_ID
GROUP BY 
    c.customer_id,
    c.customer_name
ORDER BY 
    total_spend DESC;