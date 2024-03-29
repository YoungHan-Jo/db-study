--제약조건
CREATE TABLE emp(
    eno NUMBER(3) PRIMARY KEY,
    emp_name VARCHAR2(20) 
    );
    
DESC EMP;
DROP TABLE EMP;

CREATE TABLE emp(
    eno NUMBER(3) ,
    emp_name VARCHAR2(20),
    CONSTRAINT emp_eno_pk PRIMARY KEY(ENO) -- 열의 아래에 제약조건 추가
    );
    
    
    
-- NOT NULL 제약조건 : 널값을 허용하지 않는다.
-- NOT NULL 에 아무거도 입력안하면 에러.
DESC departments;

CREATE TABLE emp(
    eno NUMBER(3) PRIMARY KEY,
    emp_name VARCHAR2(20) NOT NULL
    );
    

-- 유니크 고유키(중복방지)
CREATE TABLE emp(
    eno NUMBER(3) PRIMARY KEY,
    emp_name VARCHAR2(20) NOT NULL,
    email   VARCHAR2(30) UNIQUE
    );
    
INSERT INTO EMP VALUES(1,'hong','hong@naver.com');
INSERT INTO EMP VALUES(2,'hwang','hwang@naver.com');
INSERT INTO EMP VALUES(3,'kim','kim@naver.com');
INSERT INTO EMP VALUES(4,'kim','kim@naver.com');

select*from emp;

--

CREATE TABLE emp(
    eno NUMBER(3) PRIMARY KEY,
    emp_name VARCHAR2(20) NOT NULL,
    email   VARCHAR2(30) UNIQUE,
    sal     NUMBER(10) CHECK (sal>1000) -- 체크제약조건 sal 이 1000보다 커야함
    );
    
INSERT INTO EMP VALUES(1,'hong','hong@naver.com',1200);
INSERT INTO EMP VALUES(2,'hwang','hwang@naver.com',2200);
INSERT INTO EMP VALUES(3,'kim','kim@naver.com',999);

drop table emp;

-- 이름의 길이가 4자이상, 성별 열은 woman,man
CREATE TABLE emp(
    eno      NUMBER(3) CONSTRAINT EMP_ENO_PK PRIMARY KEY,
    emp_name VARCHAR2(20) NOT NULL CHECK(LENGTH(EMP_NAME)>=4),
    email    VARCHAR2(30) UNIQUE,
    sal      NUMBER(10) CHECK(sal>1000),
    gender   VARCHAR2(5) CHECK(gender IN('woman','man'))
    );
    
INSERT INTO EMP VALUES(1,'hong','hong@naver.com',1200,'woman');
INSERT INTO EMP VALUES(2,'hwang','hwang@naver.com',2200,'man');
INSERT INTO EMP VALUES(3,'kim','kim@naver.com',999,'man');    
INSERT INTO EMP VALUES(3,'kang','kang@naver.com',3000,'ani');

--EX
DROP TABLE EMP;
CREATE TABLE members
    (
    member_id   NUMBER(2) CONSTRAINT members_id_pk PRIMARY KEY,
    first_name  VARCHAR2(50) NOT NULL,
    last_name   VARCHAR2(50) NOT NULL,
    gender      VARCHAR2(5) CHECK(gender IN('Man','Woman')),
    birth_day   DATE DEFAULT SYSDATE,
    email       VARCHAR2(200) NOT NULL UNIQUE
    );
    
DESC MEMBERS;
drop table members;



-- PK FK 기본기, 외래키

CREATE TABLE dept(
    dno NUMBER(4),
    dname VARCHAR2(20),
    CONSTRAINT dept_dno_pk PRIMARY KEY(dno)
    );

INSERT INTO dept VALUES(1,'first');
DELETE FROM DEPT WHERE DNO = 1;

SELECT*FROM DEPT;

CREATE TABLE EMP (
    eno NUMBER(4),
    emp_name VARCHAR2(20),
    sal NUMBER(10),
    dno NUMBER(4),
    CONSTRAINT emp_eno_pk PRIMARY KEY(eno),
    CONSTRAINT emp_dno_fk FOREIGN KEY(dno) REFERENCES dept(dno)
);

