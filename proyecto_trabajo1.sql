CREATE TABLE proyecto_salario (
    id_empleado INT PRIMARY KEY,
    residencia_empleado VARCHAR(50),
    industria VARCHAR(100),
    porcentaje_trabajo_remoto DECIMAL(5,2),
    años_experiencia VARCHAR(50),
    nivel_educacion VARCHAR(50),
    lenguaje_primario VARCHAR(50),
    puesto_trabajo VARCHAR(100),
    horas_semanales DECIMAL(5,2),
    uso_ia BOOLEAN,
    horas_uso_ia DECIMAL(5,2),
    salario_usd DECIMAL(10,2),
    bonos DECIMAL(5,2),
    satisfaccion_laboral DECIMAL(5,2),
    entrevistas_primer_empleo INT,
    capacitacion_mensual_hs DECIMAL(5,2)
    );