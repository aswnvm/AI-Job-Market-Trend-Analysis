/*
===============================================================================
DDL Script: Create Gold Layer Views
===============================================================================
Script Purpose:
    This script creates a business-ready view within the Gold layer of the 
    data warehouse, aligning with the Star Schema architecture. 

    The Gold layer serves as the curated and enriched layer used for downstream 
    analytics, reporting, and machine learning models.

View Details:
    View Name: gold.salary_prediction_features
    Description:
        - Acts as a dimension-like feature set for salary prediction.
        - Selects enriched job-related attributes from the Silver layer.
        - Filters out records with missing salary values to ensure model readiness.

Usage:
    - Ideal for salary trend analysis, model training, and dashboard reporting.
    - Can be consumed directly in Power BI, ML pipelines, or analytics tools.

===============================================================================
*/

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
