USE employees;

-- Pregunta 1: Cuantos empleados han tenido mas de un puesto
SELECT 
    emp_no,
    COUNT(DISTINCT title) AS num_titulos
FROM titles
GROUP BY emp_no
HAVING num_titulos > 1
ORDER BY num_titulos DESC;

-- Pregunta 2: Cuantos empleados han cambiado de departamento
SELECT COUNT(*) AS total_empleados_con_cambios
FROM (
    SELECT emp_no
    FROM dept_emp
    GROUP BY emp_no
    HAVING COUNT(DISTINCT dept_no) > 1
) AS empleados_movidos;

-- Pregunta 3: Cual es la antiguedad promedio de los empleados
SELECT 
    ROUND(AVG(DATEDIFF(CURDATE(), hire_date) / 365), 1) AS antiguedad_promedio_anos
FROM employees;

-- Pregunta 4: Que departamento tiene mas empleados actualmente
SELECT 
    d.dept_name,
    COUNT(de.emp_no) AS total_empleados
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY total_empleados DESC;

-- Pregunta 5: Cuantos empleados hay por genero
SELECT 
    gender,
    COUNT(*) AS total
FROM employees
GROUP BY gender;