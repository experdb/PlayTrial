# Basic Command
### PostgreSQL은 CLI 기반의 클라이언트 툴인 psql을 이용하여 DBMS 내 구성요소를 손쉽게 조회하고 관리할 수 있습니다. 본 과정에서는 psql을 통해 PostgreSQL에 접속한 상태에서 기본적으로 제공되는 다양한 명령어를 실행하고 결과를 확인하며 명령어의 기능을 익혀보겠습니다.

&nbsp;&nbsp;&nbsp;&nbsp;
### 1. 데이터베이스 접속.
&nbsp;  
접속하고자하는 Database와 User 명을 매개변수로하여 접속합니다.

&nbsp;
매개변수 없이 명령을 실행하면 현재 접속중인 Database와 User를 조회할 수 있습니다. 

&nbsp;  
<button onclick="copyCode(0)">copy</button>
```sql
\c 
```
\c [DB_NAME] [Connection User]


