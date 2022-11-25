CREATE TABLE PERSONS (
    PersonID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int NOT NULL
);

CREATE TABLE ORDERS (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber char(5) NOT NULL,
    PersonID int NOT NULL,
    CONSTRAINT fk_orders_person FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

-- ALTERS

-- To add another column inside the table
ALTER TABLE Persons
ADD Email varchar(255);

-- To modify the datatype
ALTER TABLE Persons
MODIFY FirstName varchar(200);

-- To rename a DataType
ALTER TABLE Persons
RENAME COLUMN Age to PersonAge;

-- To rename the table
RENAME Persons TO Customer

-- To delete a column in a table
ALTER TABLE Customer
DROP COLUMN Email;



-- INSERT
INSERT INTO Customer (PersonID, LastName, FirstName, PersonAge)
VALUES (1, 'Ningsih', 'Aya', 35);

-- or if we already know the order of the attributes, we can use
-- INSERT INTO Customer VALUES (1, 'Ningsih', 'Aya', 35);

-- Selecting the table
SELECT * FROM Customer;

-- Create and View the table
CREATE VIEW Persons30Age
AS SELECT * FROM Customer WHERE PersonAge 30;

SELECT * FROM Persons30Age;

-- Insert more data
INSERT INTO Customer (PersonID, LastName, FirstName, PersonAge)
VALUES (2, 'Dila', 'Ananda', 35);
    
INSERT INTO Customer (PersonID, LastName, FirstName, PersonAge)
VALUES (3, 'Gaming', 'Kuda', 23);

INSERT INTO Customer VALUES (4, 'Menlolo', 'Ariel', 69);
