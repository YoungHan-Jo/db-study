CREATE TABLE EX2_1 (
    COLUMN1     CHAR(10),
    COLUMN2     VARCHAR2(10),
    COLUMN3     NVARCHAR2(10),
    COLUMN4     NUMBER
    );
    
CREATE TABLE EX2_4(
    COL_NULL    VARCHAR2(10),
    COL_NOT_NULL VARCHAR2(10) CONSTRAINT EX27_COL2_NN NOT NULL,
    CONSTRAINT EX24_CN_UNQ UNIQUE(COL_NULL)
    );
    
INSERT INTO EX2_6
VALUES(123,456);

SELECT*
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EX2_2';

CREATE TABLE EX2_8 (
    COL1 VARCHAR2(10) PRIMARY KEY,
    COL2 VARCHAR2(10)
    );
    
CREATE TABLE EX2_9(
    NUM1    NUMBER CONSTRAINT CHECK1 CHECK(NUM1 BETWEEN 1 AND 9),
    GENDER  VARCHAR2(10) CONSTRAINT CHECK2 CHECK(GENDER IN('MALE','FEMALE'))
    );
    
INSERT INTO EX2_9
VALUES(8,'FEMALE');

CREATE TABLE EX2_12(
    NUM1 NUMBER(5),
    CREATEDATE TIMESTAMP DEFAULT SYSDATE

);

INSERT INTO EX2_12(NUM1)
VALUES(4);

SELECT*
FROM EX2_12;
