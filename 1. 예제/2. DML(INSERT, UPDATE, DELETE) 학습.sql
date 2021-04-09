
-- # DML : 데이터 조작어
-- SELECT, INSERT, UPDATE, DELETE
-- 데이터추가(INSERT)
INSERT INTO
    board (bno, title, content, writer, reg_date)
VALUES
    (1, '안녕~', '재밌는 내용입니다.', '마이클', SYSDATE);
    
--에러
INSERT INTO
    board (bno, content, writer, reg_date)
VALUES
    (2, '재밌는 내용2입니다.', '둘리', SYSDATE);
    
INSERT INTO
    board (bno, title, writer, reg_date)
VALUES
    (3, '3번글이에요', '둘리', SYSDATE);
    
INSERT INTO
    board
VALUES
    (4, '3번글이에요', '내용내용~~', '둘리', SYSDATE);
    
-- PK는 중복된 데이터를 저장할 수 없음
INSERT INTO
    board
VALUES
    (4, '4번글이에요', '내용내용2~~', '고길동', SYSDATE);
    
COMMIT;

-- 데이터 수정(UPDATE)
UPDATE board
SET writer = '수정자'
WHERE bno = 1;

UPDATE board
SET writer = 'mike',
    content = 'hello goodbye!'
WHERE bno = 3;

-- UPDATE절에서 WHERE조건절이 생략될 경우
UPDATE board
SET title = '메롱';

COMMIT;

--데이터 삭제 (WHERE절을 생략할 경우 전체행이 삭제되므로 주의)
DELETE FROM board
WHERE bno = 4;

COMMIT;

ROLLBACK;
    
-- 전체 데이터 삭제
-- 1. WHERE절을 생략한 DELETE절 (ROLLBACK 가능)
DELETE FROM board
ROLLBACK;
-- 2. TRUNCATE TABLE DDL을 사용한 방법 (ROLLBACK 불가능 / 테이블 구조는 삭제되지 않음)
-- FK 설정
ALTER TABLE REPLY 
drop CONSTRAINT fk_reply_bno;

TRUNCATE TABLE board;
-- 3. DROP TABLE DDL을 사용한 방법 (ROLLBACK 불가능 / 테이블 구조도 삭제)
DROP TABLE board;

    
SELECT * FROM board;
    
    
    
    