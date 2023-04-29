
-- 1. Muestre el cargo (job_id) y la suma del salario de los empleados cuyo cargo no
-- incluya el texto ‘REP’, teniendo la suma del salario mayor a 13,000. Ordene los
-- resultados por la segunda columna. Etiquete las columnas de manera correspondiente.

SELECT job_id AS Cargos, SUM(salary) AS "Suma"
FROM employees
WHERE  job_id NOT LIKE '%REP%' 
group by job_id 
HAVING sum(salary)>13000
ORDER BY 'Suma';

-- 2. Muestre el salario máximo de los empleados agrupando por número de departamento.

SELECT department_id, max(salary)
FROM employees
GROUP BY department_id;

-- 3. Muestre el número de departamento junto con su fecha de contratación mínima.
-- Ordene el resultado por la segunda columna.

SELECT department_id, MIN(hire_date) as "Contratacion_Minima"
FROM employees
GROUP BY department_id
ORDER BY 'Contratacion_Minima';

-- 4. Muestre el número de departamento y el salario mínimo por departamento.
-- Etiquete las columnas como corresponda y ordene el resultado por la segunda
-- columna.

SELECT department_id AS "Departamento", MIN(salary) AS "Salario"
FROM employees
GROUP BY department_id
ORDER BY 'Salario';

-- 5. Muestre el número de departamento, cargo (job_id), y porcentaje de comisión
-- promedio (incluyendo nulos) agrupando por departamentos y cargos. Redondee la
-- última columna al segundo decimal y etiquétela como “COMM %”.

SELECT department_id, job_id, TRUNC(AVG(NVL(commission_pct,0)), 2) AS "COMM %"
FROM employees
GROUP BY department_id, job_id;

-- 6. Muestre el total de empleados con el cargo ‘IT_PROG’ o ‘SA_REP’. Etiquete la
-- columna como corresponda.

SELECT COUNT(*)
FROM employees
WHERE job_id LIKE 'SA_REP'
OR job_id LIKE 'IT_PROG'
ORDER BY job_id;


-- 7. Muestre el número de departamento y el salario mínimo de los empleados que
-- tengan un salario mínimo menor que 3,000.

SELECT department_id, MIN(salary)
FROM employees
HAVING MIN(salary)<3000
GROUP BY department_id;

-- 8. Muestre todos los salarios mínimos, agrupando por número de departamento.
-- Muestre el resultado con el formato “$XX,XXX.00”. Etiquete la columna como
-- corresponda.

SELECT TO_CHAR(MIN(salary), '$99,999,00') AS "Salario Minimo"
FROM employees
GROUP BY department_id;