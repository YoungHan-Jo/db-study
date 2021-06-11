-- 새 유저 만들기
CREATE USER john 
IDENTIFIED BY 1234;

-- 유저 존에게 데이터베이스 접속권한을 부여
-- grant 권한이름 to 계정
grant create session to john;

GRANT CREATE TABLE TO john;

--새 테이블 스페이스 만들기
CREATE TABLESPACE JOHNSPACE
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' SIZE 10M
AUTOEXTEND ON NEXT 5M;

ALTER USER JOHN DEFAULT TABLESPACE JOHNSPACE;

ALTER USER JOHN QUOTA UNLIMITED ON JOHNSPACE;

--권한들의 모음인 롤을 부여한다. CONNECT 연결. RESOURCE 객체사용.
GRANT CONNECT,RESOURCE TO john;
REVOKE CONNECT,RESOURCE FROM john;

--권한의 회수/제거
REVOKE CREATE TABLE FROM john; -- 다시 테이블 생성 권한을 회수

-- 시스템 권한 확인
SELECT*FROM DBA_SYS_PRIVS
WHERE GRANTEE = 'JOHN';

-- 롤 확인
SELECT*FROM DBA_ROLE_PRIVS
WHERE GRANTEE = 'JOHN';

--비밀번호 바꾸기
ALTER USER john IDENTIFIED BY 5678;

--접속 해제 후 계정삭제
DROP USER JOHN CASCADE;

--테이블스페이스 삭제
DROP TABLESPACE JOHNSPACE;














