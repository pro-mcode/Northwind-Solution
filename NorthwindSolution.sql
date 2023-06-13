--50 Practice Queries of Northwind Database With PostgreSQL

--[1]. Create a report that shows the CategoryName and Description 
-- from the categories table sorted by CategoryName
SELECT 
    category_name, 
    description 
FROM categories
ORDER BY category_name ASC;

--[2]. Create a report that shows the ContactName, CompanyName, 
-- ContactTitle and Phone number from the customers table sorted by Phone.
SELECT 
    contact_name, 
    company_name, 
    contact_title, 
    phone 
FROM customers
ORDER BY phone DESC;

--[3]. Create a report that shows the capitalized FirstName and capitalized 
-- LastName renamed as FirstName and Lastname respectively and HireDate 
-- from the employees table sorted from the newest to the oldest employee
SELECT 
    firstname AS FirstName, 
    lastname AS Lastname, 
    hire_date 
FROM employees
ORDER BY hire_date DESC;

--[4]. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate,
-- CustomerID, Freight from the orders table sorted by Freight in 
-- descending order
SELECT 
    order_id, 
    order_date, 
    shipped_date, 
    customer_id, 
    freight 
FROM orders
ORDER BY freight DESC
LIMIT 10;

--[5]. Create a report that shows all the CustomerID in lowercase 
-- letter and renamed as ID from the customers table
SELECT 
    LOWER(customer_id) AS ID 
FROM customers;

--[6]. Create a report that shows the CompanyName, Fax, Phone, Country, 
-- HomePage from the suppliers table sorted by the Country in 
-- descending order then by CompanyName in ascending order
SELECT 
    company_name, 
    fax, 
    phone, 
    country, 
    homepage 
FROM suppliers
ORDER BY country DESC, company_name ASC;

--[7]. Create a report that shows CompanyName, ContactName of all 
-- customers from 'Buenos Aires' only 
SELECT 
    company_name, 
    contact_name 
FROM customers
WHERE city = 'Buenos Aires';

--[8]. Create a report showing ProductName, UnitPrice, QuantityPerUnit of 
-- products that are out of stock
SELECT 
    product_name, 
    unit_price, 
    quantity_per_unit 
FROM products
WHERE units_in_stock = 0;

--[9]. Create a report showing all the ContactName, Address, 
-- City of all customers not from Germany, Mexico, Spain
SELECT 
    contact_name, 
    address, 
    city 
FROM customers
WHERE country  NOT IN ('Germany','Mexico','Spain');

--[10]. Create a report showing OrderDate, ShippedDate, CustomerID, 
-- Freight of all orders placed on 21 May 1996 
SELECT 
    order_date, 
    shipped_date, 
    customer_id, 
    freight 
FROM orders
WHERE order_date = '1996-05-21';

--[11]. Create a report showing FirstName, LastName, 
-- Country from the employees not from United States
SELECT 
    firstname, 
    lastname, 
    country 
FROM employees
WHERE country != 'USA';

--[12]. Create a report that shows the EmployeeID, OrderID, CustomerID, 
-- RequiredDate, ShippedDate from all orders shipped later than the 
-- required date
SELECT 
    employee_id, 
    order_id, 
    customer_id, 
    required_date, 
    shipped_date 
FROM orders
WHERE shipped_date > required_date;

--[13]. Create a report that shows the City, CompanyName, ContactName of 
-- customers from cities starting with A or B
SELECT 
    city, 
    company_name, 
    contact_name 
FROM customers
WHERE city LIKE 'A%' OR city LIKE 'B%';

--[14]. Create a report showing all the even numbers of 
-- OrderID from the orders table
SELECT 
    order_id 
FROM orders
WHERE order_id % 2 = 0;

--[15]. Create a report that shows all the orders where the 
-- freight cost more than $500
SELECT * 
FROM orders
WHERE freight > 500;

