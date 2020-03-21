-- 1. For all the questions in this practice set, you will be using the Salary by Job Range Table. 
-- This is a single table titled: salary_range_by_job_classification. This table contains the following columns:

-- SetID
-- Job_Code
-- Eff_Date
-- Sal_End_Date
-- Salary_setID
-- Sal_Plan
-- Grade
-- Step
-- Biweekly_High_Rate
-- Biweekly_Low_Rate
-- Union_Code
-- Extended_Step
-- Pay_Type

-- 2. Find the distinct values for the extended step. The code has been started for you, but you will need to program 
-- the third line yourself before running the query.

SELECT DISTINCT Extended_step
FROM salary_range_by_job_classification;
