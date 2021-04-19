-- # 서브쿼리
-- ## 단일행 서브쿼리

-- 사원번호가 1000000005번인 사원이 속한 부서의 모든 사원정보
SELECT 
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd = (
                    SELECT dept_cd
                    FROM tb_emp
                    WHERE emp_no = '1000000005'
                    );
                    
-- 20150525에 받은 급여가 회사 전체 평균급여보다 높은 사원들의 정보 조회
SELECT 
    A.emp_no, A.emp_nm, B.pay_de, B.pay_amt
FROM tb_emp A
JOIN tb_sal_his B
ON A.emp_no = B.emp_no
WHERE B.pay_de = '20200525'
    AND B.pay_amt >= (
                        SELECT AVG(pay_amt)
                        FROM tb_sal_his
                        WHERE pay_de = '20200525'
                        );

-- ## 다중 행 서브쿼리
-- 서브쿼리 조회 건수 여러 행인 것
-- 다중행 연산자 : IN, ANY, EXISTS

-- 한국데이터베이스진흥원에서 발급한 자격증을 가지고 있는 사언번호와 보유 자격증 개수를 조회
SELECT
    A.emp_no, B.emp_nm, COUNT(A.certi_cd)
FROM tb_emp_certi A
JOIN tb_emp B
ON A.emp_no = B.emp_no
WHERE certi_cd IN (
                    SELECT
                        C.certi_cd
                    FROM tb_certi C
                    WHERE issue_insti_nm = '한국데이터베이스진흥원'
                    )
GROUP BY A.emp_no, B.emp_nm;
                        
SELECT
*
FROM tb_certi
WHERE issue_insti_nm = '한국데이터베이스진흥원';