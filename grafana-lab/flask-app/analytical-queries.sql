-- Total refunds by year
SELECT year, SUM(refund) AS total_refunds
FROM returns
GROUP BY year;

-- Total tax paid by year
SELECT year, SUM(tax_paid) As total_tax 
FROM returns
GROUP BY year;

-- Average tax paid by state
SELECT t.state, AVG(r.tax_paid) AS average_tax_paid
FROM taxpayers t
JOIN returns r ON t.id = r.taxpayer_id
GROUP BY t.state;

-- Total number of filings by state
SELECT t.state, COUNT(r.id) AS total_filings
FROM taxpayers t
JOIN returns r ON t.id = r.taxpayer_id
GROUP BY t.state;

-- Total tax paid by filing type
SELECT filing_type, SUM(tax_paid) AS total_tax_paid
FROM returns
GROUP BY filing_type;

-- Yearly growth in total refunds
SELECT year, SUM(refund) AS total_refunds,
       LAG(SUM(refund)) OVER (ORDER BY year) AS previous_year_refunds,
       (SUM(refund) - LAG(SUM(refund)) OVER (ORDER BY year)) AS growth
FROM returns
GROUP BY year;

-- Total number of taxpayers by state
SELECT state, COUNT(*) AS total_taxpayers
FROM taxpayers
GROUP BY state;

-- Total refunds and average tax paid by year
SELECT year, SUM(refund) AS total_refunds, AVG(tax_paid) AS average_tax_paid
FROM returns
GROUP BY year;