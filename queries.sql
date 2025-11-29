
-- 1. Total Loan Amount Issued by the Bank
SELECT 
    SUM(loan_amount) AS total_loan_amount
FROM loan_data;


-- 2. Overall Loan Default Rate
SELECT 
    COUNT(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 END) * 1.0 / COUNT(*) 
    AS default_rate
FROM loan_data;




-- 3. Default Rate by Credit Score Range (Risk Segmentation)
SELECT
    CASE 
        WHEN credit_score >= 750 THEN '750+'
        WHEN credit_score BETWEEN 700 AND 749 THEN '700-749'
        WHEN credit_score BETWEEN 650 AND 699 THEN '650-699'
        ELSE 'Below 650'
    END AS credit_score_range,
    COUNT(*) AS total_loans,
    COUNT(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 END) AS total_defaults,
    COUNT(CASE WHEN loan_status IN ('Charged Off', 'Default') THEN 1 END) * 1.0 / COUNT(*) 
        AS default_rate
FROM loan_data
GROUP BY credit_score_range
ORDER BY default_rate DESC;




-- 4. Estimated Profit by Loan Term
SELECT
    loan_term,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_issued,
    AVG(interest_rate) AS avg_interest_rate,
    SUM(loan_amount * interest_rate / 100.0) AS estimated_interest_revenue
FROM loan_data
GROUP BY loan_term
ORDER BY estimated_interest_revenue DESC;
