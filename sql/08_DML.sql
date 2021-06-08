----------------------------
-- 데이터의 입력
----------------------------

--우선 테이블 복사하여 COPY_DEP 테이블을 만든다
CREATE TABLE COPY_DEP
AS
SELECT*FROM departments; -- AS 다음 셀릭트문을 복사

-- 복사한 테이블에 입력
INSERT INTO copy_dep(DEPARTMENT_ID, department_name, MANAGER_ID, LOCATION_ID)
VALUES (300, 'Game', 100, 1700);

SELECT*
FROM copy_dep;

--테이블의 열을 확인
DESC departments;

INSERT INTO copy_dep(DEPARTMENT_ID, department_name)
VALUES (280, 'Music');

--EX1
INSERT INTO departments VALUES (271, 'Sample Dept 1', 200, 1700);
INSERT INTO departments VALUES (272, 'Sample Dept 2', 200, 1700);
INSERT INTO departments VALUES (273, 'Sample Dept 3', 200, 1700);

SELECT*
FROM departments;

ROLLBACK;


-----------------------------------
-- 데이터의 수정 UPDATE
-----------------------------------

-- EX
UPDATE departments
SET manager_id = 100, location_id = 2400
WHERE department_id BETWEEN 150 AND 200;

SELECT *
FROM departments
WHERE department_id BETWEEN 150 AND 200;


-------------------------------------
-- 삭제 DELETE
-------------------------------------


DELETE FROM departments
WHERE manager_id = 100
AND location_id = 2400;


INSERT INTO departments VALUES(150,'Shareholder Services',NULL,	1700);
INSERT INTO departments VALUES(160,'Benefits',NULL,1700);
INSERT INTO departments VALUES(170,'Manufacturing',NULL,1700);
INSERT INTO departments VALUES(180,'Construction',NULL,1700);
INSERT INTO departments VALUES(190,'Contracting',NULL,1700);
INSERT INTO departments VALUES(200,'Operations',NULL,1700);




DESC departments;


DESC employees;
























