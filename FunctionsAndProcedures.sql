CREATE FUNCTION FNC_CALCULATEAGE(@DATE_OF_BIRTH DATETIME)
RETURNS INT
AS
BEGIN
	DECLARE @AGE INT
	SELECT @AGE=FLOOR((CAST (GETDATE() AS INTEGER) - CAST(@DATE_OF_BIRTH AS INTEGER)) / 365.25)
	RETURN @AGE
END;

select dbo.FNC_CALCULATEAGE('04.07.2000');
-----------------------------------

CREATE TABLE STUDENT(SID INTEGER PRIMARY KEY, NAME VARCHAR(50), DATE_OF_BIRTH DATETIME, AGE INT);
/*Creating store procedure*/
CREATE PROCEDURE SP_STUDENT_INSERT
(@NAME VARCHAR(50),
 @DATE_OF_BIRTH DATETIME
)
AS
BEGIN
DECLARE @AGE INTEGER
DECLARE @STUDENT_ID INTEGER=0

SELECT @STUDENT_ID=isnull(MAX(SID),0)+1 FROM STUDENT

SELECT @AGE=dbo.FNC_CALCULATEAGE(@DATE_OF_BIRTH);


INSERT INTO STUDENT(SID, NAME, DATE_OF_BIRTH, AGE)
VALUES(@STUDENT_ID,@NAME,@DATE_OF_BIRTH,@AGE)
END

/*Insert Rows*/

EXEC SP_STUDENT_INSERT 'Surekha','12.12.2001'

SELECT * FROM STUDENT;