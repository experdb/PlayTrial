# PL/SQL Porting

### Oracle 데이터베이스에서 PostgreSQL로 전환하려면 Oracle과 PostgreSQL 간의 함수 차이를 이해하고 적절한 포팅 방법을 익혀야 합니다. <br><br>이 과정에는 데이터 타입, SQL 문법, 저장 프로시저 등 여러 요소들이 포함되며, 이들 간의 차이점을 이해하는 것이<br> 중요합니다. <br>또한, 효율적인 전환을 위해 자동화 도구의 사용도 고려해야 합니다. 이러한 지식을 습득함으로써, Oracle에서 PostgreSQL로의 전환 과정을 원활하게 진행할 수 있습니다   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
### 1. 기본 함수 Porting
&nbsp;
* Oracle 데이터 타입 varchar2 는 varchar 또는 text 로 변경해야 한다.<br>
  예제에서는 varchar 를 사용하지만 특정 문자열 길이 제한이 필요하지 않은 경우 텍스트를 사용하는 것이 더 좋다.<br>
* 함수 원형이 아닌 함수 프로토타입의 RETURN 키워드는 PostgreSQL 에서 RETURNS 가 된다.<br>
  또한 IS 는 AS 가 되며 함수 본문은 리터럴로 간주되므로 달러 인용문자($$)로 시작을 표시한다.<br>
* 오라클 접근 방식에서 종료 / 는 예제와 같이 인용문자($$)로 종료를 표시하며  PL/pgSQL 만이 유일한 함수 언어가 아니므로 LANGUAGE 절을 추가해야 한다.<br>
* show errors 명령은 PostgreSQL 에 존재하지 않으며 오류가 자동으로 보고되므로 필요하지 않다.<br>

```sql
CREATE OR REPLACE FUNCTION cs_fmt_browser_version(v_name varchar2, v_version varchar2)
  RETURN varchar2 IS
   BEGIN
      IF v_version IS NULL THEN
          RETURN v_name ;
      END IF ;
    RETURN v_name || '/' || v_version ;
   END;
/
show errors ;
```
<button onclick="copyCode(1)">copy</button>
```sql
CREATE OR REPLACE FUNCTION cs_fmt_browser_version(v_name varchar, v_version varchar)
  RETURNS varchar AS $$
    BEGIN
       IF v_version IS NULL THEN
          RETURN v_name ;
       END IF ;
      RETURN v_name || '/' || v_version ;
    END ;
$$ LANGUAGE plpgsql ;

select cs_fmt_browser_version('eXperDB','v15');
```
&nbsp;

### 2. 본문 안에서 다른 함수를 생성하는 프로시저 Porting
&nbsp;
* PostgreSQL 에서 11버전부터 지원. 기본적인 동작 구조는 FUNCTION 과 동일하다.<br>
* PL/SQL에서는 is ~ begin 사이 변수 선언부에는 declare를 사용하지 않으며, CURSOR는 사용시 호출 문법만 다를 뿐 모두 동일하다.<br>
* FOR .. LOOP 절은 오라클과 동일하게 사용 가능하다.<br>
* 오라클 본문 내에서 문자열을 싱글 쿼테이션(‘’)으로 감싸기 위해 ‘’’(싱글 쿼테이션3개)를 문자열 앞뒤에 추가해야 하지만<br> 
  PostgreSQL에서는 quote_literal 함수를 사용하여 간단하게 구현 가능하다.<br>
* 오라클의 동적 쿼리구현 구문 EXECUTE IMMEDIATE 는 PostgreSQL 에서 EXECUTE로 표현된다.<br>
* 프로시져 실행은 구문만 다르며 사용방법은 동일하다.<br>

