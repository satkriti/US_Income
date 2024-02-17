#US Household Income EDA

SELECT *
FROM ushouseholdincome;

SELECT *
FROM ushouseholdincome_statistics;

SELECT State_Name, County, City, ALand, AWater
FROM ushouseholdincome; -- area of land and water

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM ushouseholdincome
GROUP BY State_Name
Order by 2 DESC;


SELECT State_Name, SUM(ALand), SUM(AWater)
FROM ushouseholdincome
GROUP BY State_Name
Order by 2 DESC
LIMIT  10;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM ushouseholdincome
GROUP BY State_Name
Order by 3 DESC
LIMIT  10;

SELECT *
FROM ushouseholdincome i
JOIN ushouseholdincome_statistics st
ON i.id = st.id;

SELECT *
FROM ushouseholdincome i
INNER JOIN ushouseholdincome_statistics st
	ON i.id = st.id
    WHERE Mean <> 0; 
    
SELECT i.State_Name, County, Type, `Primary`, Mean, Median
FROM ushouseholdincome i
INNER JOIN ushouseholdincome_statistics st
	ON i.id = st.id
    WHERE Mean <> 0;
    
        
SELECT i.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM ushouseholdincome i
INNER JOIN ushouseholdincome_statistics st
	ON i.id = st.id
	WHERE Mean <> 0
    GROUP BY i.State_Name
    ORDER BY 2;

SELECT Type, `Primary`, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM ushouseholdincome i
INNER JOIN ushouseholdincome_statistics st
	ON i.id = st.id
	WHERE Mean <> 0
    GROUP BY Type, `Primary`;
    
SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM ushouseholdincome i
INNER JOIN ushouseholdincome_statistics st
	ON i.id = st.id
	WHERE Mean <> 0
    GROUP BY Type
    Order by 2 DESC;
    
SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM ushouseholdincome i
INNER JOIN ushouseholdincome_statistics st
	ON i.id = st.id
	WHERE Mean <> 0
    GROUP BY Type
    Order by 3 DESC;
    
SELECT * 
FROM ushouseholdincome
WHERE Type ='Community';

SELECT * 
FROM ushouseholdincome
WHERE Type ='Community'
AND row_id = 25748;  -- county = R�o Grande Municipio

UPDATE ushouseholdincome
SET County = 'Rio Grande Municipio'
WHERE row_id = 25748;

SELECT * 
FROM ushouseholdincome
WHERE Type ='Community'
;

    
SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM ushouseholdincome i
INNER JOIN ushouseholdincome_statistics st
	ON i.id = st.id
	WHERE Mean <> 0
    GROUP BY Type
    HAVING COUNT(Type) > 100
    Order by 4 DESC;

SELECT i.State_Name, City, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM ushouseholdincome i
JOIN ushouseholdincome_statistics s
ON i.id = s.id
GROUP BY i.State_Name, City
ORDER BY 3 DESC;
    