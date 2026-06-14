CREATE DATABASE upi_analysis;
USE upi_analysis;
SELECT * FROM upi_transactions_2024 LIMIT 10;

SELECT 
COUNT(*) AS Total_Transactions,
SUM(`amount (INR)`) AS Total_Amount,
ROUND(AVG(`amount (INR)`),2) AS Avg_Amount
FROM upi_transactions_2024;

SELECT 
transaction_status,
COUNT(*) AS Total_Orders,
ROUND(COUNT(*) * 100.0 / 
(SELECT COUNT(*) FROM upi_transactions_2024),2) 
AS Percentage
FROM upi_transactions_2024
GROUP BY transaction_status
ORDER BY Total_Orders DESC;

SELECT 
COUNT(CASE WHEN fraud_flag = 1 THEN 1 END) 
AS Fraud_Transactions,
COUNT(*) AS Total_Transactions,
ROUND(COUNT(CASE WHEN fraud_flag = 1 THEN 1 END) 
* 100.0 / COUNT(*), 2) AS Fraud_Rate_Percent
FROM upi_transactions_2024;

SELECT sender_state,
COUNT(*) AS Total_Transactions,
SUM(`amount (INR)`) AS Total_Amount
FROM upi_transactions_2024
GROUP BY sender_state
ORDER BY Total_Amount DESC
LIMIT 5;

SELECT sender_bank,
COUNT(*) AS Total_Transactions,
SUM(`amount (INR)`) AS Total_Amount
FROM upi_transactions_2024
GROUP BY sender_bank
ORDER BY Total_Amount DESC
LIMIT 5;

SELECT hour_of_day,
COUNT(*) AS Total_Transactions
FROM upi_transactions_2024
GROUP BY hour_of_day
ORDER BY Total_Transactions DESC
LIMIT 5;

SELECT device_type,
COUNT(*) AS Total_Transactions,
ROUND(COUNT(*) * 100.0 /
(SELECT COUNT(*) FROM upi_transactions_2024),2)
AS Percentage
FROM upi_transactions_2024
GROUP BY device_type
ORDER BY Total_Transactions DESC;

SELECT merchant_category,
COUNT(*) AS Total_Transactions,
SUM(`amount (INR)`) AS Total_Amount
FROM upi_transactions_2024
GROUP BY merchant_category
ORDER BY Total_Amount DESC;

SELECT day_of_week,
COUNT(*) AS Total_Transactions,
SUM(`amount (INR)`) AS Total_Amount
FROM upi_transactions_2024
GROUP BY day_of_week
ORDER BY Total_Transactions DESC;

SELECT sender_age_group,
COUNT(*) AS Total_Transactions,
SUM(`amount (INR)`) AS Total_Amount,
ROUND(AVG(`amount (INR)`),2) AS Avg_Amount
FROM upi_transactions_2024
GROUP BY sender_age_group
ORDER BY Total_Amount DESC;