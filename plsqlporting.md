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
        SELECT * FROM cs_referrer_keys
        ORDER BY try_order;

    func_cmd VARCHAR(4000);
BEGIN
    func_cmd := 'CREATE OR REPLACE FUNCTION cs_find_referrer_type(v_host IN VARCHAR2,
                      v_domain IN VARCHAR2, v_url IN VARCHAR2) RETURN VARCHAR2 IS BEGIN';

    FOR referrer_key IN referrer_keys LOOP
        func_cmd := func_cmd ||
          ' IF v_' || referrer_key.kind
          || ' LIKE ''' || referrer_key.key_string
          || ''' THEN RETURN ''' || referrer_key.referrer_type
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
        SELECT * FROM cs_referrer_keys
        ORDER BY try_order;
    func_body text;
    func_cmd text;
BEGIN
    func_body := 'BEGIN';

    FOR referrer_key IN referrer_keys LOOP
        func_body := func_body ||
          ' IF v_' || referrer_key.kind
          || ' LIKE ' || quote_literal(referrer_key.key_string)
          || ' THEN RETURN ' || quote_literal(referrer_key.referrer_type)
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

