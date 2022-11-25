-- Creating PERSON table
CREATE TABLE PERSONS ( 
    PersonID int NOT NULL PRIMARY KEY, 
    LastName varchar(255) NOT NULL, 
    FirstName varchar(255) NOT NULL,
    Sex char(1),
    bdate date,
    Age int
);

-- Inserting Values
INSERT INTO PERSONS VALUES (1, 'Amalia','Yutika','F',DATE '1994-05-03',28);
INSERT INTO PERSONS VALUES (2, 'Hariyanto','Hendy','M',DATE '1993-10-05',29);
INSERT INTO PERSONS(PersonID,LastName,FirstName,Sex,bdate) VALUES (3, 'Juwanto','Dio','M',DATE '1993-02-10');
INSERT INTO PERSONS(PersonID,LastName,FirstName,Sex,bdate) VALUES (4, 'Dilana','Natasya','F',DATE '1994-11-20');

-- Update data
UPDATE PERSON SET LastName = 'Harijuono' WHERE FirstName = 'Hendy';
-- "WHERE" is used to make that data only that is updated

-- We can't use delete to delete several columns, thus we use update to delete several columns

-- Delete
DELETE FROM PERSONS WHERE AGE = 29;

-- SELECT [DISTINCT] select_list
-- 	FROM table_source
-- 	[WHERE search_condition]
-- 	[GROUP BY group_by_expression]
-- 	[HAVING search_condition]
-- 	[ORDER BY order_expression [ASC | DESC] ]

-- SELECT
--  to show, use *
SELECT FirstName, AGE FROM PERSONS;

-- WHERE
SELECT FirstName, AGE
    FROM PERSONS
    WHERE AGE < 29;

-- Example of Comparison Operation

-- get male person
SELECT * FROM PERSONS WHERE Sex = 'M';
-- get person whose year of  birth more than 1993
WHERE extract(year from bdate) > 1993;
-- get female person born in May
WHERE Sex = 'F' and extract(month from bdate) = 5;
-- get person who don't input their age
SELECT * FROM PERSONS WHERE Age IS NULL;

-- LIKE (Pattern Comparing)
-- % = representing 0 to inf of any character
-- _ = representing 1 any character
-- EXAMPLE

-- Show person whose last name contains "lia"
SELECT * FROM PERSONS
WHERE LastName LIKE '%lia%';

-- Show person whose second letter of last name is 'm'
SELECT * FROM PERSONS
WHERE LastName LIKE '_m%'

-- Show person whose second letter of last name is 'm'
SELECT * FROM PERSONS
WHERE substr(LastName,2,1) = 'm';

-- IN or NOT IN
SELECT * FROM PERSONS
WHERE PersonID IN (2,3);
