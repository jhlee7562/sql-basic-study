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


-- ## 다중 컬럼 서브쿼리
-- 부서원이 2명 이상인 부서 중에서 각 부서의 가장 나이 많은 사람의 정보를 조회

SELECT
    A.emp_no, A.emp_nm, A.dept_cd, B.dept_nm, A.birth_de
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE (A.dept_cd, A.birth_de) IN (
                SELECT
                    E.dept_cd, MIN(E.birth_de)
                FROM tb_emp E
                GROUP BY E.dept_cd
                HAVING COUNT (*) >= 2
            )
ORDER BY A.emp_no
;

SELECT
    'A'
FROM tb_emp
WHERE addr LIKE '%용인%';    

-- 주소가 강남인 직원들의 부서정보를 조회
SELECT
    A.dept_cd, A.dpet_nm
FROM tb_dept A
WHERE EXISTS (
                SELECT 1
                FROM tb_emp K
                WHERE K.addr LIKE '%강남%'
                AND A.dept_cd = K.dept_cd
                )
;

SELECT K.emp_nm, K.addr
FROM tb_emp K
WHERE K.addr LIKE '%강남%';


-- ## 스칼라 서브쿼리 (SELECT절에 들어가는 서브쿼리)

SELECT 
    A.emp_no, A.emp_nm, A.dept_cd,
    (SELECT B.dept_nm FROM tb_dept B WHERE A.dept_cd = B.dept_cd) AS dept_nm
FROM tb_emp A
;


-- 한국데이터베이스진흥원에서 발급한 자격증을 갖고 있는 사원의 정보를 조회
SELECT
    A.emp_no,
    (SELECT B.emp_nm FROM tb_emp B WHERE A.emp_no = B.emp_no) AS emp_nm,
    A.certi_cd,
    (SELECT C.certi_nm FROM tb_certi C WHERE A.certi_cd = C.certi_cd) AS certi_nm
FROM tb_emp_certi A
WHERE A.certi_cd IN (
                        SELECT certi_cd
                        FROM tb_certi
                        WHERE issue_insti_nm = '한국데이터베이스진흥원'                        
                    );
                    
                    
 -- # 인라인 뷰 (FROM절에 사용하는 서브쿼리)
SELECT *
FROM (
        SELECT ROWNUM rn, emp_no, emp_nm, addr 
        FROM tb_emp
        WHERE ROWNUM <= 40
      ) A
-- WHERE A.addr LIKE '%용인%'  
WHERE rn > 20
;

SELECT 
    ROWNUM, emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no DESC;


-- ## 다중행 서브쿼리 연산자
-- 1. IN: 목록의 어떤값과 같은지 확인
-- 2. ANY, SOME: 값을 서브쿼리에 의해 리턴된 값 목록과 비교하는데 하나라도 만족하면 됨.
-- 3. ALL: 값을 서브쿼리에 의해 리턴된 값 목록과 비교하는데 모든 값을 만족해야 함.
-- 4. EXISTS: 결과를 만족하는 값이 존재하는지의 여부를 확인

--  IN연산자와 = ANY는 동일하다
SELECT
    emp_nm, addr, dept_cd
FROM tb_emp
WHERE dept_cd = ANY (
                    SELECT dept_cd
                    FROM tb_emp
                    WHERE emp_nm = '이관심'
                );                   