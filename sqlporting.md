# SQL Porting

### Oracle 데이터베이스에서 PostgreSQL로 전환하려면 Oracle과 PostgreSQL 간의 함수 차이를 이해하고 적절한 포팅 방법을 익혀야 합니다. <br><br>이 과정에는 데이터 타입, SQL 문법, 저장 프로시저 등 여러 요소들이 포함되며, 이들 간의 차이점을 이해하는 것이<br> 중요합니다. <br>또한, 효율적인 전환을 위해 자동화 도구의 사용도 고려해야 합니다. 이러한 지식을 습득함으로써, Oracle에서 PostgreSQL로의 전환 과정을 원활하게 진행할 수 있습니다   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
### 1. 날짜와 시간 관련 함수

&nbsp;
* SYSDATE (Oracle) -> NOW() (PostgreSQL)   
<button onclick="copyCode(0)">copy</button>
```sql
  SELECT NOW();
```

&nbsp;
* SYSTIMESTAMP (Oracle) -> CURRENT_TIMESTAMP (PostgreSQL)  
<button onclick="copyCode(1)">copy</button>
```sql 
  SELECT CURRENT_TIMESTAMP;
```

&nbsp;
* ADD_MONTHS(date, n) (Oracle) -> date + INTERVAL 'n months' (PostgreSQL)  
<button onclick="copyCode(2)">copy</button>
```sql 
  SELECT NOW() + INTERVAL '1 MONTH';
```

&nbsp;
* LAST_DAY(date) (Oracle) -> DATE_TRUNC(date) + INTERVAL '1 month' - INTERVAL '1 day'   
<button onclick="copyCode(3)">copy</button>
```sql 
  SELECT (DATE_TRUNC('MONTH',NOW()) + INTERVAL '1 MONTH' - INTERVAL '1 DAY')::DATE;
```

&nbsp;&nbsp;&nbsp;
### 2. 문자열 함수

&nbsp;
* SUBSTR(string, start, length) (Oracle) -> SUBSTRING(string FROM start FOR length) (PostgreSQL)   
<button onclick="copyCode(4)">copy</button>
```sql 
  SELECT SUBSTRING('ABCDEFG' FROM 2 FOR 3);
```

&nbsp;
* INSTR(string, substring) (Oracle) -> POSITION(substring IN string) (PostgreSQL)  
<button onclick="copyCode(5)">copy</button>
```sql 
  SELECT POSITION('B' IN 'ABCDEFG');
```

&nbsp;&nbsp;&nbsp;
### 3. 기타 함수

&nbsp;
* DECODE(expression, search, result, ...) (Oracle) -> CASE 문 사용 (PostgreSQL)   
<button onclick="copyCode(6)">copy</button>
```sql 
  SELECT CASE '10' WHEN '10' THEN 'T' ELSE 'F' END;
```

&nbsp;
* NVL(expr1, expr2) (Oracle) -> COALESCE(expr1, expr2) (PostgreSQL)   
<button onclick="copyCode(7)">copy</button>
```sql 
  SELECT COALESCE(NULL, 'F');  --copy 
```

&nbsp;
* NVL2(expr1, expr2, expr3) (Oracle) -> CASE WHEN expr1 IS NOT NULL THEN expr2 ELSE expr3 END (PostgreSQL)  
<button onclick="copyCode(8)">copy</button>
```sql 
  SELECT CASE WHEN 'ABCDEF' IS NOT NULL THEN 'F' ELSE 'T' END;
```

&nbsp;&nbsp;&nbsp;
### 4. 구문

&nbsp;
* ROWNUM (Oracle) -> OFFSET FETCH (PostgreSQL)  
<button onclick="copyCode(9)">copy</button>
```sql 
 SELECT *                                                 
  FROM employees
 ORDER BY last_name, first_name 
 OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY ;
```

&nbsp;
* MINUS (Oracle) -> EXCEPT (PostgreSQL)   
<button onclick="copyCode(10)">copy</button>
```sql 
 SELECT department_id FROM departments
 EXCEPT
 SELECT department_id FROM employees;
```

&nbsp;
* (+) (Oracle) -> OUTER JOIN (PostgreSQL)  
<button onclick="copyCode(11)">copy</button>
```sql 
 SELECT * FROM employees e
   LEFT OUTER JOIN departments d on (e.department_id = d.department_id);
```

&nbsp;
* CONNECT BY START WITH (Oracle) -> WITH RECURSIVE CTE (PostgreSQL)
<button onclick="copyCode(13)">copy</button>
```sql 
 WITH RECURSIVE A AS ( 
 SELECT E.*, 1 LEVEL
 FROM EMPLOYEES E
 WHERE MANAGER_ID IS NULL
 UNION ALL
 SELECT D.*, A.LEVEL + 1
 FROM EMPLOYEES D
 JOIN A ON A.EMPLOYEE_ID = D.MANAGER_ID )
 SELECT * FROM A;
```