--[16]. Create a report that shows the ProductName, UnitsInStock, 
-- UnitsOnOrder, ReorderLevel of all products that are up for reorder
SELECT 
    product_name, 
    units_in_stock, 
    units_on_order, 
    reorder_level 
FROM products
WHERE reorder_level > 0;

--[17]. Create a report that shows the CompanyName, ContactName number of all 
-- customer that have no fax number
SELECT 
    company_name, 
    contact_name 
FROM customers
WHERE fax IS NULL;

--[18]. Create a report that shows the FirstName, LastName of all employees 
-- that do not report to anybody
SELECT 
    firstname, 
    lastname 
FROM employees 
WHERE reports_to IS NULL;

--[19]. Create a report showing all the odd numbers of OrderID 
-- from the orders table
SELECT 
    order_id 
FROM orders
WHERE order_id % 2 != 0;

--[20]. Create a report that shows the CompanyName, ContactName, 
-- Fax of all customers that do not have Fax number and sorted by ContactName
SELECT 
    company_name, 
    contact_name, 
    fax 
FROM customers
WHERE fax IS NULL
ORDER BY contact_name ASC;

--[21]. Create a report that shows the City, CompanyName, ContactName of 
-- customers from cities that has letter L in the name sorted by ContactName
SELECT 
    city, 
    company_name, 
    contact_name 
FROM customers
WHERE city LIKE '%L%'
ORDER BY contact_name ASC;

--[22]. Create a report that shows the FirstName, LastName, 
-- BirthDate of employees born in the 1950s
SELECT 
    firstname, 
    lastname, 
    birth_date 
FROM employees 
WHERE birth_date BETWEEN '1950-01-01' AND '1959-12-31';

--[23]. Create a report that shows the FirstName, LastName, the year of 
-- Birthdate as birth year from the employees table
SELECT 
    firstname, 
    lastname, 
    EXTRACT(YEAR FROM birth_date) AS birth_year
 FROM employees;

--[24]. Create a report showing OrderID, total number of Order ID as 
-- NumberofOrders from the orderdetails table grouped by OrderID and sorted 
-- by NumberofOrders in descending order. HINT: you will need to use a 
-- Groupby statement
SELECT 
    order_id, 
    COUNT(order_id) AS Number_of_orders 
FROM order_details
GROUP BY order_id 
ORDER BY Number_of_orders DESC;

--[25]. Create a report that shows the SupplierID, ProductName, CompanyName 
-- from all product Supplied by Exotic Liquids, Specialty Biscuits,Ltd., 
-- Escargots Nouveaux sorted by the supplier ID
SELECT 
    products.supplier_id, 
    products.product_name, 
    suppliers.company_name 
FROM products
JOIN suppliers
ON products.supplier_id = suppliers.supplier_id
WHERE company_name IN ('Exotic Liquids',
'Specialty Biscuits, Ltd.', 'Escargots Nouveaux')
ORDER BY supplier_id ASC;

--[26]. Create a report that shows the ShipPostalCode, OrderID, OrderDate,
-- RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode
-- beginning with "98124"
SELECT 
    ship_postal_code, 
    order_id, 
    order_date, 
    required_date, 
    shipped_date, 
    ship_address 
FROM orders
WHERE ship_postal_code LIKE '98124%';

--[27]. Create a report that shows the ContactName, ContactTitle, 
-- CompanyName of customers that the has no "Sales" in their ContactTitle
SELECT 
    contact_name, 
    contact_title, 
    city, 
    country 
FROM customers
WHERE contact_title NOT LIKE '%Sales%';

--[28]. Create a report that shows the LastName, FirstName, City of 
-- employees in cities other "Seattle";
SELECT 
    lastname, 
    firstname, 
    city 
FROM employees
WHERE city != 'Seattle';

--[29]. Create a report that shows the CompanyName, ContactTitle, City,
-- Country of all customers in any city in Mexico or other cities in 
-- Spain other than Madrid
SELECT 
    company_name, 
    contact_title, 
    city, 
    country 
