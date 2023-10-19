# Basic Command
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

&nbsp;  
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
&nbsp;  
현재 클러스터에 생성된 전체 User 목록을 출력합니다. 패턴 지정 시 해당되는 목록만 출력합니다.  
\du[+] [패턴]  
<button onclick="copyCode(2)">copy</button>
```sql
\du
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 4. Schema 목록 확인.  
&nbsp;  
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
&nbsp;  
현재 데이터베이스에 생성된 테이블 목록을 출력합니다.
'+' 매개변수를 활용하면 보다 상세한 정보를 출력할 수 있으며, 패턴 지정 시 해당되는 목록만 출력합니다.
\dt[+] [패턴]  
&nbsp;  
<button onclick="copyCode(3)">copy</button>
```sql
\dt
```


&nbsp;&nbsp;&nbsp;&nbsp;
### 6. Sequence 목록 확인.  
&nbsp;  
현재 데이터베이스에 생성된 시퀀스 목록을 출력합니다.  
'+' 매개변수를 활용하면 보다 상세한 정보를 출력할 수 있으며, 패턴 지정 시 해당되는 목록만 출력합니다.  
\ds[+] [패턴]  
&nbsp;  
<button onclick="copyCode(3)">copy</button>
```sql
\ds
```






