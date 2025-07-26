use master;
use AiJobMarket; 

IF OBJECT_ID('gold.', 'V') IS NOT NULL
	DROP VIEW gold.salary_prediction_features;
GO
CREATE VIEW 
	gold.salary_prediction_features 
	AS
		SELECT 
			job_id,
			job_title,
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
			benefits_score,
			posting_date,
			salary_usd
		FROM	
			silver.jobs_cleaned
		WHERE
			salary_usd IS NOT NULL;