FROM customers
WHERE country IN ('Mexico', 'Spain') AND city != 'Madrid';

--[30]. Create a select statement that outputs the following:
-- picture 30.
SELECT
    CONCAT(firstname,' ',lastname,' ','can be reached at',' ','x',extension)
    AS ContactInfo
FROM employees;

--[31]. . Create a report that shows the ContactName of all customers that
-- do not have letter A as the second alphabet in their Contactname
SELECT 
    contact_name 
FROM customers 
WHERE contact_name NOT LIKE '_a%';

--[32]. Create a report that shows the average UnitPrice rounded to the
-- next whole number, total price of UnitsInStock and maximum number of 
-- orders from the products table. All saved as AveragePrice, TotalStock and
-- MaxOrder respectively
SELECT 
    ROUND(AVG(unit_price)) AS AveragePrice, 
    ROUND(SUM(unit_price * units_in_stock)) AS TotalStock, 
    MAX(units_on_order) AS MaxOrder 
FROM products;

--[33]. Create a report that shows the SupplierID, CompanyName, CategoryName,
-- ProductName and UnitPrice from the products, suppliers and categories table
SELECT 
    suppliers.supplier_id, 
    suppliers.company_name, 
    categories.category_name, 
    products.product_name, 
    products.unit_price
FROM suppliers
FULL JOIN products
ON suppliers.supplier_id = products.supplier_id
JOIN categories
ON products.category_id = categories.category_id
ORDER BY company_name ASC, category_name ASC;

--[34]. Create a report that shows the CustomerID, sum of Freight, from 
-- the orders table with sum of freight greater $200, grouped by CustomerID.
-- HINT: you will need to use a Groupby and a Having statement
SELECT 
    customer_id, 
    ROUND(SUM(freight)) AS total_freight 
FROM orders
GROUP BY customer_id
HAVING SUM(freight) > 200;

--[35]. Create a report that shows the OrderID ContactName, UnitPrice, 
-- Quantity, Discount from the order details, orders and customers table
-- with discount given on every purchase
SELECT 
    orders.order_id, 
    customers.contact_name, 
    order_details.unit_price, 
    order_details.quantity, 
    order_details.discount
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
JOIN order_details
ON orders.order_id = order_details.order_id
WHERE discount != 0;

--[36]. Create a report that shows the EmployeeID, the LastName and FirstName
-- as employee, and the LastName and FirstName of who they report to as 
-- manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin
SELECT 
    a.employee_id,
    CONCAT(a.firstname, a.lastname) AS employee,
    CONCAT(b.firstname, b.lastname) AS manager
FROM employees a
LEFT JOIN employees b
ON a.reports_to = b.employee_id
ORDER BY a.employee_id;

--[37]. Create a report that shows the average, minimum and maximum UnitPrice
-- of all products as AveragePrice, MinimumPrice and MaximumPrice respectively
SELECT 
    product_name,
    AVG(unit_price) AS AveragePrice,
    MIN(unit_price) AS MinimumPrice,
    MAX(unit_price) AS MaximumPrice
FROM products
GROUP BY product_name;

--[38]. Create a view named CustomerInfo that shows the CustomerID, 
-- CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, 
-- OrderDate, RequiredDate, ShippedDate from the customers and orders table.
-- HINT: Create a View
CREATE VIEW CustomerInfo AS
    SELECT 
        c.customer_id, 
        c.company_name, 
        c.contact_name, 
        c.contact_title, 
        c.address, 
        c.city, 
        c.country, 
        c.phone,
        o.order_date,
        o.required_date,
        o.shipped_date
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id;
SELECT * FROM CustomerInfo;

--[39]. Change the name of the view you created from customerinfo to 
-- customer details
CREATE OR REPLACE VIEW CustomerDetails AS
    SELECT 
        c.customer_id, 
        c.company_name, 
        c.contact_name, 
        c.contact_title, 
        c.address, 
        c.city, 
        c.country, 
        c.phone,
        o.order_date,
        o.required_date,
        o.shipped_date
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id;
SELECT * FROM CustomerDetails;

