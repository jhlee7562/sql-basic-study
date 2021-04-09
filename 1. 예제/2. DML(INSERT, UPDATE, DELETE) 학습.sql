
-- # DML : ������ ���۾�
-- SELECT, INSERT, UPDATE, DELETE
-- �������߰�(INSERT)
INSERT INTO
    board (bno, title, content, writer, reg_date)
VALUES
    (1, '�ȳ�~', '��մ� �����Դϴ�.', '����Ŭ', SYSDATE);
    
--����
INSERT INTO
    board (bno, content, writer, reg_date)
VALUES
    (2, '��մ� ����2�Դϴ�.', '�Ѹ�', SYSDATE);
    
INSERT INTO
    board (bno, title, writer, reg_date)
VALUES
    (3, '3�����̿���', '�Ѹ�', SYSDATE);
    
INSERT INTO
    board
VALUES
    (4, '3�����̿���', '���볻��~~', '�Ѹ�', SYSDATE);
    
-- PK�� �ߺ��� �����͸� ������ �� ����
INSERT INTO
    board
VALUES
    (4, '4�����̿���', '���볻��2~~', '��浿', SYSDATE);
    
COMMIT;

-- ������ ����(UPDATE)
UPDATE board
SET writer = '������'
WHERE bno = 1;

UPDATE board
SET writer = 'mike',
    content = 'hello goodbye!'
WHERE bno = 3;

-- UPDATE������ WHERE�������� ������ ���
UPDATE board
SET title = '�޷�';

COMMIT;

--������ ���� (WHERE���� ������ ��� ��ü���� �����ǹǷ� ����)
DELETE FROM board
WHERE bno = 4;

COMMIT;

ROLLBACK;
    
-- ��ü ������ ����
-- 1. WHERE���� ������ DELETE�� (ROLLBACK ����)
DELETE FROM board
ROLLBACK;
-- 2. TRUNCATE TABLE DDL�� ����� ��� (ROLLBACK �Ұ��� / ���̺� ������ �������� ����)
-- FK ����
ALTER TABLE REPLY 
drop CONSTRAINT fk_reply_bno;

TRUNCATE TABLE board;
-- 3. DROP TABLE DDL�� ����� ��� (ROLLBACK �Ұ��� / ���̺� ������ ����)
DROP TABLE board;

    
SELECT * FROM board;
    
    
    
    