```sql
CREATE OR REPLACE PROCEDURE cs_update_referrer_type_proc IS
 CURSOR referrer_keys IS
        SELECT * FROM employees 
        ORDER BY employee_id;

    func_cmd VARCHAR(4000);
BEGIN
    func_cmd := 'CREATE OR REPLACE FUNCTION cs_find_referrer_type(v_host IN VARCHAR2,
                      v_domain IN VARCHAR2, v_url IN VARCHAR2) RETURN VARCHAR2 IS BEGIN';

    FOR referrer_key IN referrer_keys LOOP
        func_cmd := func_cmd ||
          ' IF v_' || referrer_key.employee_id
          || ' LIKE ''' || referrer_key.employee_id
          || ''' THEN RETURN ''' || referrer_key.first_name
          || '''; END IF;';
    END LOOP;

    func_cmd := func_cmd || ' RETURN NULL; END;';

    EXECUTE IMMEDIATE func_cmd;
END;
/
show errors;

exec cs_update_referrer_type_proc;
```

<button onclick="copyCode(3)">copy</button>
```sql
CREATE OR REPLACE PROCEDURE cs_update_referrer_type_proc() AS $func$
DECLARE
    referrer_keys CURSOR IS
        SELECT * FROM employees 
        ORDER BY employee_id;
    func_body text;
    func_cmd text;
BEGIN
    func_body := 'BEGIN';

    FOR referrer_key IN referrer_keys LOOP
        func_body := func_body ||
          ' IF v_' || referrer_key.employee_id
          || ' LIKE ' || quote_literal(referrer_key.employee_id)
          || ' THEN RETURN ' || quote_literal(referrer_key.first_name)
          || '; END IF;' ;
    END LOOP;

    func_body := func_body || ' RETURN NULL; END;';

    func_cmd :=
      'CREATE OR REPLACE FUNCTION cs_find_referrer_type(v_host varchar, v_domain varchar, v_url varchar)
        RETURNS varchar AS '|| quote_literal(func_body) || ' LANGUAGE plpgsql;' ;

    EXECUTE func_cmd;
END;
$func$ LANGUAGE plpgsql;

call cs_update_referrer_type_proc();

```
### 3. OUT 파라미터를 사용하는 함수 Porting
&nbsp;
* PL/pgSQL의 현재 버전의 프로시져에서는 OUT 인수를 지원하지 않으나 함수로 동일하게 구현 가능하다.<br>
* Oracle 내부함수 instr()를 postgrSQL의 position함수로 대체 가능하다.<br>
* 함수 호출방식으로 구현한다.
&nbsp;
```sql
CREATE OR REPLACE PROCEDURE cs_parse_url(
    v_url IN VARCHAR2,
    v_host OUT VARCHAR2,  -- This will be passed back
    v_path OUT VARCHAR2,  -- This one too
    v_query OUT VARCHAR2) -- And this one
IS
    a_pos1 INTEGER;
    a_pos2 INTEGER;
BEGIN
    v_host := NULL;
    v_path := NULL;
    v_query := NULL;
    a_pos1 := instr(v_url, '//');
    IF a_pos1 = 0 THEN
        RETURN;
    END IF;
    a_pos2 := instr(v_url, '/', a_pos1 + 2);
    IF a_pos2 = 0 THEN
        v_host := substr(v_url, a_pos1 + 2);
        v_path := '/';
        RETURN;
    END IF;
    v_host := substr(v_url, a_pos1 + 2, a_pos2 - a_pos1 - 2);
    a_pos1 := instr(v_url, '?', a_pos2 + 1);
    IF a_pos1 = 0 THEN
        v_path := substr(v_url, a_pos2);
        RETURN;
    END IF;
   v_path := substr(v_url, a_pos2, a_pos1 - a_pos2);
    v_query := substr(v_url, a_pos1 + 1);
END;
/
SET serveroutput ON
DECLARE
    v_host VARCHAR2(100);
    v_path VARCHAR2(100);
    v_query VARCHAR2(100);
BEGIN
    cs_parse_url('http://foobar.com/query.cgi?baz', v_host, v_path, v_query);
    dbms_output.put_line(v_host||','||v_path||','||v_query);
END;
/

```
<button onclick="copyCode(5)">copy</button>
```sql
CREATE OR REPLACE FUNCTION cs_parse_url(
    v_url IN VARCHAR,
    v_host OUT VARCHAR,  -- This will be passed back
    v_path OUT VARCHAR,  -- This one too
    v_query OUT VARCHAR) -- And this one
AS $$
DECLARE
    a_pos1 INTEGER;
    a_pos2 INTEGER;
BEGIN
    v_host := NULL;
    v_path := NULL;
    v_query := NULL;
    a_pos1 := position('//' in v_url);
    IF a_pos1 = 0 THEN
        RETURN;
    END IF;
    a_pos2 := position('/' in substr(v_url, a_pos1+2)) + a_pos1 + 1;
    IF a_pos2 = 0 THEN
        v_host := substr(v_url, a_pos1 + 2);
        v_path := '/';
        RETURN;
    END IF;
    v_host := substr(v_url, a_pos1 + 2, a_pos2 - a_pos1 - 2);
    a_pos1 := position('?' in substr(v_url, a_pos2 + 1)) + a_pos2;
    IF a_pos1 = 0 THEN
        v_path := substr(v_url, a_pos2);
        RETURN;
    END IF;
    v_path := substr(v_url, a_pos2, a_pos1 - a_pos2);
    v_query := substr(v_url, a_pos1 + 1);
END;
$$ LANGUAGE plpgsql;

SELECT * FROM cs_parse_url('http://foobar.com/query.cgi?baz');
```
&nbsp;