--[40]. Create a view named ProductDetails that shows the ProductID, 
-- CompanyName, ProductName, CategoryName, Description, QuantityPerUnit,
-- UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from 
-- the supplier, products andcategories tables. HINT: Create a View
CREATE VIEW ProductDetails AS
    SELECT 
        p.product_id,
        s.company_name,
        p.product_name,
        c.category_name,
        c.description,
        p.quantity_per_unit,
        p.unit_price,
        p.units_in_stock,
        p.units_on_order,
        p.reorder_level,
        p.discontinued
    FROM suppliers s
    JOIN products p
    ON s.supplier_id = p.supplier_id
    JOIN categories c
    ON p.category_id = c.category_id;
SELECT * FROM ProductDetails;

--[41]. Drop the customer details view
DROP VIEW CustomerDetails;

--[42]. Create a report that fetch the first 5 character of categoryName 
-- from the category tables and renamed as ShortInfo
SELECT 
    SUBSTRING(category_name, 1, 5) AS ShortInfo 
FROM categories;

--[43]. Create a copy of the shipper table as shippers_duplicate. 
-- Then insert a copy of shippers data into the new table 
-- HINT: Create a Table, use the LIKE Statement and INSERT INTO statement
CREATE TABLE shippers_duplicate AS
    SELECT * 
    FROM  shippers;
SELECT * 
FROM shippers_duplicate;

--[44]. Create a select statement that outputs the following from the 
-- shippers_duplicate Table: Picture 44.
ALTER TABLE shippers_duplicate
ADD email VARCHAR(150);
UPDATE shippers_duplicate
SET email = 'speedyexpress@gmail.com'
WHERE shipper_id = 1;
UPDATE shippers_duplicate
SET email = 'unitedpackage@gmail.com'
WHERE shipper_id = 2;
UPDATE shippers_duplicate
SET email = 'federalshipping@gmail.com'
WHERE shipper_id = 3;
SELECT * 
FROM shippers_duplicate
ORDER BY shipper_id
LIMIT 3;

--[45]. Create a report that shows the CompanyName and ProductName from all
-- product in the Seafood category
SELECT 
    suppliers.company_name, 
    products.product_name
FROM suppliers
JOIN products
ON suppliers.supplier_id = products.supplier_id
JOIN categories
ON products.category_id = categories.category_id
WHERE category_name = 'Seafood';

--[46]. Create a report that shows the CategoryID, CompanyName and 
-- ProductName from all product in the categoryID 5 
SELECT 
    p.category_id,
    s.company_name, 
    p.product_name
FROM products p
JOIN suppliers s
ON p.supplier_id = s.supplier_id
WHERE category_id = 5;

--[47]. Delete the shippers_duplicate table 
DROP TABLE shippers_duplicate;

--[48]. Create a select statement that ouputs the following from the employees table.
-- NB: The age might differ depending on the year you are attempting this query
-- picture 48.
SELECT 
    lastname, 
    firstname, 
    title, 
    CONCAT(EXTRACT(YEAR FROM AGE(CAST(birth_date AS DATE))),' ','Years') AS Age 
    --EXTRACT(YEAR FROM AGE(CAST(birth_date AS DATE))) 
    --AGE(CAST(birth_date AS DATE))
FROM employees;

--[49]. Create a report that the CompanyName and total number of orders by 
-- customer renamed as number of orders since Decemeber 31, 1994. 
-- Show number of Orders greater than 10
SELECT 
    company_name, 
    COUNT(order_id) AS number_of_orders_since_december_31_1994 
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY company_name
HAVING COUNT(order_id) > 10;

--[50]. Create a select statement that ouputs the following from the product
-- table. NB: It should return 77rows
SELECT 
    CONCAT(product_name,' ','weigh/is',' ',quantity_per_unit,' ',
    'and cost',' ',unit_price) AS ProductInfo
FROM products
LIMIT 77;