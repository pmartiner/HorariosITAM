BEGIN;
CREATE TABLE alumnos (
    CU 	                        integer PRIMARY KEY,
    password                    text NOT NULL
);
COMMIT;

BEGIN;
CREATE TABLE materia(
    id_Mat                      text PRIMARY KEY,
    name                        text NOT NULL
    
);
COMMIT;

BEGIN;
CREATE TABLE cursado (
    CU integer REFERENCES alumnos(CU),
    id_Mat text REFERENCES materia(id_Mat)
);

BEGIN;
CREATE TABLE planEstudios(
    id_Plan			text PRIMARY KEY,
    carrera                     text NOT NULL,
    tipo			text NOT NULL
);
COMMIT;

BEGIN;
CREATE TABLE grupo(
    id_Grupo                    text NOT NULL,
    horario                     text NOT NULL,
    dias                        text NOT NULL,                        
    profesor			        text NOT NULL,
    id_Mat                      text REFERENCES materia(id_Mat),
    PRIMARY KEY(id_Grupo, id_Mat)
);
COMMIT;

BEGIN;
CREATE TABLE contiene (
    id_Plan                   text REFERENCES planEstudios(id_Plan),
    id_Mat                    text REFERENCES materia(id_Mat),
    prereq                    text[],
    optativa                   boolean,
    ponderacion            double precision NOT NULL,
    PRIMARY KEY(id_Plan, id_Mat)
);
COMMIT;


BEGIN;
CREATE TABLE estudio (
    CU                        integer REFERENCES alumnos(CU),
    id_Plan                   text REFERENCES planEstudios(id_Plan),
    PRIMARY KEY(id_Plan, CU)
);
COMMIT;
