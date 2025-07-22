use master;
use AiJobMarket;

if OBJECT_ID('bronze.jobs_raw', 'U') IS NOT NULL
	DROP TABLE bronze.jobs_raw;
GO

CREATE TABLE bronze.jobs_raw (
	job_id NVARCHAR(50),
	job_title NVARCHAR(100),
	salary_usd INT,
	salary_currency NVARCHAR(10),
	experience_level NVARCHAR(10),
	employment_type NVARCHAR(10),
	company_location NVARCHAR(50),
	company_size NVARCHAR(10),
	employee_residence NVARCHAR(50),
	remote_ratio INT,
	required_skills NVARCHAR(MAX), 
	required_education NVARCHAR(50),
	experience_years INT,          
	industry NVARCHAR(50),
	posting_date DATE,
	application_deadline DATE,
	job_description_length INT,     
	benefits_score DECIMAL(5, 2),  
	company_name NVARCHAR(100),
);

GO