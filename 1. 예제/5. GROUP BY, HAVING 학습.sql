-- # GROUP BY, HAVING절
-- 1. 집계 함수
SELECT
    COUNT(emp_no) AS "총 사원수",
    MAX(birth_de) AS "가장 어린 사람",
    MIN(birth_de) AS "가장 늙은 사람"
FROM tb_emp;

SELECT * FROM tb_emp;

SELECT 
    COUNT(*),
    COUNT(direct_manager_emp_no)
FROM tb_emp;

SELECT * FROM tb_sal_his;


-- 2. GROUP BY

-- 부서별로 가장 어린 사람의 생년월일, 가장 연장자의 생년월일, 부서별 총 직원수를 알고 싶다.
SELECT * FROM tb_emp;

SELECT
    dept_cd,
    COUNT(*) AS "부서별 직원수",
    MAX(birth_de) AS "가장 어린 사람",
    MIN(birth_de) AS "가장 늙은 사람"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd;


-- HAVING절 : 그룹화 된 결과에서 조건을 걸어서 행 수 제한
SELECT
    A.dept_cd,
    (SELECT B.dept_nm FROM tb_dept B WHERE A.dept_cd = B.dept_cd) AS dept_nm, 
    COUNT(*) AS "부서별 직원수",
    MAX(A.birth_de) AS "가장 어린 사람",
    MIN(A.birth_de) AS "가장 늙은 사람"
FROM tb_emp A
GROUP BY A.dept_cd
HAVING COUNT(*) > 1
ORDER BY A.dept_cd;


-- 사원별 급여가 제일 많은 액수, 제일 적은 액수, 평균액수를 조회
SELECT emp_no, pay_amt, pay_de
FROM tb_sal_his
ORDER BY emp_no, pay_de;

SELECT
    A.emp_no,
    (SELECT B.emp_nm FROM tb_emp B WHERE A.emp_no = B.emp_no) AS emp_nm,
    ROUND(AVG(A.pay_amt),2) AS "평균 급여",
    MAX(A.pay_amt) AS "최고 급여",
    MIN(A.pay_amt) AS "최저 급여"
FROM tb_sal_his A
WHERE a.pay_de BETWEEN '20190101' AND '20191231'
GROUP BY A.emp_no
HAVING AVG(A.pay_amt) >= 4700000 --그룹화이후 한번더 거름
ORDER BY A.emp_no;


-- 사원별 2019년 사원번호와, 사원이름, 연봉을 조회
SELECT
    A.emp_no,
    (SELECT B.emp_nm FROM tb_emp B WHERE A.emp_no =B.emp_no) AS "emp_nm",
    TO_CHAR(SUM(A.pay_amt), 'L999,999,999') AS 연봉
FROM tb_sal_his A
WHERE A.pay_de BETWEEN '20190101' AND '20191231'
GROUP BY A.emp_no
ORDER BY A.emp_no;


-- 정렬 ORDER BY
-- ASC : 오름차(기본값), DESC내림차
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no DESC;

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY 1 DESC;

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY 2;

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC, emp_no;

SELECT emp_no AS en, emp_nm AS em, addr
FROM tb_emp
ORDER BY em DESC;