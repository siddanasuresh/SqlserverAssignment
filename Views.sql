
CREATE VIEW vwEmployeesInDepartment1
AS 
SELECT * FROM EMPLOYEE WHERE dept_no='d1';

select * from EmployeesInDepartment1;

CREATE VIEW vwProject AS  
SELECT [project_no]
      ,[project_name]      
  FROM [Order].[dbo].[Project];

SELECT * FROM vwProject;



CREATE VIEW vmEmployeesEnterdInSecondHalf
AS 
SELECT EMP_FNAME, EMP_LNAME
FROM EMPLOYEE EMP INNER JOIN WORKS_ON WORKS 
ON EMP.EMP_NO=WORKS.EMP_NO AND 
MONTH(ENTER_DATE)>6;

SELECT * FROM vmEmployeesEnterdInSecondHalf



