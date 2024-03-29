--인덱스 확인

SELECT
    TABLE_NAME      테이블명,
    INDEX_NAME      인덱스이름,
    COLUMN_NAME     컬럼이름
FROM ALL_IND_COLUMNS
WHERE TABLE_NAME='EMPLOYEES';

DROP TABLE MEMBERS;
--인덱스 실습용 테이블 작성
CREATE TABLE MEMBERS(
    MEMBER_ID NUMBER,
    FIRST_NAME   VARCHAR2(100)  NOT NULL,
    LAST_NAME    VARCHAR2(100)  NOT NULL,
    GENDER       VARCHAR2(1)    NOT NULL,
    DOB          DATE           NOT NULL,
    EMAIL        VARCHAR2(255)  NOT NULL,
        PRIMARY KEY(MEMBER_ID)
    );
    
SELECT
    TABLE_NAME,
    INDEX_NAME,
    COLUMN_NAME
FROM ALL_IND_COLUMNS
WHERE TABLE_NAME = 'MEMBERS';

SELECT*FROM MEMBERS ORDER BY MEMBER_ID;

--SQL문의 실행에 대한 보고서 만들기
EXPLAIN PLAN FOR -- 아래의 셀렉트문 결과를 보고서로 저장
SELECT *FROM MEMBERS
WHERE LAST_NAME = 'Harse';

--저장된 보고서 읽기
SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY());


-- 인덱스 만들기 멤버테이블의 LAST_NAME에 인덱스 작성
CREATE INDEX MEMBERS_LAST_NAME_I -- 인덱스 이름
ON MEMBERS(LAST_NAME);

DROP INDEX MEMBERS_LAST_NAME_I;


--EX

CREATE INDEX MEMBERS_NAME_I
ON MEMBERS(FIRST_NAME, LAST_NAME);

SELECT
    TABLE_NAME,
    INDEX_NAME,
    COLUMN_NAME
FROM ALL_IND_COLUMNS
WHERE TABLE_NAME = 'MEMBERS';

EXPLAIN PLAN FOR
SELECT* FROM MEMBERS
WHERE LAST_NAME LIKE 'A%'
AND FIRST_NAME LIKE 'M%';

SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY());