INSERT INTO DEPT VALUES(10,'TEST1');
INSERT INTO DEPT VALUES(20,'TEST2');
INSERT INTO DEPT VALUES(30,'TEST3');
INSERT INTO DEPT VALUES(40,'TEST4');
INSERT INTO DEPT VALUES(50,'TEST5');

SELECT*FROM DEPT;

INSERT INTO EMP VALUES(1010, 'KIM', 200, 20);
INSERT INTO EMP VALUES(1020, 'LEE', 230, 30);
INSERT INTO EMP VALUES(1030, 'PARK', 300, 10);
INSERT INTO EMP VALUES(1040, 'CHOI', 180, 40);
INSERT INTO EMP VALUES(1050, 'KANG', 300, 50);
INSERT INTO EMP VALUES(1060, 'JUNG',500,NULL); -- 널값은 입력가능
INSERT INTO EMP VALUES(1060, 'KIM', 200, 60); -- 외래키에 없는 부서번호라서 에러

SELECT*FROM EMP;

SELECT*
FROM EMP E
    JOIN DEPT D
    ON E.DNO = D.DNO
ORDER BY E.ENO;

-- 제약조건을 출력하는 SQL 문
SELECT *
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'EMPLOYEES';


-- 제약 조건의 추가
-- 우선 기본 테이블 있어야함
CREATE TABLE CLASS(
    CNO VARCHAR2(2),
    CNAME VARCHAR2(50)
    );
    
INSERT INTO CLASS VALUES('01','데이터베이스');
INSERT INTO CLASS VALUES('02','프로그래밍');
INSERT INTO CLASS VALUES('03','네트워크');

DELETE FROM CLASS WHERE CNO = '03';

SELECT*FROM CLASS;

CREATE TABLE STUDENT(
    SNO VARCHAR2(4),
    SNAME VARCHAR2(20),
    CNO VARCHAR2(2)
);

INSERT INTO STUDENT VALUES('0414','KIM','01');
INSERT INTO STUDENT VALUES('0415','LEE','02');
INSERT INTO STUDENT VALUES('0416','PARK','01');
INSERT INTO STUDENT VALUES('0417','CHOI','02');
INSERT INTO STUDENT VALUES('0418','JUNG','03');

UPDATE STUDENT
SET CNO = '01'
WHERE CNO = '03';

DELETE FROM STUDENT WHERE SNO ='0414';

SELECT*FROM STUDENT;

-- 제약조건 추가
ALTER TABLE CLASS
ADD CONSTRAINT class_cname_uk Unique(cname);

ALTER TABLE CLASS
ADD CONSTRAINT CLASS_CNO_PK PRIMARY KEY(CNO);

SELECT*
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME='CLASS';

ALTER TABLE STUDENT
ADD CONSTRAINT STUDENT_SNO_PK PRIMARY KEY(SNO);

ALTER TABLE STUDENT
MODIFY SNAME CONSTRAINT STUDENT_SNAME_NN NOT NULL;

ALTER TABLE STUDENT
ADD CONSTRAINT STUDENT_CNO_FK FOREIGN KEY(CNO) REFERENCES CLASS(CNO);

SELECT*
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME='STUDENT';


--제약조건의 삭제
ALTER TABLE CLASS
DROP CONSTRAINT CLASS_CNAME_UK;

ALTER TABLE CLASS
DROP CONSTRAINT CLASS_CNO_PK; -- 기본키 삭제(다른 테이블이 참조하고 있어서 삭제못함)

--이때 참조하는 외래키 제약조건도 함께 삭제
ALTER TABLE CLASS
DROP CONSTRAINT CLASS_CNO_PK CASCADE; -- CASCADE붙이면 - 연결되어 있는 외래키도 같이 삭제함

ALTER TABLE STUDENT
DROP PRIMARY KEY;

ALTER TABLE STUDENT
DROP CONSTRAINT STUDENT_SNAME_NN;















