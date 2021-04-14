-- �ǽ�����

-- 1. employees���̺��� �� ����� �μ��� �μ� ��ȣ(department_id)�� ��� �޿�(salary)�� ��ȸ�ϼ���. 
SELECT * FROM employees;

SELECT
    NVL(department_id, 0) AS �μ���ȣ,
    ROUND (AVG(salary),2) AS ���    
FROM employees 
GROUP BY department_id;

-- 2. employees���̺��� �μ��� �μ� ��ȣ(department_id)�� �μ��� �� ��� ���� ��ȸ�ϼ���.
SELECT
    NVL(department_id, 0) AS �μ���ȣ,
    COUNT(*) AS �μ����ѻ��
FROM employees 
GROUP BY department_id;

-- 3. employees���̺��� �μ��� �޿� ����� 8000�� �ʰ��ϴ� �μ��� �μ���ȣ�� �޿� ����� ��ȸ�ϼ���.
SELECT
    NVL(department_id, 0) AS �μ���ȣ,
    ROUND (AVG(salary),2) AS ���
FROM employees 
GROUP BY department_id
HAVING AVG(salary) > 8000;

-- 4. employees���̺��� �޿� ����� 8000�� �ʰ��ϴ� �� ����(job_id)�� ���Ͽ� 
--    ���� �̸�(job_id)�� SA�� �����ϴ� ����� �����ϰ� ���� �̸��� �޿� ����� 
--    �޿� ����� ���� ������ �����Ͽ� ��ȸ�ϼ���.
SELECT
    job_id,
    ROUND(AVG(salary), 2) AS ���
FROM employees 
WHERE job_id NOT LIKE 'SA%' 
GROUP BY job_id
HAVING ROUND(AVG(salary), 2) > 8000
ORDER BY ��� DESC;

SELECT 
    job_id,
    ROUND(AVG(salary), 2) AS sal_avg
FROM employees
WHERE job_id NOT LIKE 'SA%' 
GROUP BY job_id
HAVING ROUND(AVG(salary), 2) > 8000
ORDER BY sal_avg DESC;