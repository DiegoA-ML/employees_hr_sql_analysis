USE employees;

-- ============================================================
-- PARTE 3: DESEMPEÑO DEPARTAMENTAL
-- ============================================================
-- NOTA: Las preguntas 3.1 (distribución de empleados), 2.12
-- (salario promedio por departamento) y 3.5 (menor retención)
-- reutilizan queries ya ejecutadas en la Parte 1 y Parte 2.
-- Las nuevas queries exclusivas de la Parte 3 son: 3.2, 3.3, 3.4.
-- ============================================================


-- ------------------------------------------------------------
-- Pregunta 3.1: ¿Cómo se distribuye la fuerza laboral entre
-- departamentos y cuál es el más grande?
-- (Reutiliza lógica de Parte 1 — versión con filtro de fecha)
-- ------------------------------------------------------------
SELECT 
    d.dept_name AS Departamento,
    COUNT(de.emp_no) AS TotalEmpleados
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
WHERE de.from_date <= '2002-12-31'
  AND de.to_date > '2002-12-31'
GROUP BY d.dept_name
ORDER BY TotalEmpleados DESC;


-- ------------------------------------------------------------
-- Pregunta 3.2 (NUEVA): ¿Qué departamentos han tenido más
-- cambios de gerente?
-- ------------------------------------------------------------
SELECT 
    d.dept_name AS Departamento,
    COUNT(*) AS CambiosDeGerente
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY CambiosDeGerente DESC;


-- ------------------------------------------------------------
-- Pregunta 3.3 (NUEVA): ¿Cuál es la antigüedad de los gerentes
-- actuales en cada departamento?
-- ------------------------------------------------------------
SELECT 
    d.dept_name AS Departamento,
    CONCAT(e.first_name, ' ', e.last_name) AS NombreGerente,
    dm.from_date AS InicioComoGerente,
    ROUND(DATEDIFF('2002-12-31', dm.from_date) / 365.25, 2) AS AnosComoGerente
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.to_date > '2002-12-31'
ORDER BY AnosComoGerente DESC;


-- ------------------------------------------------------------
-- Pregunta 3.4 (NUEVA): ¿Qué departamentos tuvieron más
-- contrataciones en los últimos 5 años (1998–2002)?
-- ------------------------------------------------------------
SELECT 
    d.dept_name AS Departamento,
    COUNT(*) AS ContratacionesUltimos5Años
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE e.hire_date BETWEEN '1998-01-01' AND '2002-12-31'
GROUP BY d.dept_name
ORDER BY ContratacionesUltimos5Años DESC;


-- ------------------------------------------------------------
-- Pregunta 3.5: ¿Qué departamentos tienen la antigüedad
-- promedio más baja?
-- (Reutiliza lógica de Parte 1 sección 1.9 — orden ASC)
-- ------------------------------------------------------------
SELECT 
    d.dept_name AS Departamento,
    COUNT(*) AS TotalEmpleados,
    ROUND(AVG(DATEDIFF('2002-12-31', e.hire_date) / 365.25), 2) AS AntiguedadPromedioAños
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE de.from_date <= '2002-12-31'
  AND de.to_date > '2002-12-31'
GROUP BY d.dept_name
ORDER BY AntiguedadPromedioAños ASC;

-- PARA REFERENCIA: Salario promedio por departamento (ya hecha en Parte 2)
-- Ver sección 2.12 del Overleaf — misma query, no es necesario volver a correrla.