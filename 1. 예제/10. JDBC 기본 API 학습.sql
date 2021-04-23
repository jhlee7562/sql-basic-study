CREATE TABLE jdbc_practice (
    id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(20) NOT NULL,
    addr VARCHAR2(50)
    );
    
SELECT * FROM jdbc_practice;

SELECT COUNT(*) AS cnt FROM jdbc_practice;