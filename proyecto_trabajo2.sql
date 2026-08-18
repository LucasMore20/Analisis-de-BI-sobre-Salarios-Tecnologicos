-- =============================================================================
-- PROYECTO: Análisis de Empleo Tecnológico - Salarios, Capacitación y Entrevistas
-- =============================================================================

USE proyecto_trabajo;

-- Query 1: Relación entre Capacitación Mensual y Satisfacción Laboral por Puesto

WITH RelacionPuesto AS (
    SELECT 
        puesto_trabajo,
        ROUND(AVG(capacitacion_mensual_hs), 1) AS capacitacion_promedio_hs,
        ROUND(AVG(satisfaccion_laboral), 1) AS satisfaccion_promedio,
        COUNT(id_empleado) AS total_empleados
    FROM proyecto_salario
    GROUP BY puesto_trabajo
)
SELECT 
    puesto_trabajo,
    capacitacion_promedio_hs,
    satisfaccion_promedio,
    total_empleados
FROM RelacionPuesto
ORDER BY capacitacion_promedio_hs DESC;


-- Query 2: Salario Promedio por Lenguaje Primario

SELECT 
    lenguaje_primario,
    ROUND(AVG(salario_usd), 1) AS salario_promedio_usd,
    COUNT(id_empleado) AS cantidad_profesionales
FROM proyecto_salario
WHERE lenguaje_primario IS NOT NULL
GROUP BY lenguaje_primario
ORDER BY salario_promedio_usd DESC;


-- Query 3: Entrevistas necesarias para conseguir el primer empleo según Nivel Educativo

SELECT 
    puesto_trabajo,
    SUM(CASE WHEN nivel_educacion = 'Bachelors' THEN entrevistas_primer_empleo ELSE 0 END) AS bachelors,
    SUM(CASE WHEN nivel_educacion = 'Bootcamp' THEN entrevistas_primer_empleo ELSE 0 END) AS bootcamp,
    SUM(CASE WHEN nivel_educacion = 'Masters' THEN entrevistas_primer_empleo ELSE 0 END) AS masters,
    SUM(CASE WHEN nivel_educacion = 'PhD' THEN entrevistas_primer_empleo ELSE 0 END) AS phd,
    SUM(CASE WHEN nivel_educacion = 'Self-taught' THEN entrevistas_primer_empleo ELSE 0 END) AS self_taught,
    SUM(entrevistas_primer_empleo) AS total_entrevistas
FROM proyecto_salario
GROUP BY puesto_trabajo
ORDER BY total_entrevistas DESC;


-- Query 4: Indicadores Globales (KPIs)

SELECT 
    ROUND(AVG(satisfaccion_laboral), 1) AS satisfaccion_promedio_global,
    ROUND(AVG(entrevistas_primer_empleo), 1) AS promedio_entrevistas_global,
    ROUND(AVG(capacitacion_mensual_hs), 1) AS capacitacion_promedio_global
FROM proyecto_salario;


-- Query 5: Adopción de IA y Horas de uso según Puesto
SELECT 
    puesto_trabajo,
    COUNT(CASE WHEN uso_ia = TRUE THEN 1 END) AS usuarios_ia,
    ROUND(AVG(horas_uso_ia), 1proyecto_salario) AS promedio_horas_ia
FROM proyecto_salario
GROUP BY puesto_trabajo
ORDER BY promedio_horas_ia DESC;