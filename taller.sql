SELECT last_name, job_id, salary AS Sal
FROM employees;


SELECT *
FROM job_grades;

SELECT employee_id, last_name, Salary * 12 as ANNUAL_SALARY
FROM employees;

-4
desc departments;
select *
from DEPARTMENTS;

--5
DESC employees;

SELECT last_name AS apellido, job_id AS codigo_de_cargo , hire_date AS fecha_de_contratacion , employee_id AS numero_de_empleado
FROM employees;

--6
SELECT DISTINCT job_id 
FROM employees;

--7
SELECT last_name AS Apellido, job_id AS Job , hire_date "Hire Date" , employee_id "# Employee"
FROM employees;

--8
SELECT last_name || ', ' || job_id AS "Employee and Title"
FROM employees;

--9
SELECT employee_id|| ', ' || first_name|| ', ' || last_name|| ', ' || email|| ', ' || phone_number|| ', ' 
|| hire_date|| ', ' || job_id|| ', ' || salary|| ', ' || commission_pct|| ', ' || manager_id|| ', ' 
|| department_id AS "THE_OUTPUT"
FROM employees;

-- Practica 2 

-- 1. Cree una consulta para mostrar el apellido y el salario de los empleados que
--    ganan más de $12.000.

SELECT last_name, salary
FROM employees
WHERE salary >12000;

--2. Cree una consulta para mostrar el apellido del empleado y el número de
--   departamento para el empleado con ID 176.

SELECT last_name, department_id, employee_id
FROM employees
WHERE employee_id = 176;

--3. Modifique la consulta del ejercicio 1 para mostrar el apellido y el salario de todos
--   los empleados cuyos salarios no se encuentren entre $5.000 y $12.000.
SELECT last_name, salary
FROM employees
WHERE salary < 5000
or salary > 12000;


--4. Muestre el apellido del empleado, el identificador de cargo (job_id) y la fecha de
--   contratación de los empleados contratados entre el 20 de febrero de 2008 y el 1 de
--   mayo de 2008. Ordene la consulta en orden ascendente por fecha de contratación.
SELECT last_name, job_id, hire_date
FROM employees
WHERE hire_date BETWEEN '20/02/08' AND '01/05/08';


--5. Muestre el apellido y el número de departamento de los empleados de los
--   departamentos 20 y 50 en orden alfabético por apellido.

SELECT last_name, department_id
FROM employees
WHERE department_id IN (20, 50)
ORDER BY last_name ASC;



--6. Modifique la consulta del ejercicio 5 para mostrar el apellido y el salario de los
--   empleados que ganan entre $5.000 y $12.000, y están en el departamento 20 ó
--   50. Etiquete las columnas Employee y Monthly Salary, respectivamente.

SELECT last_name "Employee",  salary "Montly Salary", department_id
FROM employees
WHERE salary BETWEEN 5000 AND 12000
AND department_id IN (20, 50);

--7. Muestre el apellido y la fecha de contratación de todos los empleados contratados
--   en 2004.

SELECT last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/2004' AND '31/12/2004';

--8. Muestre el apellido y el cargo de todos los empleados que no tienen gerente
--   (manager_id).

SELECT last_name, job_id, manager_id
FROM employees
WHERE manager_id is null;

--9. Muestre el apellido, el salario y la comisión para todos los empleados que ganan
--   comisiones (commission_pct). Ordene los datos en orden descendente de salarios
--   y comisiones.

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct >0;

--10. Muestre el apellido de todos los empleados que tengan la “a” como tercera letra.

SELECT last_name
FROM employees
WHERE last_name LIKE '__a%'

--11. Muestre el apellido de todos los empleados que tengan una “a” y una “e” en el
--   apellido.

SELECT last_name
FROM employees 
WHERE last_name LIKE '%a%'
AND last_name LIKE '%e%';

