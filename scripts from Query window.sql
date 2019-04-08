
/*1. Create Customers, Order table DDL statements */

CREATE TABLE Customers( id char(5) not null,CompanyName varchar(40) not null,contactName char(30) null,
Address varchar(60) null,City char(15) null,Phone char(24) null,Fax char(24) null)

CREATE TABLE ORDERS (ORDERID INTEGER NOT NULL,CUSTOMERID CHAR(5) NOT NULL, ORDERDATE DATETIME NULL, 
SHIPPEDDATE DATETIME NULL, FREIGHT MONEY NULL, SHIPNAME VARCHAR(40) NULL, SHIPADDRES  VARCHAR(60) NULL, 
QUANTITY INTEGER NULL);

/*2. Alter table statement to add column*/
Alter table Orders add shipregion integer

/*3. Alter table to modify data type*/
Alter table Orders alter column shipregion char(8)

/*4. Alter table to drop column*/
Alter table Orders drop column shipregion

/*5. Alter table to add default values */

Alter table Orders add constraint df_orderdate default getdate() for Orderdate

/*6. Rename city column of the Customers table*/

EXEC sp_rename 'Customers.City', 'Town', 'COLUMN';  

/*7. Create Department,Employee table and insert values*/
Create table Department(Dep varchar(2),Deparment_name varchar(10), Location varchar(20)) 

insert into Department(Dep,Deparment_name,Location) values('d1', 'Res', 'Dallas');
insert into Department(Dep,Deparment_name,Location) values('d2', 'Acc', 'Seattle');
insert into Department(Dep,Deparment_name,Location) values('d3', 'Mar', 'Dallas');


Create table Employee(emp_no varchar(10),emp_fname varchar(20), emp_lname varchar(20), dept_no varchar(5)); 

insert into Employee(emp_no,emp_fname,emp_lname,dept_no) values(25348,'Matthew','Smith','d3')
insert into Employee(emp_no,emp_fname,emp_lname,dept_no) values(10102,'Ann','Jones','d3')
insert into Employee(emp_no,emp_fname,emp_lname,dept_no) values( 18316,'John','Barrimore','d1')
insert into Employee(emp_no,emp_fname,emp_lname,dept_no) values( 29346, 'James','James','d2')

--select * from Employee

/*Create project table and insert values*/
Create table Project(project_no varchar(2),project_name varchar(20),Budget integer)

insert into Project(project_no,project_name,Budget) values('p1','Apollo',120000)
insert into Project(project_no,project_name,Budget) values('p2','Gemini',95000)
insert into Project(project_no,project_name,Budget) values('p3','Mercury',18560)

--select * from Project



/*Create Works_on table and insert values*/
Create table Works_on(emp_no integer,project_no varchar(2),Job varchar(20),enter_date datetime)

insert into Works_on(emp_no,project_no,Job,enter_date) values(10102,'p1','Analyst','1997.10.1')
insert into Works_on(emp_no,project_no,Job,enter_date) values(10102,'p3','manager','1999.1.1')
insert into Works_on(emp_no,project_no,Job,enter_date) values(25348,'p2','Clerk','1998.2.15')
insert into Works_on(emp_no,project_no,Job,enter_date) values(18316,'p2',NULL,'1998.6.1')
insert into Works_on(emp_no,project_no,Job,enter_date) values(29346,'p2',NULL,'1997.12.15')
insert into Works_on(emp_no,project_no,Job,enter_date) values(2581,'p3','Analyst','1998.10.15')
insert into Works_on(emp_no,project_no,Job,enter_date) values(9031,'p1','Manager','1980.4.15')
insert into Works_on(emp_no,project_no,Job,enter_date) values(28559,'p1',NULL,'1980.8.1')
insert into Works_on(emp_no,project_no,Job,enter_date) values(28559,'p2','Clerk','1992.2.1')
insert into Works_on(emp_no,project_no,Job,enter_date) values(9031,'p3','Clerk','1997.11.15')
insert into Works_on(emp_no,project_no,Job,enter_date) values(29346,'p1','Clerk','1998.1.4')

select * from Works_on



















SELECT EMP.* FROM 
	EMPLOYEE EMP INNER JOIN WORKS_ON WORKS 
 ON EMP.EMP_NO=WORKS.EMP_NO 
 WHERE PROJECT_NO='P2';
 
 /*No Results from this query*/
 SELECT * FROM 	EMPLOYEE 
 WHERE EMP_NO<10000;
 
 SELECT * FROM 	WORKS_ON 
 WHERE EMP_NO<10000;
 
 
 SELECT DISTINCT Job,enter_date 
  FROM WORKS_ON 
  WHERE project_no='P2' AND JOB IS NULL


 SELECT EMP_NO,EMP_FNAME
  FROM EMPLOYEE 
  WHERE EMP_LNAME LIKE '%o%' or 
  substring(LTrim(EMP_LNAME),2,1)='a' or 
  EMP_LNAME LIKE '%es'  
  
  
  SELECT EMP_FNAME,EMP_LNAME  FROM 
	EMPLOYEE EMP INNER JOIN Works_on Works 
 ON EMP.EMP_NO=Works.EMP_NO 
 WHERE enter_date='1998.01.04'
 

SELECT * FROM WORKS_ON 
WHERE ENTER_DATE='1998-01-04'



SELECT LOCATION, COUNT(*) 
FROM Department 
GROUP BY  LOCATION



SELECT MAX(EMP_NO) 'Biggest_EmpNo' 
FROM EMPLOYEE
