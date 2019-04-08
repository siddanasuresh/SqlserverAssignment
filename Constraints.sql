--drop table Customers
CREATE TABLE Customers( id char(5) not null primary key,CompanyName varchar(40) not null,contactName char(30) null,
Address varchar(60) null,City char(15) null,Phone char(24) null,Fax char(24) null)


--drop table orders

CREATE TABLE ORDERS (ORDERID INTEGER NOT NULL PRIMARY KEY,
CUSTOMERID CHAR(5) NOT NULL FOREIGN KEY REFERENCES Customers(ID), 
ORDERDATE DATETIME NULL, SHIPPEDDATE DATETIME NULL, FREIGHT MONEY NULL, SHIPNAME VARCHAR(40) NULL, 
SHIPADDRES  VARCHAR(60) NULL,QUANTITY INTEGER NULL);


ALTER TABLE ORDERS ADD CHECK (QUANTITY BETWEEN 1 AND 30);


CREATE DEFAULT Default_Country
AS 'CA'
GO


CREATE RULE rule_Country
AS
(@country='Default_Country') 
OR @country in ('CA','WA','OR','NM')

GO

-- To bind a default 'Default_Country' to user defined data type 'Country'
EXEC sp_bindefault 'Default_Country', 'Country';

-- To bind a rule 'rule_Country' to user defined data type 'Country'
EXEC sp_bindrule 'rule_Country', 'Country';


CREATE TABLE Regions(City varchar(20), Country Country)


SELECT   TABLE_NAME,
COLUMN_NAME,
CHECK_CLAUSE,
cc.CONSTRAINT_SCHEMA,
cc.CONSTRAINT_NAME
FROM     INFORMATION_SCHEMA.CHECK_CONSTRAINTS cc
INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE c
ON cc.CONSTRAINT_NAME = c.CONSTRAINT_NAME
WHERE    TABLE_NAME LIKE ‘%CONTACT%’
ORDER BY CONSTRAINT_SCHEMA,
TABLE_NAME,
COLUMN_NAME


/*To see primary key constraint name*/
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_NAME='CUSTOMERS';


ALTER TABLE CUSTOMERS DROP CONSTRAINT PK__Customer__3213E83F0CBAE877;


ALTER TABLE Orders DROP CONSTRAINT CK__ORDERS__QUANTITY__15502E78;