--12. Muestre el apellido, el cargo y el salario de todos los empleados cuyos cargos
--   sean representantes de ventas (SA_REP) o encargados de stock (ST_MAN) y
--   cuyo salario no sea igual a $2.500, $3.500 ni $7.000.

SELECT last_name, job_id, salary 
FROM employees
WHERE job_id = 'sa_rep'
OR job_id = 'st_man'
AND salary <> 2500
or salary <>3500
or salary <>7000;

--13. Muestre el apellido, el salario y la comisión para todos los empleados cuyas
--   comisiones son del 20%.

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct = .2;



--  Practica 3

-- 1. Escriba una consulta para mostrar la antigüedad en días de los empleados del
-- departamento de ventas. Etiquete la columna como Antigüedad.

SELECT job_id, (SYSDATE - hire_date) AS Antiguedad
FROM employees
WHERE job_id  = 'SA_MAN';

-- 2. Para cada empleado, visualice su ID, apellido, y salario incrementado en el 20% y
-- expresado como número entero. Etiquete la columna como New Salary.

SELECT employee_id, last_name, (salary +(salary * 0.20)) AS "New Salary"
FROM employees;

-- 3. Modifique la consulta anterior, para agregar una columna que reste el salario
-- antiguo del nuevo. Etiquete la columna nueva como Increase.

SELECT employee_id, last_name, salary AS "Old Salary", (salary +(salary * 0.20)) AS "New Salary", 
ROUND(salary*.20, 0) AS "Increase"
FROM employees;

-- 4. Escriba una consulta que muestre los nombres de los empleados con la primera
-- letra en mayúsculas y todas las demás en minúsculas, así como la longitud del
-- nombre, para todos los empleados cuyos apellidos comienzan con “J”, “A” o “M”.
-- Asigne a cada columna la etiqueta correspondiente. Ordene los resultados según
-- los apellidos de los empleados de forma ascendente.

SELECT INITCAP(first_name) AS "Nombre", INITCAP(last_name) AS "Apellido",  
LENGTH(first_name) AS "Longitud de Nombre"
FROM employees
WHERE (last_name LIKE 'J%'
OR last_name LIKE 'A%'
OR last_name LIKE 'M%');


-- 5. Para cada empleado, muestre su apellido y calcule el número de meses entre el
-- día de hoy y su fecha de contratación. Etiquete la columna como
-- MONTHS_WORKED. Ordene los resultados según el número de meses
-- trabajados descendentemente. Redondee el número de meses hacia arriba para el
-- número entero más próximo.

SELECT last_name AS "Apellido",ROUND((SYSDATE - hire_date)/30, 0) AS "MONTHS WORKED"
FROM employees
ORDER BY hire_date DESC;

-- 6. Escriba una consulta que produzca el siguiente resultado para cada empleado:
-- &lt;first_name&gt;, &lt;last_name&gt; gana &lt;salary&gt; mensuales pero quiere &lt;2 * salary&gt;.
-- Etiquete la columna como Propuesta salarial.

SELECT first_name|| ' ' || last_name || ' gana ' || salary || ' mensuales pero quiere ' || 
(salary * 2) AS "Propuesta Salarial"
FROM employees;

-- 7. Cree una consulta para mostrar el nombre, apellido y el salario de todos los
-- empleados. Formatee el salario para que tenga 15 posiciones, rellenando a la
-- izquierda con $. Etiquete la columna como SALARIO FORMATEADO.

SELECT first_name AS "Nombre", last_name AS "Apellido", LPAD(salary,15, '$') AS "Salario Formateado"
FROM employees;

-- 8. Cree una consulta donde muestre el nombre y apellido en mayúsculas, el salario y
-- la comisión redondeada al entero mayor, para todos los empleados con puesto de
-- SA_REP. Etiquete las columnas según corresponda.

SELECT first_name AS "Nombre", last_name AS "Apellido", salary AS"Salario", 
ROUND(commission_pct, 1) AS "Comision Redondeada", commission_pct AS "comision sin afectar", job_id 
FROM employees
WHERE job_id  = 'SA_REP';

