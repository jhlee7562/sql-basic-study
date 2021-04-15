SELECT * FROM employees;
SELECT * FROM departments;
-- # �ǽ� ����
-- 1. employees, departments���̺��� INNER JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    A.first_name, A.department_id, B.department_name
FROM employees A, departments B
WHERE a.department_id = b.department_id;

-- 2. employees, departments���̺��� NATURAL JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    A.first_name, department_id, B.department_name
FROM employees A NATURAL JOIN departments B
ORDER BY A.employee_id;

SELECT
    A.first_name, department_id, B.department_name
FROM employees A JOIN departments B USING (department_id)
ORDER BY a.employee_id;

SELECT 
    A.first_name, department_id, B.department_name
FROM employees A JOIN departments B USING (department_id, manager_id)
ORDER BY A.employee_id;


-- 3. employees, departments���̺��� JOIN ON�� ����ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT 
    A.first_name, A.department_id, B.department_name
FROM employees A
JOIN departments B
ON A.employees_id = B.departments_id;
