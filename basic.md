![image](https://github.com/experdb/PlayTrial/assets/22812595/9868326c-505b-49ce-9ecc-d0f1be02cd69)# Basic Command
### PostgreSQL은 CLI 기반의 클라이언트 툴인 psql을 이용하여 DBMS 내 구성요소를 손쉽게 조회하고 관리할 수 있습니다. 본 과정에서는 psql을 통해 PostgreSQL에 접속한 상태에서 기본적으로 제공되는 다양한 명령어를 실행하고 결과를 확인하며 명령어의 기능을 익혀보겠습니다.

&nbsp;&nbsp;&nbsp;&nbsp;
### 1. 데이터베이스 접속.  
접속하고자 하는 Database와 User명을 매개변수로 하여 접속합니다.  
매개변수 없이 명령을 실행하면 현재 접속중인 Database와 User를 조회할 수 있습니다.  
\c [DB_NAME] [Connection User]  
<button onclick="copyCode(0)">copy</button>
```sql
\c
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 2. Database 목록 확인.  
현재 클러스터에 생성된 전체 Database 목록을 출력합니다.  
'+' 매개변수를 활용하면 보다 상세한 정보를 출력할 수 있으며, 패턴 지정 시 해당되는 목록만 출력합니다.  
\l[+] [패턴]  
&nbsp;  
<button onclick="copyCode(1)">copy</button>
```sql
\l
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 3. User 목록 확인.  
현재 클러스터에 생성된 전체 User 목록을 출력합니다. 패턴 지정 시 해당되는 목록만 출력합니다.  
\du[+] [패턴]  
<button onclick="copyCode(2)">copy</button>
```sql
\du
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 4. Schema 목록 확인.  
현재 데이터베이스에 생성된 스키마 목록을 출력합니다.
'+' 매개변수를 활용하면 보다 상세한 정보를 출력할 수 있으며, 패턴 지정 시 해당되는 목록만 출력합니다. 
\dn[+] [패턴]  
&nbsp;  
<button onclick="copyCode(3)">copy</button>
```sql
\du
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 5. Table 목록 확인.  
현재 데이터베이스에 생성된 테이블 목록을 출력합니다.
'+' 매개변수를 활용하면 보다 상세한 정보를 출력할 수 있으며, 패턴 지정 시 해당되는 목록만 출력합니다.
\dt[+] [패턴]  
&nbsp;  
<button onclick="copyCode(4)">copy</button>
```sql
\dt
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 6. Sequence 목록 확인.  
현재 데이터베이스에 생성된 시퀀스 목록을 출력합니다.  
'+' 매개변수를 활용하면 보다 상세한 정보를 출력할 수 있으며, 패턴 지정 시 해당되는 목록만 출력합니다.  
\ds[+] [패턴]  
&nbsp;  
<button onclick="copyCode(5)">copy</button>
```sql
\ds
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 7. Function 목록 확인.  
현재 데이터베이스에 생성된 함수 목록을 출력합니다.  
'+' 매개변수를 활용하면 보다 상세한 정보를 출력할 수 있으며, 패턴 지정 시 해당되는 목록만 출력합니다.  
\df[+] [패턴]  
&nbsp;  
<button onclick="copyCode(6)">copy</button>
```sql
\df
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 8. View 목록 확인.  
현재 데이터베이스에 생성된 뷰 목록을 출력합니다.  
'+' 매개변수를 활용하면 보다 상세한 정보를 출력할 수 있으며, 패턴 지정 시 해당되는 목록만 출력합니다.  
\dv[+] [패턴]  
&nbsp;  
<button onclick="copyCode(7)">copy</button>
```sql
\dv
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 9. Index 목록 확인.  
현재 데이터베이스에 생성된 인덱스 목록을 출력합니다.  
'+' 매개변수를 활용하면 보다 상세한 정보를 출력할 수 있으며, 패턴 지정 시 해당되는 목록만 출력합니다.  
\di[+] [패턴]  
&nbsp;  
<button onclick="copyCode(8)">copy</button>
```sql
\di
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 10. 객체 상세 정보 확인.  
지정한 객체의 상세 정보를 출력합니다.  
\d [Object_name]  



&nbsp;&nbsp;&nbsp;&nbsp;
### 11. 실행한 쿼리문 저장.  
이전에 실행한 명령어 전체 목록을 출력하고 파일로 저장합니다.  
\s [파일명]  


&nbsp;&nbsp;&nbsp;&nbsp;
### 12. 쿼리 버퍼 저장.  
Query Buffer를 저장합니다.  
\w [파일명]  


&nbsp;&nbsp;&nbsp;&nbsp;
### 13. 외부 에디터 이용.  
외부 Editor 툴을 이용해 query buffer 또는 파일을 수정합니다.  
\e [파일명]  


&nbsp;&nbsp;&nbsp;&nbsp;
### 14. 쿼리 결과 파일로 전송.  
모든 쿼리 실행 결과들을 지정한 파일 또는 pipe로 전송합니다.  
\o [파일명]  


&nbsp;&nbsp;&nbsp;&nbsp;
### 15. 쿼리 실행 시간 출력.  
쿼리가 실행되는데 소요된 시간을 출력합니다.  
timing을 on 상태로 설정 시 활성화됩니다.  
&nbsp;  
<button onclick="copyCode(9)">copy</button>
```sql
\timing on
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 16. 쿼리 실행 시간 출력.  
쿼리가 실행되는데 소요된 시간을 출력합니다. off로 설정 시 시간을 출력하지 않습니다.  
특정 쿼리 튜닝을 위해 수행 시간을 측정할때 유용합니다.
&nbsp;  
<button onclick="copyCode(10)">copy</button>
```sql
\timing on
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 17. psql 명령어 출력.  
psql 메타 명령어를 출력합니다.  
&nbsp;  
<button onclick="copyCode(11)">copy</button>
```sql
\?
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 18. sql 명령어 출력.  
sql 명령어를 출력합니다.
&nbsp;  
<button onclick="copyCode(12)">copy</button>
```sql
\h
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 19. psql 종료.  
psql을 종료하고 PostgreSQL 클라이언트 툴 CLI 화면을 빠져나갑니다.
&nbsp;  
<button onclick="copyCode(13)">copy</button>
```sql
\q
```