-- 9. Cree una consulta que muestre el número de empleado, nombre, apellido y
-- puesto, para todos los empleados que tengan más de 5 caracteres en sus
-- nombres. Presente los nombres y apellidos en mayúsculas.

SELECT employee_id AS "Numero de empleado", UPPER(first_name) AS "Nombre", 
UPPER(last_name) AS "Apellido", job_id AS "Cargo"
FROM employees
WHERE LENGTH(first_name)>5;

-- 10. Consultar el número, apellidos, salarios, comisiones y fecha de contratación para
-- todos los empleados que ganan más del 15% de comisión o que tengan una ‘s’ en
-- la cuarta posición de su apellido, y que fueron contratados en el año de 2005.

SELECT employee_id, last_name, salary, commission_pct, hire_date
FROM employees
WHERE commission_pct > 0.15
OR last_name LIKE '____s%'
AND hire_date BETWEEN '01/01/2005' AND '31/12/2005';


--- Practica 4

-- 1. Muestre el apellido de cada empleado, así como la fecha de contratación y la
-- fecha de revisión de salario, que es el primer lunes después de seis meses de
-- servicio. Etiquete la columna REVIEW. Formatee las fechas para que aparezca en
-- un formato similar a “Monday, the Thirtyfirst of July, 2000”.

SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date,6), 'LUNES'), 'fm DAY, "The" Ddspth "of", Month, YYYY') AS REVIEW
FROM employees;

-- 2. Muestre el apellido, la fecha de contratación y el día de la semana en el que
-- comenzó a trabajar el empleado. Etiquete a la última columna DAY. Ordene los
-- resultados por la última columna.

SELECT last_name, hire_date, TO_CHAR(hire_date, 'DAY') AS DAY
FROM employees
ORDER BY DAY DESC;

-- 3. Cree una consulta que muestre el apellido y las comisiones de los empleados. Si
-- un empleado no gana comisión, ponga “Sin Comisión”. Etiquete a la última
-- columna COMM.

SELECT last_name, NVL(TO_CHAR(commission_pct),'Sin Comision')
FROM employees;

-- 4. Cree una consulta que muestre el apellido de los empleados y que indique las
-- cantidades de sus salarios con asteriscos. Cada asterisco significa mil dólares.
-- Ordene los datos por salario en orden descendente. Etiquete la columna
-- EMPLOYEES_AND_THEIR_SALARIES.

SELECT last_name, salary, RPAD(' ', ROUND(salary/1000)+ 1, '*')AS EMPLOYEES_AND_THEIR_SALARIES
FROM employees
ORDER BY salary DESC;

-- 5. Usando la función DECODE, escribir una consulta que presente los grados de
-- todos los empleados basado en los valores de la columna JOB_ID, usando los
-- siguientes datos:

SELECT job_id, 
    DECODE(job_id, 'AD_PRES', 'A',
                   'ST_MAN',  'B',
                   'IT_PROG', 'C',
                   'SA_REP', 'D',
                   'ST_CLERK', 'E',
                   'F') GRADO 
    FROM employees;

-- 6. Resuelva el ejercicio anterior utilizando la sintaxis de la función CASE.

SELECT job_id, 
    CASE job_id WHEN 'AD_PRES' THEN 'A' 
                WHEN 'ST_MAN' THEN 'B' 
                WHEN 'IT_PROG'THEN 'C' 
                WHEN 'SA_REP' THEN 'D' 
                WHEN 'ST_CLERK' THEN 'E' 
                ELSE 'F'
    END grado
FROM employees;

 ---- PRACTICA 5 ---
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


--- PRACTICA 6 
-- 1. Escriba una consulta para visualizar el apellido del empleado, y el número y
-- nombre de departamento en el que trabaja.

SELECT last_name, department_id, department_name
FROM employees
NATURAL JOIN departments;

