USE employees;

-- Pregunta 1: Cual es el salario promedio de la empresa
SELECT 
    ROUND(AVG(salary), 2) AS salario_promedio
FROM salaries
WHERE to_date = '9999-01-01';

-- Pregunta 2: Cual es el salario mas alto y mas bajo de la empresa
SELECT 
    MAX(salary) AS salario_maximo,
    MIN(salary) AS salario_minimo
FROM salaries
WHERE to_date = '9999-01-01';

-- Pregunta 3: Que departamentos tienen el salario promedio mas alto y mas bajo
SELECT 
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS salario_promedio
FROM salaries s
JOIN dept_emp de ON s.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE s.to_date = '9999-01-01' 
  AND de.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY salario_promedio DESC;

-- Pregunta 4: Existe una brecha salarial por genero
SELECT 
    e.gender,
    ROUND(AVG(s.salary), 2) AS salario_promedio,
    COUNT(*) AS total_empleados
FROM salaries s
JOIN employees e ON s.emp_no = e.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY e.gender;

-- Pregunta 5: Cuantos empleados ganan mas de 100,000
SELECT 
    COUNT(*) AS empleados_mas_100k
FROM salaries
WHERE to_date = '9999-01-01'
  AND salary > 100000;

-- Pregunta 6: Cuales son los 5 salarios mas altos de la empresa
SELECT 
    emp_no,
    salary
FROM salaries
WHERE to_date = '9999-01-01'
ORDER BY salary DESC
LIMIT 5;

-- Pregunta 7: Cuantos empleados ganan menos de 50,000
SELECT 
    COUNT(*) AS empleados_menos_50k
FROM salaries
WHERE to_date = '9999-01-01'
  AND salary < 50000;

-- Pregunta 8: Cual es el gasto total de nomina de la empresa
SELECT 
    SUM(salary) AS nomina_total
FROM salaries
WHERE to_date = '9999-01-01';

-- Pregunta 9: Cual es la nomina total de empleados que ganan mas de 90,000
SELECT 
    SUM(salary) AS nomina_altos_ingresos
FROM salaries
WHERE to_date = '9999-01-01'
  AND salary > 90000;

-- Pregunta 10: Cual es la desviacion estandar de los salarios
SELECT 
    ROUND(STDDEV(salary), 2) AS desviacion_estandar
FROM salaries
WHERE to_date = '9999-01-01';

-- Pregunta 11: Cual es el salario mas frecuente en la empresa
SELECT 
    salary,
    COUNT(*) AS frecuencia
FROM salaries
WHERE to_date = '9999-01-01'
GROUP BY salary
ORDER BY frecuencia DESC
LIMIT 1;

-- Pregunta 12: Cuanto gasta la empresa anualmente en salarios mayores a 80,000
SELECT 
    YEAR(from_date) AS anio,
    SUM(salary) AS gasto_total_salarios_altos
FROM salaries
WHERE salary > 80000
GROUP BY YEAR(from_date)
ORDER BY anio DESC;