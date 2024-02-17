#US Household Income Data Cleaning

SELECT *
FROM ushouseholdincome;

SELECT *
FROM ushouseholdincome_statistics;

SELECT COUNT(Row_ID) FROM ushouseholdincome; 
SELECT COUNT(id) FROM ushouseholdincome_statistics; 

-- Identifying Duplicates
SELECT id, count(id)
FROM ushouseholdincome
GROUP BY id
HAVING COUNT(id) > 1;

SELECT * FROM
(SELECT row_id, id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
FROM ushouseholdincome ) AS dup_table
WHERE row_num > 1;

SELECT row_id FROM
(SELECT row_id, id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
FROM ushouseholdincome ) AS dup_table
WHERE row_num > 1;

-- deleting duplicates
DELETE FROM ushouseholdincome
WHERE row_id IN (
	SELECT row_id 
    FROM (
		SELECT row_id, id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
		FROM ushouseholdincome 
        )AS dup_table
WHERE row_num > 1
);

-- Identifying Duplicates in table 2
SELECT id, count(id)
FROM ushouseholdincome_statistics
GROUP BY id
HAVING COUNT(id) > 1; -- none

SELECT State_name, COUNT(State_Name)
FROM ushouseholdincome
GROUP BY State_Name; -- here  'alabama' is not dispalyed although it's wrong

SELECT DISTINCT(State_name)
FROM ushouseholdincome
ORDER BY 1; -- changing Georgia first

UPDATE ushouseholdincome
SET State_name = 'Georgia'
WHERE State_name = 'georia';

UPDATE ushouseholdincome
SET State_name = 'Alabama'
WHERE State_name = 'alabama';

SELECT DISTINCT(State_ab)
FROM ushouseholdincome
ORDER BY 1;

SELECT *
FROM ushouseholdincome
WHERE Place = '' 
ORDER BY 1;

SELECT *
FROM ushouseholdincome
WHERE County = 'Autauga County' -- ALL Place column is Autaugaville
ORDER BY 1;

UPDATE ushouseholdincome
SET Place = 'Autaugaville'
WHERE City = 'Vinemont'
AND County = 'Autauga County';

SELECT Type, COUNT(Type)
FROM ushouseholdincome
GROUP BY Type;

UPDATE ushouseholdincome
SET Type = 'Borough'
WHERE Type = 'Boroughs';

SELECT Aland, AWater
FROM ushouseholdincome
ORDER BY Aland, AWater;

SELECT ALand, AWater
FROM ushouseholdincome
WHERE AWater = 0 OR AWater = '' OR AWater IS NULL;

SELECT ALand
FROM ushouseholdincome
WHERE ALand = 0 OR ALand = '' OR ALand IS NULL;