-- 2. Cree un listado de todos los cargos (job_id) sin repetirse que haya en el
-- departamento 80. Incluya la ubicación del departamento (location_id) en el resultado.

SELECT DISTINCT e.job_id, d.location_id, department_id
FROM employees e JOIN departments d
USING (department_id)
WHERE department_id LIKE 80;

-- 3. Escriba una consulta para mostrar el apellido del empleado, el nombre del
-- departamento, el identificador de ubicación y la ciudad de todos los empleados
-- que perciben comisión.

SELECT e.last_name, d.department_name, l.location_id, l.city
FROM employees e  
JOIN departments d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN locations l
ON d.location_id = l.location_id
WHERE e.commission_pct > 0;

-- 4. Visualice el apellido del empleado y el nombre de departamento para todos los
-- empleados que tengan una ‘a’ (minúscula) en el apellido.

SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
USING (department_id)
WHERE e.last_name LIKE '%a%';


-- 5. Escriba una consulta para visualizar el apellido, el cargo, el número de
-- departamento y el nombre de departamento para todos los empleados que
-- trabajen en la ciudad de Toronto.

SELECT e.last_name, e.job_id, d.department_id, d.department_name, l.city
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE l.city LIKE 'Toronto';

-- 6. Visualice el apellido y el número del empleado junto con el apellido y el nombre de
-- su gerente (manager) utilizando un self-join. Etiquete las columnas como
-- Employee, Emp #, Manager y Mgr #, respectivamente.

SELECT e.last_name as Employee, e.employee_id as "Emp #", g.last_name as "Manager", g.first_name as "Mgr"
FROM employees e JOIN employees g
ON (e.manager_id = g.employee_id);

-- 7. Modifique la consulta anterior para visualizar a todos los empleados incluyendo a
-- King, que no tiene gerente. Ordene los resultados por número de empleado.

SELECT e.last_name as Employee, e.employee_id as "Emp #", g.last_name as "Manager", g.first_name as "Mgr"
FROM employees e LEFT OUTER JOIN employees g
ON (e.manager_id = g.employee_id)
ORDER BY e.employee_id;


-- 8. Visualice la estructura de la tabla JOBS mediante el comando DESC. Cree una
-- consulta en la que pueda visualizar el nombre del empleado, nombre de
-- departamento, el salario y el título del cargo (job_title) de todos los empleados.

SELECT e.last_name, d.department_name, e.salary, job.job_title
FROM employees e
JOIN departments d
ON (e.department_id = d.department_id)
JOIN jobs job
ON (e.job_id = job.job_id);


-- 9. Visualice los nombres y las fechas de contratación de todos los empleados
-- contratados antes que sus gerentes, junto con los nombres y las fechas de
-- contratación de dichos gerentes. Etiquete las columnas como Employees, Emp
-- Hired, Manager y Mgr Hired, respectivamente.

SELECT e.last_name as "Employees", e.hire_date as "Emp Hired", m.last_name as "Manager",
m.hire_date as "Mgr Hired"
FROM employees e
JOIN employees m
ON (e.manager_id = m.employee_id)
AND e.hire_date < m.hire_date;

-- Practica 7

-- 1. Escriba una consulta que muestre el apellido y la fecha de contratación de
-- cualquier empleado del mismo departamento que el empleado de apellido Zlotkey.
-- Excluya a Zlotkey del resultado principal.

SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id
                      FROM employees
                      WHERE last_name = 'Zlotkey')
AND last_name <> 'Zlotkey';

-- 2. Cree una consulta para mostrar los números de empleados y los apellidos de
-- todos los empleados que ganen más que el salario promedio. Ordene los
-- resultados por salario en orden descendente.

SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary)
                FROM employees)
ORDER BY salary DESC;

-- 3. Escriba una consulta que muestre los números de empleado y los apellidos de
-- todos los empleados que trabajen en el departamento de cualquier empleado cuyo
-- apellido contenga una ‘a’ en cualquier lugar.

