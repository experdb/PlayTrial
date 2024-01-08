# 메타 정보 조회

### System Catalog는 테이블, 칼럼 정보 같은 스키마 메타데이터와 파라미터, 락(lock) 등의 내부 설정 및 오퍼레이션 정보를 담고 있는 영역입니다.<br> PostgreSQL의 System Catalog는 테이블 형태로 되어 있으며 각 데이터베이스의 "pg_catalog" 스키마가 소유하고 있습니다.<br> 
   System Catalog에 대한 접근은 테이블을 직접 조회하거나, "information_schema" 스키마 소유 뷰를 통해서 할 수 있습니다<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

##### 1. pg_class
* pg_class는 데이터베이스 내의 테이블, 인덱스, 시퀀스, 뷰 등과 같은 모든 관계의 정보를 담고 있습니다.
<button onclick="copyCode(0)">copy</button>
```sql
SELECT relname FROM pg_class WHERE relkind = 'r';
```
&nbsp;
##### 2. pg_attribute
* pg_attribute는 테이블의 컬럼 정보를 포함합니다.
<button onclick="copyCode(1)">copy</button>
```sql
SELECT attname FROM pg_attribute WHERE attrelid = 'your_table_name'::regclass;
```
&nbsp;
### pg_database
* pg_database는 데이터베이스 인스턴스에 있는 모든 데이터베이스의 목록과 그 특성을 보여줍니다.
<button onclick="copyCode(2)">copy</button>
```sql
SELECT datname FROM pg_database;
```
&nbsp;
### pg_index
* pg_index`는 데이터베이스의 모든 인덱스에 대한 정보를 제공합니다.
<button onclick="copyCode(3)">copy</button>
```sql
SELECT indexrelid FROM pg_index WHERE indrelid = 'your_table_name'::regclass;
```
&nbsp;
### pg_namespace
* pg_namespace는 데이터베이스의 스키마에 대한 정보를 저장합니다.
<button onclick="copyCode(4)">copy</button>
```sql
SELECT nspname FROM pg_namespace;
```
&nbsp;
### pg_user 또는 pg_roles
* pg_user 또는 pg_roles는 데이터베이스 사용자 및 역할에 대한 정보를 포함합니다.
<button onclick="copyCode(5)">copy</button>
```sql
SELECT rolname FROM pg_roles;
```
&nbsp;
### pg_stat_activity
* pg_stat_activity는 현재 데이터베이스에서 실행 중인 쿼리와 세션 정보를 제공합니다.
<button onclick="copyCode(6)">copy</button>
```sql
SELECT * FROM pg_stat_activity;
```
&nbsp;
### pg_settings
* pg_settings는 데이터베이스의 현재 설정 값을 보여줍니다.
<button onclick="copyCode(7)">copy</button>
```sql
SELECT name, setting FROM pg_settings;
```
&nbsp;
### pg_constraint
* pg_constraint는 테이블의 제약 조건에 대한 정보를 포함합니다.
<button onclick="copyCode(8)">copy</button>
```sql
SELECT conname FROM pg_constraint WHERE conrelid = 'your_table_name'::regclass;
```
&nbsp;
### information_schema
* information_schema는 PostgreSQL을 포함한 많은 SQL 기반 데이터베이스 시스템에서 표준 방식으로 데이터베이스 메타데이터를 제공하는 특별한 스키마입니다.<br> 
  이 스키마는 ANSI SQL 표준에 정의된 여러 뷰를 포함하고 있으며, 데이터베이스의 구조와 특성에 대한 정보를 쿼리할 수 있는 표준화된 방법을 제공합니다.
<button onclick="copyCode(9)">copy</button>
```sql
SELECT * FROM information_schema.table_constraints;
```
