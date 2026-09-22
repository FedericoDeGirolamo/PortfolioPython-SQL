-- Exploration of loan statuses to establish the PD Target Definition
SELECT 
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM loan), 2) AS percentage
	
FROM 
    loan
GROUP BY 
    loan_status
ORDER BY 
    total_loans DESC;


-- Step 2: Target Definition and Base Analytical Dataset Creation
-- We assign 1 to Defaults (Bads) and 0 to Fully Paid (Goods).
-- Ongoing loans ("Current") are excluded 

SELECT 
    
    loan_amnt,
    term,
    int_rate,
    annual_inc,
    loan_status,
    
    -- Target Variable Creation
    CASE 
        WHEN loan_status IN ('Charged Off', 'Default', 'Late (31-120 days)', 'Does not meet the credit policy. Status:Charged Off') THEN 1
        WHEN loan_status IN ('Fully Paid', 'Does not meet the credit policy. Status:Fully Paid') THEN 0
        ELSE NULL 
    END AS default_target

FROM 
    loan

WHERE 
    -- Filtering out indeterminate statuses
    loan_status NOT IN ('Current', 'In Grace Period', 'Late (16-30 days)')
    
-- Limit to 100 rows just to preview the result quickly
LIMIT 1000;


