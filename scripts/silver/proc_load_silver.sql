/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/

CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		PRINT '================================================';
        PRINT 'Loading Silver Layer';
        PRINT '================================================';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.jobs_cleaned';
		TRUNCATE TABLE silver.jobs_cleaned;
		PRINT '>> Inserting Data Into: silver.jobs_cleaned';

		INSERT INTO 
			silver.jobs_cleaned(
				job_id,
				job_title,
				salary_usd,
				salary_currency,
				experience_level,
				employment_type,
				company_location,
				company_size,
				employee_residence,
				remote_ratio,
				required_skills,
				required_education,
				experience_years,
				industry,
				posting_date,
				application_deadline,
				benefits_score,
				company_name
			)
		SELECT
			job_id, --
			job_title, --
			salary_usd, --
			CASE TRIM(UPPER(salary_currency))
				WHEN 'CAD' THEN 'Canadian Dollar' 
				WHEN 'USD' THEN 'United States Dollar'
				WHEN 'CHF' THEN 'Swiss Franc'
				WHEN 'GBP' THEN 'British Pound Sterling'
				WHEN 'AUD' THEN 'Australian Dollar'
				WHEN 'EUR' THEN 'Euro'
				WHEN 'SGD' THEN 'Singapore Dollar'
				WHEN 'JPY' THEN 'Japanese Yen'
				ELSE 'n/a'
			END 'salary_currency',
			CASE TRIM(UPPER(experience_level))
				WHEN 'MI' THEN 'Mid-Level' 
				WHEN 'SE' THEN 'Senior-Level'
				WHEN 'EX' THEN 'Executive-Level'
				WHEN 'EN' THEN 'Entry-Level'
				ELSE 'n/a'
			END 'experience_level',
			CASE TRIM(UPPER(employment_type))
				WHEN 'CT' THEN 'Contract' 
				WHEN 'FL' THEN 'Freelance'
				WHEN 'PT' THEN 'Part-Time'
				WHEN 'FT' THEN 'Full-Time'
				ELSE 'n/a'
			END 'employment_type',
			company_location, -- 
			CASE TRIM(UPPER(company_size))
				WHEN 'S' THEN 'Small' 
				WHEN 'M' THEN 'Medium'
				WHEN 'L' THEN 'Large'
				ELSE 'n/a'
			END 'company_size',
			employee_residence, --
			remote_ratio, --
			REPLACE(LTRIM(RTRIM(REPLACE(required_skills, ' |', ','))), '| ', ',')  'required_skills', 
			required_education, --
			experience_years, --
 			industry, -- 
			posting_date, --
			application_deadline, -- 
			benefits_score, --
			company_name --
		FROM
			bronze.jobs_raw;
		SET @end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Loading Silver Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END