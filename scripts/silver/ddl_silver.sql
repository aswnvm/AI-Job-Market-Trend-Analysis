/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/
IF OBJECT_ID('silver.jobs_cleaned', 'U') IS NOT NULL
	DROP TABLE silver.jobs_cleaned;

CREATE TABLE silver.jobs_cleaned(
	job_id NVARCHAR(50),
	job_title NVARCHAR(100),
	salary_usd INT,
	salary_currency NVARCHAR(50),
	experience_level NVARCHAR(50),
	employment_type NVARCHAR(50),
	company_location NVARCHAR(50),
	company_size NVARCHAR(50),
	employee_residence NVARCHAR(50),
	remote_ratio INT,
	required_skills NVARCHAR(MAX), 
	required_education NVARCHAR(50),
	experience_years INT,          
	industry NVARCHAR(50),
	posting_date DATE,
	application_deadline DATE,   
	benefits_score DECIMAL(5, 2),  
	company_name NVARCHAR(100),
	dWh_create_date DATETIME2 DEFAULT GETDATE()
);