SELECT employee_id, last_name --, department_id
FROM employees
WHERE department_id IN (SELECT DISTINCT department_id 
                           FROM employees
                           WHERE last_name LIKE '%a%')
ORDER BY department_id;

-- 4. Muestre el apellido, el número de departamento y el identificador de cargo (job_id)
-- de todos los empleados cuyos identificadores de ubicación de departamento
-- (location_id) sean 1700.

SELECT last_name, department_id, job_id
FROM employees
WHERE department_id IN(SELECT department_id
                       FROM departments
                       WHERE location_id = 1700);

-- 5. Muestre el apellido y el salario de todos los empleados cuyo manager sea el
-- empleado de apellido King.

SELECT last_name, salary
FROM employees
WHERE manager_id in (SELECT employee_id
                    FROM employees
                    WHERE last_name LIKE 'King');
                    

-- 6. Muestre el número de departamento, el apellido y el identificador de cargo de
-- todos los empleados del departamento llamado Executive.

 SELECT department_id, last_name, job_id
 FROM employees
 WHERE department_id = (SELECT department_id
                        FROM departments
                        WHERE department_name LIKE 'Executive');

-- 7. Modifique la consulta del ejercicio 3 para mostrar los números de empleado, los
-- apellidos y los salarios de todos los empleados que ganan más que el salario
-- promedio y que trabajen en un departamento con un empleado que tenga una ‘u’
-- en cualquier lugar de su apellido.

SELECT employee_id, last_name , salary
FROM employees
WHERE salary > (SELECT AVG(salary)
                 FROM employees)
AND department_id IN (SELECT department_id
                           FROM employees
                           WHERE last_name LIKE '%u%');


-- Practica 8
-- Inserción de datos en la tabla MY_EMPLOYEE.
-- 1. Ejecute la siguiente sentencia para crear la tabla MY_EMPLOYEE que se utilizará
-- para la práctica.

 CREATE TABLE MY_EMPLOYEE(
 ID NUMBER PRIMARY KEY,
 LAST_NAME VARCHAR2(30) NOT NULL,
 FIRST_NAME VARCHAR2(30) NOT NULL,
 USERID VARCHAR2(30) NOT NULL,
 SALARY NUMBER NOT NULL
 );

-- 2. Describa la estructura de la tabla MY_EMPLOYEE, mediante el comando DESC,
-- para identificar los nombres de columna.

DESC my_employee;

-- 3. Agregue solo la primera fila de datos a la tabla MY_EMPLOYEE desde los
-- siguientes datos de ejemplo. No escriba las columnas en la cláusula INSERT.

INSERT INTO my_employee
VALUES(1, 'Patel', 'Ralph', 'Rpatel', 895);

-- 4. Agregue a la tabla MY_EMPLOYEE la segunda fila de los datos de ejemplo de la
-- lista anterior. Esta vez, escriba las columnas explícitamente en la cláusula
-- INSERT.

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES(2, 'Dancs', 'Betty', 'Bdancs', 860);

-- 5. Visualice los datos de la tabla MY_EMPLOYEE.

SELECT *
FROM my_employee;

-- 6. Escriba una sentencia INSERT para cargar filas en la tabla MY_EMPLOYEE
-- solicitando datos al usuario con el comando &amp;variable.

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (&id, '&last_name', '&first_name', '&userid', &salary);

-- 7. Rellene la tabla con la tercera y cuarta fila de los datos de ejemplo ejecutando la
-- sentencia INSERT creada en el ejercicio 6.



-- 8. Visualice los datos de la tabla MY_EMPLOYEE.

SELECT *
FROM my_employee;

-- 9. Haga que las adiciones de datos sean permanentes.

commit;

-- Actualización y eliminación de datos en la tabla MY_EMPLOYEE.
-- 10. Cambie el apellido del empleado 3 por Drexter.

