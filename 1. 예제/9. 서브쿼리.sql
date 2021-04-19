-- # ��������
-- ## ������ ��������

-- �����ȣ�� 1000000005���� ����� ���� �μ��� ��� �������
SELECT 
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd = (
                    SELECT dept_cd
                    FROM tb_emp
                    WHERE emp_no = '1000000005'
                    );
                    
-- 20150525�� ���� �޿��� ȸ�� ��ü ��ձ޿����� ���� ������� ���� ��ȸ
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

-- ## ���� �� ��������
-- �������� ��ȸ �Ǽ� ���� ���� ��
-- ������ ������ : IN, ANY, EXISTS

-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ� ����ȣ�� ���� �ڰ��� ������ ��ȸ
SELECT
    A.emp_no, B.emp_nm, COUNT(A.certi_cd)
FROM tb_emp_certi A
JOIN tb_emp B
ON A.emp_no = B.emp_no
WHERE certi_cd IN (
                    SELECT
                        C.certi_cd
                    FROM tb_certi C
                    WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
                    )
GROUP BY A.emp_no, B.emp_nm;
                        
SELECT
*
FROM tb_certi
WHERE issue_insti_nm = '�ѱ������ͺ��̽������';