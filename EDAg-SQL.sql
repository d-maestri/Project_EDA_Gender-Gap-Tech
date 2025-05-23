--Gender distribution 
SELECT Q3 AS Gender,COUNT(*) AS "Total Respondents",ROUND(CAST(COUNT(*) AS REAL) * 100 / SUM(COUNT(*)) OVER (), 2) AS "Percentage"
FROM responses_clean_gender
WHERE Q3 IS NOT NULL -- Exclude cases where gender was not provided
GROUP BY Q3
ORDER BY "Total Respondents" DESC;

--Country distribution
SELECT DISTINCT Q4 AS Country, COUNT(*) AS "Total respondents", ROUND(CAST(COUNT(*) AS REAL) * 100 / SUM(COUNT(*)) OVER (), 2) AS "Percentage"
FROM responses_clean_gender
GROUP BY Q4
ORDER BY "Total respondents" DESC;
--LIMIT 15;

--Education level, by gender
SELECT Q3 AS Gender, Q8 AS "Education Level",COUNT(*) AS "Total Respondents", ROUND(CAST(COUNT(*) AS REAL) * 100 / SUM(COUNT(*)) OVER (PARTITION BY Q3), 2) AS "% by Gender"
FROM responses_clean_gender
WHERE Q3 IS NOT NULL AND Q8 IS NOT NULL
GROUP BY Q3, Q8
ORDER BY Q3, "Total Respondents" DESC;

--Gender by Education by level
SELECT Q8 AS "Education Level", Q3 AS Gender, COUNT(*) AS "Total Respondents", ROUND(CAST(COUNT(*) AS REAL) * 100 / SUM(COUNT(*)) OVER (PARTITION BY Q8), 2) AS "% by Education"
FROM responses_clean_gender
WHERE Q3 IS NOT NULL AND Q8 IS NOT NULL
GROUP BY Q8, Q3
ORDER BY Q8, "Total Respondents" DESC;

--Age
SELECT Q3 AS "Gender", Q2 AS "Age", COUNT(*) AS "Total"
FROM responses_clean_gender
GROUP BY Q3, Q2





