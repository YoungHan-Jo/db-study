DELETE FROM member
WHERE id = ?;

SELECT * FROM member WHERE id = 'aaa' ;

SELECT COUNT(*) AS cnt -- COUNT(*) 전체 컬럼중에서 unique 키로 자동설정됨.
FROM member;

select*from member order by name;

SELECT * FROM member ORDER BY name;

SELECT recv_email, count(recv_email) AS cnt
FROM member
GROUP BY recv_email;