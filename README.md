# employees-hr-sql-analysis

Análisis de datos de Recursos Humanos utilizando SQL sobre la base de datos `employees`. El proyecto responde preguntas clave de negocio para el área de RH, dividido en tres partes: comprensión de la fuerza laboral, perspectivas salariales y desempeño departamental.

---

## Contexto

La base de datos `employees` contiene información histórica de una empresa con más de 300,000 empleados. Dado que los registros de fecha terminan en 2002, todo el análisis toma el **31 de diciembre de 2002** como fecha de referencia.

El proyecto fue desarrollado como parte de un curso de análisis de datos con SQL en el **ITESM**.

---

## Estructura del Repositorio

```
employees-hr-sql-analysis/
├── sql/
│   ├── parte1_workforce.sql        # Queries: demografía, movilidad, retención, contratación
│   ├── parte2_salaries.sql         # Queries: salarios, nómina, equidad salarial
│   └── parte3_departments.sql      # Queries: desempeño y liderazgo departamental
├── notebooks/
│   ├── parte1_notebook.ipynb       # Análisis y resultados de la Parte 1
│   ├── parte2_notebook.ipynb       # Análisis y resultados de la Parte 2
│   └── parte3_notebook.ipynb       # Análisis y resultados de la Parte 3
├── latex/
│   └── overleaf_final_v2.tex       # Reporte completo en LaTeX
└── README.md
```

---

## Partes del Proyecto

### Parte 1 — Comprensión de la Fuerza Laboral
Análisis demográfico y de comportamiento de los empleados.

- Total de empleados y distribución por edad y género
- Empleados que han cambiado de departamento
- Movilidad interna y tasa de promoción por departamento
- Tiempo promedio en el primer rol antes de una promoción
- Antigüedad promedio general y por departamento
- Tendencias de contratación por año, mes y día de la semana

### Parte 2 — Perspectivas Salariales
Análisis de la estructura y distribución salarial de la empresa.

- Salario promedio y su evolución histórica
- Rango salarial (máximo y mínimo) y desviación estándar
- Segmentos salariales: empleados por encima de $100K y por debajo de $50K
- Top 5 salarios más altos
- Gasto total de nómina y nómina de altos ingresos
- Brecha salarial por género
- Salario promedio por departamento y por puesto

### Parte 3 — Desempeño Departamental
Análisis de la estructura, liderazgo y crecimiento de cada departamento.

- Distribución de headcount por departamento
- Cambios de gerente históricos por departamento
- Antigüedad de los gerentes actuales
- Contrataciones recientes por departamento (1998–2002)
- Antigüedad promedio más baja por departamento

---

## Principales Hallazgos

| Indicador | Resultado |
|---|---|
| Total de empleados | 300,024 |
| Edad promedio | 43.92 años |
| Distribución de género | 59.99% H / 40.01% M |
| Antigüedad promedio | 12.92 años |
| Salario promedio | $71,964.80 |
| Brecha salarial por género | 0.09% |
| Departamento más grande | Development (61,386 emp.) |
| Departamento con mayor salario promedio | Sales ($89,005.79) |
| Departamentos con más cambios de gerente | Customer Service, Quality Management, Production (4 c/u) |

---

## Tecnologías Utilizadas

- **MySQL** — Queries SQL
- **Jupyter Notebook** — Análisis y documentación de resultados
- **LaTeX / Overleaf** — Reporte formal

---

## Autores

| Nombre | Matrícula |
|---|---|
| Diego Armando Mijares Ledezma | A01722421 |
| Daniel Eduardo Arana Bodart | A01741202 |
| Mauricio Octavio Valencia Gonzalez | A01234397 |
| David Alejandro Acuña Orozco | A00571187 |
| Diego Gutiérrez Vargas | A01285421 |
| Alfonso Elizondo Partida | A01285151 |

---

## Base de Datos

Este proyecto utiliza la base de datos de muestra `employees` de MySQL, disponible públicamente en:
[https://github.com/datacharmer/test_db](https://github.com/datacharmer/test_db)
