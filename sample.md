# HR 데이터베이스를 사용하는 SQL 실습 예제 

1.  SELECT 문: 특정 컬럼을 선택하여 데이터를 출력합니다.  
<button onclick="copyCode(0)">copy</button>
```sql
SELECT first_name, last_name FROM employees;
```
![image](sample.PNG)  

2. JOIN 문: 두 개 이상의 테이블을 연결하여 데이터를 출력합니다.  
<button onclick="copyCode(1)">copy</button>
```sql
SELECT first_name, last_name, department_name FROM employees
JOIN departments ON employees.department_id = departments.department_id;
```
3. GROUP BY 문: 특정 컬럼으로 그룹을 묶어 그룹별로 요약된 데이터를 출력합니다.  
<button onclick="copyCode(2)">copy</button>
```sql
SELECT department_id, COUNT(*) FROM employees
GROUP BY department_id;
```
4. HAVING 문: GROUP BY 문에서 사용하며 그룹별로 요약된 데이터를 필터링합니다.  
<button onclick="copyCode(3)">copy</button> 
```sql
SELECT department_id, COUNT(*) FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;
```
이러한 예제들을 실행하기 위해서는 HR 데이터베이스가 설치되어 있어야 합니다.