### 4. ORACLE 고유 기능 Porting
&nbsp;
* 프로시져 또는 함수 내에서 LOCK TABLE 기능은 Oracle 과 동일하게 사용 가능하다.<br> 
* 읽기 트랜잭션만 동시에 수행 가능하며 Oracle의 사용자 정의 error를 PostgreSQL에서는 비슷하게 동작하는 RAISE EXCEPTION 를 통해서 구현 가능하다.<br>
* EXCEPTION 절은 동일하게 지원되며, PL/pgSQL 에서 지원하는 EXCEPTION 명은 Oracle 과 다르지만 동일한 기능을 대부분 지원한다.<br>

```sql
CREATE OR REPLACE PROCEDURE cs_create_job(v_job_id IN INTEGER) IS
    a_running_job_count INTEGER;

BEGIN
    LOCK TABLE cs_jobs IN EXCLUSIVE MODE;

    SELECT count(*) INTO a_running_job_count FROM cs_jobs WHERE end_stamp IS NULL;

    IF a_running_job_count > 0 THEN
        COMMIT; -- free lock
        raise_application_error(-20000,
                 'Unable to create a new job: a job is currently running.');
    END IF;

    DELETE FROM cs_active_job;
    INSERT INTO cs_active_job(job_id) VALUES (v_job_id);

    BEGIN
        INSERT INTO cs_jobs (job_id, start_stamp) VALUES (v_job_id, sysdate);
    EXCEPTION
        WHEN dup_val_on_index THEN NULL; -- don't worry if it already exists
    END;
    COMMIT;
END;
/
show errors;
```
<button onclick="copyCode(7)">copy</button>
```sql
CREATE OR REPLACE PROCEDURE cs_create_job(v_job_id integer) AS $$
DECLARE
    a_running_job_count integer;
BEGIN
    LOCK TABLE cs_jobs IN EXCLUSIVE MODE;

    SELECT count(*) INTO a_running_job_count FROM cs_jobs WHERE end_stamp IS NULL;

    IF a_running_job_count > 0 THEN
        COMMIT; -- free lock
        RAISE EXCEPTION 'Unable to create a new job: a job is currently running'; -- (1)
    END IF;

    DELETE FROM cs_active_job;
    INSERT INTO cs_active_job(job_id) VALUES (v_job_id);

    BEGIN
        INSERT INTO cs_jobs (job_id, start_stamp) VALUES (v_job_id, now());
    EXCEPTION
        WHEN unique_violation THEN -- (2)
            -- don't worry if it already exists
    END;
    COMMIT;
END;
$$ LANGUAGE plpgsql;
```
&nbsp;

