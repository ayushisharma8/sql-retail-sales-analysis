--Step3: Create the Final Table (with Correct Data Types)
CREATE TABLE retail_sales (
    transactions_id   INT PRIMARY KEY,
    sale_date         DATE,
    sale_time         TIME,
    customer_id       INT,
    gender            VARCHAR(15),
    age               INT,
    category          VARCHAR(15),
    quantiy           FLOAT,
    price_per_unit    FLOAT,
    cogs              FLOAT,
    total_sale        FLOAT
);

--Created a empty table but now with correct data types (Let's check with select query)
SELECT * FROM retail_sales


--Clean and Insert Data into Final Table
--Convert text values from the staging table into proper data types:
INSERT INTO retail_sales (
    transactions_id, sale_date, sale_time, customer_id, gender,
    age, category, quantiy, price_per_unit, cogs, total_sale
)
SELECT
    TRY_CAST(transactions_id AS INT),
    TRY_CONVERT(DATE, sale_date, 103),   -- 103 = DD/MM/YYYY format
    TRY_CONVERT(TIME, sale_time, 108),   -- 108 = HH:MM:SS
    TRY_CAST(customer_id AS INT),
    gender,
    TRY_CAST(age AS INT),
    category,
    TRY_CAST(quantiy AS FLOAT),
    TRY_CAST(price_per_unit AS FLOAT),
    TRY_CAST(cogs AS FLOAT),
    TRY_CAST(total_sale AS FLOAT)
FROM retail_sales_staging;

SELECT * FROM retail_sales
