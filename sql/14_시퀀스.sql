--시퀀스 생성 ; 시퀀스는 테이블과 독립적으로 생성
CREATE SEQUENCE 시퀀스1;
-- 옵션 없으면 디폴트값 - 시작1 증가1 최대값 9999999999999999999999999

--삭제
DROP SEQUENCE 시퀀스1;

--시퀀스확인
SELECT*FROM USER_SEQUENCES
WHERE SEQUENCE_NAME='시퀀스1';

-- 듀얼 테이블로 테스트 
-- 시퀀스이름.NEXTVAL -> 실행될때마다 다음값 출력함
SELECT 시퀀스1.NEXTVAL FROM DUAL;

--실제테이블에 적용
CREATE TABLE 부서_테스트(
    부서번호 NUMBER PRIMARY KEY,
    부서이름 VARCHAR2(100)
    );
SELECT*FROM 부서_테스트;

DELETE FROM 부서_테스트 WHERE 부서번호 = 12;
    
INSERT INTO 부서_테스트(부서번호, 부서이름) VALUES (시퀀스1.NEXTVAL,'영업부');
INSERT INTO 부서_테스트(부서번호, 부서이름) VALUES (시퀀스1.NEXTVAL,'회계부');
INSERT INTO 부서_테스트(부서번호, 부서이름) VALUES (시퀀스1.NEXTVAL,'개발부');

--두번째 시퀀스 생성 옵션 시작값과 증가값을 넣기
CREATE SEQUENCE 시퀀스2
START WITH 100
INCREMENT BY 20;

SELECT*FROM USER_SEQUENCES
WHERE SEQUENCE_NAME='시퀀스2';

INSERT INTO 부서_테스트(부서번호, 부서이름) VALUES (시퀀스2.NEXTVAL,'교육부');

SELECT 시퀀스2.CURRVAL FROM DUAL;

--업데이트 (시퀀스 다시 정리)
DROP SEQUENCE 시퀀스1; -- 시퀀스 업애고 새로
CREATE SEQUENCE 시퀀스1;

UPDATE 부서_테스트
SET 부서번호 = 시퀀스1.NEXTVAL;

SELECT*FROM 부서_테스트 ORDER BY 부서번호;

-- 시퀀스 수정
ALTER SEQUENCE 시퀀스1
INCREMENT BY 2;

































