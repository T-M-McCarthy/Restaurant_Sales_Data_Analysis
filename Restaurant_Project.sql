USE restaurant_sales;

-- 1. View restaurant_sales table and check to see if there are any NULL values.
SELECT * FROM fast_food_sales;

SELECT * 
FROM fast_food_sales
WHERE item_price IS NULL;

-- 2. Replace empty transaction type with a value. (UPDATED) 
UPDATE fast_food_sales
SET transaction_type = 'Unknown'
WHERE transaction_type = '';


-- 2. What are the items on the menu?
SELECT DISTINCT item_name FROM fast_food_sales
ORDER BY item_name;

-- 3. What are the least and most expensive item?

-- Least Expensive
SELECT DISTINCT item_name, item_type, MIN(item_price) as prices
FROM fast_food_sales 
GROUP BY item_name, item_type
ORDER BY prices;

-- Most Expensive
SELECT DISTINCT item_name, item_type, MAX(item_price) as price 
FROM fast_food_sales 
GROUP BY item_name, item_type
ORDER BY price DESC;

-- 4. What are the different item types available?
SELECT DISTINCT item_type FROM fast_food_sales;

-- 5. What is the quantity of items sold for each item type?
SELECT item_type, SUM(quantity) as total_sold
FROM fast_food_sales
GROUP BY item_type
ORDER BY item_type; 

-- 6. What is the total revenue of each item type?
SELECT item_type, SUM(transaction_amount) as total_sales
FROM fast_food_sales
GROUP BY item_type
ORDER BY item_type; 

-- 7. How many sales occured for each time of day?
SELECT time_of_sale, count(order_id) as total_sales
FROM fast_food_sales
GROUP BY time_of_sale
ORDER BY total_sales;

-- 8. How many transactions were there for each transaction type? 
SELECT transaction_type, COUNT(order_id) AS total_transaction_type
FROM fast_food_sales
GROUP BY transaction_type
ORDER BY total_transaction_type;

-- 9. What is the total revenue of all items?
SELECT COALESCE(item_type, 'Total') as item_type, SUM(transaction_amount) as Revenue
FROM fast_food_sales
GROUP BY item_type WITH ROLLUP;