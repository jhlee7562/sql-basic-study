
-- JOIN ����
SELECT
    emp_no, emp_nm, A.dept_cd, dept_nm
FROM tb_emp A, tb_dept B
WHERE A.dept_cd = B.dept_cd
;


--�ڰ��� ���� ���̺�
SELECT * FROM tb_certi;
-- ȸ���� ����� �ڰ��� ���� ���̺�
SELECT * FROM tb_emp_certi;


-- �����ȣ, �����, �����, ����ڰ��� �ڵ��ȣ
SELECT * FROM tb_emp;
SELECT * FROM tb_emp_certi;

SELECT
    A.emp_no, A.emp_no, B.acqu_de, B.certi_cd, c.certi_nm
FROM tb_emp A, tb_emp_certi B, tb_certi C
WHERE A.emp_no = B.emp_no
    AND B.certi_cd = C.certi_cd
    AND B.acqu_de BETWEEN '20190101' AND '20191231'
    AND A.emp_nm LIKE '��%'
;

SELECT
    A.emp_no, A.emp_no, D.dept_nm, B.acqu_de, B.certi_cd, c.certi_nm
FROM tb_emp A, tb_emp_certi B, tb_certi C, tb_dept D
WHERE A.emp_no = B.emp_no
    AND B.certi_cd = C.certi_cd
    AND A.dept_cd = D.dept_cd;
    
    
-- # INNER JOIN
-- 1. 2�� �̻��� ���̺��� ����� �ɷ��� ���� �������� ���յǴ� ���α���Դϴ�.
-- 2. WHERE���� ���� �÷����� �������(=)�� ���� ���ε˴ϴ�.

SELECT
    E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
    AND E.addr LIKE '%����%'
ORDER BY E.emp_no
--ORDER BY tb_emp.emp_no DESC
;

SELECT
*
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
    AND E.addr LIKE '%����%'
ORDER BY E.emp_no
--ORDER BY tb_emp.emp_no DESC
;


-- # NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� �ڵ� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER������ �����մϴ�.
-- 3. �� �� ���εǴ� ���� �̸��� �÷��� ������ Ÿ���� ���ƾ� �ϸ�, ALIAS�� ���̺���� ���� �� �����ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷����� �ڵ� �����ϸ� ��� ���տ��� �ѹ��� ǥ��˴ϴ�.

SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm 
FROM tb_emp E NATURAL JOIN tb_dept D
;

SELECT
    *
FROM tb_emp E NATURAL JOIN tb_dept D
;


-- # USING�� ����
-- 1. NATURAL���ο����� �ڵ����� �̸��� ��ġ�ϴ� ��� �÷��� ���� ������ �Ͼ����
--    USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ���������� ������ �����մϴ�.
-- 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ���� �� �����ϴ�.

SELECT
    E.emp_no, E. emp_nm, E.addr, dept_cd, D.dept_nm
FROM tb_emp E JOIN tb_dept D USING (dept_cd)
;


-- # JOIN ON��
-- 1. ���� ���� ������(ON��)�� �Ϲ� ���� ������(WHERE)�� �и��ؼ� �ۼ��ϴ� ����Դϴ�.
-- 2. ON���� ����ϸ� JOIN���Ŀ� �� �����̳� ���������� ���� �߰� ������ �� �� �ֽ��ϴ�.

SELECT
    E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm
FROM tb_emp E 
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
WHERE E.addr LIKE '%����%'
ORDER BY E.emp_no
;

-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];