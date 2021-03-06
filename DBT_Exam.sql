show databases;
use jalgaon;
create table DEPT (DEPTNO INT,DNAME VARCHAR(15),LOC VARCHAR(10));
INSERT INTO DEPT VALUES(10,'ACCONTING','NEW YORK'),(20,'RESEARCH','DALLAS'),(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON');
SELECT * FROM DEPT;
DROP TABLE DEPT;
CREATE TABLE EMP (EMPNO INT,ENAME VARCHAR(20),JOB VARCHAR (20),HIREDATE DATE,SAL FLOAT,COMM FLOAT,DEPTNO INT);
DROP TABLE EMP;
INSERT INTO EMP VALUES(7839,'KING','MANAGER','1991-11-17', 5000 ,NULL, 10),
(7698,' BLAKE',' CLERK', '1981-05-01', 2850,NULL,30),
(7782,' CLARK','MANAGER', '1981-06-09', 2450, NULL, 10),
(7566,'JONES','CLERK','1981-04-02', 2975, NULL, 20),
(7654,' MARTIN',' SALESMAN','1981-09-28', 1250, 1400, 30),
(7499,'ALLEN','SALESMAN' ,'1981-02-20', 1600, 300, 30);
SELECT * FROM EMP;
SELECT ENAME FROM EMP WHERE SAL BETWEEN 2500 AND 5000;
SELECT ENAME FROM EMP ORDER BY ENAME DESC;
SELECT LOWER(JOB) FROM EMP ;
SELECT ENAME,LENGTH(ENAME) FROM EMP;
SELECT DEPTNO,COUNT(*) FROM EMP GROUP BY DEPTNO;
-- Q8.
SELECT DNAME,ENAME FROM DEPT,EMP ORDER BY DEPTNO;
-- Q9.Display the position at which the string ‘AR’ occurs in the ename.
select position('AR'IN ENAME)FROM EMP;
-- Q10.Display the HRA for each employee given that HRA is 20% of SAL.
SELECT SAL*0.2 AS 'HRA' FROM EMP;


/*1. Write a stored procedure by the name of PROC1 that accepts two varchar strings
as parameters. Your procedure should then determine if the first varchar string 
exists inside the varchar string. For example, if string1 = ‘DAC’ and string2 = 
‘CDAC, then string1 exists inside string2. The stored procedure should insert the 
appropriate message into a suitable TEMPP output table. Calling program for the 
stored procedure need not be written*/
delimiter //
create procedure PROC1(str1 varchar(10),str2 varchar(10))
begin
	DECLARE M INT DEFAULT 0;
    SET M =INSTR(STR2,STR1);
	IF M!=0 THEN
    INSERT INTO TEMPPPP VALUES(M,'string1 exists inside string2');
    ELSE
     INSERT INTO TEMPPPP VALUES(M,'string1 NOT exists inside string2');
     END IF;
END; //
DELIMITER ;
CALL PROC1('MAN','AMAN');
CALL PROC1('DAC','CDAC');
CREATE TABLE TEMPPPP (FIR INT(5),SEC VARCHAR(50));
SELECT * FROM TEMPPPP;
DROP PROCEDURE PROC1;
    
/*2. Create a stored function by the name of FUNC1 to take three parameters, the 
sides of a triangle. The function should return a Boolean value:- TRUE if the 
triangle is valid, FALSE otherwise. A triangle is valid if the length of each side is 
less than the sum of the lengths of the other two sides. Check if the dimensions 
entered can form a valid triangle. Calling program for the stored function need not 
be written*/
   DELIMITER //
   CREATE FUNCTION FUNC1(A INT,B INT,C INT)
    RETURNS BOOLEAN 
    BEGIN
		DECLARE A INT DEFAULT 0;
		IF ((A+B)>=C) AND ((B+C)>=A) AND ((C+A)>=B);
        THEN 
       RETURN TRUE
        ELSE
       RETURN FALSE;
       END IF;
	END ;//
    DELIMITER ;
CALL FUNC1(10,20,30);

    
    
	