UPDATE my_employee
SET last_name = 'Drexter'
WHERE id=3;

-- 11. Cambie el salario a 1000 para todos los empleados con un salario inferior a 900.

UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

-- 12. Visualice los datos de la tabla MY_EMPLOYEE.

SELECT *
FROM my_employee;

-- 13. Elimine a Betty Dancs de la tabla MY_EMPLOYEE.

DELETE FROM my_employee
WHERE id = 2;

-- 14. Visualice los datos de la tabla MY_EMPLOYEE.

SELECT *
FROM my_employee;

-- 15. Haga que los cambios en los datos sean permanentes.

commit;

-- Control de la transacción de datos a la tabla MY_EMPLOYEE.
-- 16. Rellene la tabla con la quinta fila de los datos de ejemplo modificando los valores
-- del comando que creó en el ejercicio 6.

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (&id, '&last_name', '&first_name', '&userid', &salary);

-- 17. Visualice los datos de la tabla MY_EMPLOYEE.

SELECT *
FROM my_employee;

-- 18. Vacíe toda la tabla mediante el comando DELETE.

DELETE FROM my_employee;

-- 19. Visualice todos los datos de la tabla para verificar que está vacía.

SELECT *
FROM my_employee;

-- 20. Deshaga los cambios en los datos.

ROLLBACK;

-- 21. Realice una captura de pantalla de los datos de la tabla MY_EMPLOYEE.

SELECT *
FROM my_employee;

 --- Practica 9
 
-- Cree una tabla llamada DEPTOS con la siguiente estructura:

CREATE TABLE DEPTOS(
 ID NUMBER(7) PRIMARY KEY,
 NAME VARCHAR2(25) NOT NULL
 );

-- Rellene la tabla DEPTOS con todas las filas de la tabla DEPARTMENTS. Incluya solo las columnas que necesite.

INSERT INTO DEPTOS 
VALUES (1, ITPRO); 

-- Cree una tabla llamada EMPS con la siguiente estructura:

CREATE TABLE EMPS(
 ID NUMBER(7) PRIMARY KEY,
 LAST_NAME VARCHAR2(25) NOT NULL,
 FIRST_NAME VARCHAR2(25) NOT NULL,
 DEPT_ID NUMBER(7) FOREIGN KEY (DEPTOS)
 REFERENCES DEPTOS(ID) 
 );

-- Modifique la tabla EMPS para permitir una longitud de apellido de 35.

ALTER TABLE EMPS
MODIFY (LAST_NAME VARCHAR2(35));

-- Agregue 3 filas cualesquiera en la tabla EMPS y consulte los datos.

INSERT INTO EMPS
VALUES (1, CASTILLO , ALDAIR, 1);
VALUES (2, VAZQUEZ , NOEL, 1);
VALUES (3, CORTEZ , HECOAL, 1);

-- Cambie el nombre de la tabla EMPS a EMPLEADOS

RENAME EMPS TO EMPLEADOS

-- Cree la tabla EMPLOYEES_2 basándose en la estructura de la tabla EMPLOYEES. 
-- Incluya solo las columnas EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY y DEPARTMENT_ID. 
-- Llame a las columnas de la nueva tabla ID, NOMBRE, APELLIDO, SALARIO y CLAVE_DEPT, respectivamente.

CREATE TABLE EMPLOYEES_2 
AS
    SELECT EMPLOYEE_ID AS ID, FIRST_NAME AS NOMBRE, LAST_NAME AS APELLIDO, SALARY AS SALARIO, DEPARTMENT_ID AS CLAVE_DEPT
FROM EMPLOYEES;

-- Borre la columna FIRST_NAME de la tabla EMPLEADOS. 
-- Confirme la modificación comprobando la descripción de la tabla con el comando DESC.

ALTER TABLE EMPLEADOS 
DROP FIRST_NAME;

DESC EMPLEADOS;