/*
ANTOINE 
() -> une clé primaire, @ -> une clé étrangère 
etudiant [(idetudiant); nom; prenom; sexe; dateNaissance; groupe]
enseignant [(idenseignant); nom; prenom; sexe; matiere; dept]
responsable [(idmatiere); nom; semestre; coef; responsable]
note[(idetudiant; idmatiere) dateNote; note; coef]
*/


DROP SCHEMA IF EXISTS iut CASCADE;
CREATE SCHEMA iut;

CREATE TABLE iut.etudiant (
    idetudiant INT PRIMARY KEY,
    nom VARCHAR(32),
    prenom VARCHAR(32),
    sexe VARCHAR(32), 
    dateNaissance DATE, 
    groupe VARCHAR(12)
);

CREATE TABLE iut.enseignant (
    idenseignant INT PRIMARY KEY,
    nom VARCHAR(32),
    prenom VARCHAR(32),
    sexe VARCHAR(32), 
    matiere VARCHAR(32), 
    dept VARCHAR(32)
);

CREATE TABLE iut.matiere (
    idmatiere INT PRIMARY KEY,
    nom VARCHAR(32),
    semestre INT,
    responsable INT,
    CONSTRAINT fk_matiere_enseignant FOREIGN KEY (responsable) REFERENCES iut.enseignant (idenseignant)
);

CREATE TABLE iut.notes (
    idetudiant INT,
    idmatiere INT, 
    datenote DATE,
    note FLOAT,
    coef FLOAT,
    PRIMARY KEY (idetudiant, idmatiere),
    CONSTRAINT fk_notes_etudiant FOREIGN KEY (idetudiant) REFERENCES iut.etudiant (idetudiant),
    CONSTRAINT fk_notes_matiere FOREIGN KEY (idmatiere) REFERENCES iut.matiere (idmatiere)
);
