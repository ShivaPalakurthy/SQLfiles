SET PAGESIZE 10
SET LINESIZE 150
SET PAUSE ON 
SET PAUSE 'PRESS ANY KEY..'
TTITLE LEFT 'EMPLOYEE REPORT'
BTITLE LEFT 'END REPORT'
COLUMN EMP_NAME FORMAT A5 TRUNC
SELECT E.EMP_ID,E.EMP_NAME,E.EMP_SALARY,D.DEPT_NAME FROM
EMPLOYEE E,DEPARTMENT D WHERE E.DEPT_ID=D.DEP_ID;
CLEAR COLUMN
TTITLE OFF
SET PAUSE OFF
SET LINESIZE 80
SET PAGESIZE 24
