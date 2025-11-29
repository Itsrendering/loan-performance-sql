
-- 1. Total Loan Amount Issued by the Bank
SELECT 
    SUM(loan_amount) AS total_loan_amount
FROM loan_data;


-- 2. Overall Loan Default Rate
SELECT 
    COUNT(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 END) * 1.0 / COUNT(*) 
    AS default_rate
FROM loan_data;
