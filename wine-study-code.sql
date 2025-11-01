-- Create the database and select it
CREATE DATABASE sql_wine_study;
USE sql_wine_study;
SHOW TABLES;

-- Create table for the UCI Wine dataset
CREATE TABLE wine_dataset (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Alcohol FLOAT,
    Malicacid FLOAT,
    Ash FLOAT,
    Alcalinity_of_ash FLOAT,
    Magnesium FLOAT,
    Total_phenols FLOAT,
    Flavanoids FLOAT,
    Nonflavanoid_phenols FLOAT,
    Proanthocyanins FLOAT,
    Color_intensity FLOAT,
    Hue FLOAT,
    `0D280_0D31` FLOAT,
    Proline FLOAT,
    class INT
);

-- Create table for the Kaggle Wine Reviews dataset
CREATE TABLE wine_data_clean (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(100),
    province VARCHAR(100),
    variety VARCHAR(100),
    winery VARCHAR(150),
    description TEXT,
    points INT,
    price FLOAT
);

-- Allow local file importing
SET GLOBAL local_infile = 1;

-- Load UCI Wine data into wine_dataset
LOAD DATA LOCAL INFILE '/Users/camillascandola/Desktop/sql-wine-study/wine_dataset.csv'
INTO TABLE wine_dataset
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load Kaggle Wine Reviews data into wine_data_clean
LOAD DATA LOCAL INFILE '/Users/camillascandola/Desktop/sql-wine-study/winemag-data-130k-v2.csv'
INTO TABLE wine_data_clean
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM wine_dataset;
SELECT COUNT(*) FROM wine_data_clean;

SELECT * FROM wine_dataset LIMIT 5;
SELECT * FROM wine_data_clean LIMIT 5;

