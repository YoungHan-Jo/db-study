--테이블 삭제

DROP TABLE EX2_9 CASCADE CONSTRAINTS;

-- 테이블 수정

CREATE TABLE EX2_10(
COL1 VARCHAR2(10) NOT NULL,
COL2 VARCHAR2(10) NULL,
CREATE_DATE DATE DEFAULT SYSDATE);

ALTER TABLE EX2_10 RENAME COLUMN COL1 TO COL11;

SELECT * FROM EX2_10;

ALTER TABLE EX2_10 RENAME COLUMN COL2 TO COL22;

ALTER TABLE EX2_10 MODIFY COL11 VARCHAR2(20);

DESC EX2_10;

ALTER TABLE EX2_10 ADD COL3 NUMBER;

ALTER TABLE EX2_10 RENAME COLUMN COL3 TO COL33;

ALTER TABLE EX2_10 MODIFY COL33 NUMBER(5);

ALTER TABLE EX2_10 DROP COLUMN COL33;

ALTER TABLE EX2_10 ADD CONSTRAINT EX210_COL11_PK PRIMARY KEY(COL11);

SELECT*
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EX2_10';

ALTER TABLE EX2_10 DROP CONSTRAINT EX210_COL11_PK;

ALTER TABLE EX2_10 ADD CONSTRAINT COL11_PK PRIMARY KEY(COL11);

ALTER TABLE EX2_10 DROP CONSTRAINT COL11_PK;

CREATE TABLE EX2_10_1
AS
SELECT*
FROM EX2_10;

SELECT* FROM EX2_10_1;

SELECT* FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EX2_10_1';

CREATE OR REPLACE VIEW EMP_DEPT_V1
AS
SELECT e.employee_id, e.emp_name, e.department_id, d.department_name
FROM EMPLOYEES E
    JOIN DEPARTMENTS D
    ON e.department_id = d.department_id;


SELECT *
FROM EMP_DEPT_V1;

DROP VIEW EMP_DEPT_V1;

CREATE OR REPLACE VIEW EMP_DEPT_V1
AS
SELECT e.employee_id, e.emp_name, d.department_name
FROM employees E
    JOIN departments D
    ON e.department_id = d.department_id;

DROP VIEW EMP_DEPT_V1;

CREATE TABLE EX2_11 (
    COL11 VARCHAR2(10) CONSTRAINT EX2_10_COL11_PK PRIMARY KEY,
    COL22 VARCHAR2(30) ,
    CREATE_DATE DATE DEFAULT SYSDATE);
    
DROP TABLE EX2_10_1;

CREATE UNIQUE INDEX EX2_10_IX01
ON EX2_10 (COL11);



CREATE INDEX EX2_01_IX02
ON EX2_10(COL11,COL22);

SELECT* FROM USER_INDEXES
WHERE TABLE_NAME = 'EX2_10';

DROP INDEX EX2_10_IX01;

CREATE OR REPLACE SYNONYM SYN_CHANNEL
FOR CHANNELS;

SELECT COUNT(*)
FROM SYN_CHANNEL;

DROP SYNONYM SYN_CHANNEL;

CREATE SEQUENCE MY_SEQ1
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;

INSERT INTO EX2_10(COL11)
VALUES (MY_SEQ1.NEXTVAL);

SELECT* FROM EX2_10;

SELECT MY_SEQ1.CURRVAL
FROM DUAL;

DROP SEQUENCE MY_SEQ1;


CREATE TABLE ORDERS(
    ORDER_ID    NUMBER(12),
    ORDER_DATE  DATE,
    ORDER_MODE  VARCHAR2(8) CHECK(ORDER_MODE IN('direct','online')),
    CUSTOMER_ID NUMBER(6),
    ORDER_STATUS NUMBER(2),
    ORDER_TOTAL NUMBER(8,2) DEFAULT 0,
    SALES_REP_ID NUMBER(6),
    PROMOTION_ID NUMBER(6),
    CONSTRAINT ORD_ORDERID_PK PRIMARY KEY(ORDER_ID)
    );
    
    DESC ORDERS;
    
CREATE TABLE ORDER_ITEMS (
    ORDER_ID    NUMBER(12),
    LINE_ITEM_ID NUMBER(3),
    PRODUCT_ID  NUMBER(3),
    UNIT_PRICE  NUMBER(8,2) DEFAULT 0,
    QUANTITY    NUMBER(8) DEFAULT 0,
    CONSTRAINT ORITEM_ORLINEID_PK PRIMARY KEY(ORDER_ID,LINE_ITEM_ID)
    );
    
CREATE TABLE PROMOTIONS(
    PROMO_ID      NUMBER(6) PRIMARY KEY,
    PROMO_NAME  VARCHAR2(20)
    );
    
CREATE SEQUENCE ORDERS_SEQ
INCREMENT BY 1
START WITH 1000
MINVALUE 1
MAXVALUE 99999999;

INSERT INTO PROMOTIONS(PROMO_ID)
VALUES(ORDERS_SEQ.NEXTVAL);

SELECT *
FROM PROMOTIONS;
    
DROP TABLE EX2_10;



