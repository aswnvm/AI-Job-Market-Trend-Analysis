use master;
use AiJobMarket;
SELECT
	salary_usd
FROM 
	bronze.jobs_raw
where
	salary_usd IS NULL

-- checking salary_currency cardinality
SELECT
	DISTINCT
	salary_usd
FROM 
	bronze.jobs_raw

-- checking experience_level cardinality
SELECT
	DISTINCT
	experience_level
FROM 
	bronze.jobs_raw

-- checking employment_type cardinality
SELECT
	DISTINCT
	employment_type
FROM 
	bronze.jobs_raw

-- checking company_location quality
SELECT 
	*
FROM
	bronze.jobs_raw
WHERE
	company_location IS NULL;

-- checking company_size cardinality
SELECT
	DISTINCT
	company_size
FROM 
	bronze.jobs_raw

-- checking employee_residence quality
SELECT 
	*
FROM
	bronze.jobs_raw
WHERE
	employee_residence IS NULL;

-- checking remote_ratio quality
SELECT 
	*
FROM
	bronze.jobs_raw
WHERE
	remote_ratio IS NULL;

-- checking required_skills quality
SELECT TOP 10
	required_skills
FROM
	bronze.jobs_raw;

-- checking required_education quality
SELECT
	required_education
FROM
	bronze.jobs_raw
WHERE
	required_education IS NULL

-- checking experience_years quality
SELECT
	experience_years
FROM
	bronze.jobs_raw
WHERE
	experience_years IS NULL

-- checking industry quality
SELECT
	industry
FROM
	bronze.jobs_raw
WHERE
	industry IS NULL OR
	industry != TRIM(industry);


-- checking dates quality
SELECT
	*
FROM
	bronze.jobs_raw
WHERE
	posting_date > application_deadline
	or posting_date is null
	or application_deadline is null;

-- checking job_description_length quality
SELECT
	job_description_length
FROM
	bronze.jobs_raw
WHERE
	job_description_length IS NULL OR
	job_description_length = 0

-- checking benefits_score quality
SELECT
	benefits_score
FROM
	bronze.jobs_raw
WHERE
	benefits_score IS NULL

-- checking company_name quality
SELECT
	company_name
FROM
	bronze.jobs_raw
WHERE
	company_name IS NULL OR
	company_name != TRIM(company_name)