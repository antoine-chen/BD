/*
ANTOINE CHEN
() -> une clé primaire, @ -> une clé étrangère
artiste [(idArtiste); nom; prenom; dateNaissance; dateDeces]
label [(idLabel); nom; adresse]
album [(idAlbum); nom; annee; label@]
chanson [(idChanson); nom; album@]
realisePar [(idAlbum, idArtiste); ]
stats [(idAlbum); nombreVentes; noteMoyenne]
*/

DROP SCHEMA IF EXISTS musique CASCADE;
CREATE SCHEMA musique;

CREATE TABLE musique.artiste (
    idArtiste INT PRIMARY KEY,
    nom VARCHAR(32),
    prenom VARCHAR(32),
    dateNaissance DATE,
    dateDeces DATE
);

CREATE TABLE musique.label (
    idLabel INT PRIMARY KEY,
    nom VARCHAR(32),
    adresse TEXT
);

CREATE TABLE musique.album (
    idAlbum INT PRIMARY KEY,
    nom VARCHAR(32),
    annee INT,
    label INT,
    CONSTRAINT fk_album_label FOREIGN KEY (label) REFERENCES musique.label(idLabel)
);

CREATE TABLE musique.chanson (
    idChanson INT PRIMARY KEY,
    nom VARCHAR(32),
    album INT,
    CONSTRAINT fk_chanson_album FOREIGN KEY (album) REFERENCES musique.album(idAlbum)
);

CREATE TABLE musique.realisePar (
    idAlbum INT,
    idArtiste INT,
    PRIMARY KEY (idAlbum, idArtiste),
    CONSTRAINT fk_realisePar_album FOREIGN KEY (idAlbum) REFERENCES musique.album(idAlbum),
    CONSTRAINT fk_realisePar_artiste FOREIGN KEY (idArtiste) REFERENCES musique.artiste(idArtiste)
);

CREATE TABLE musique.stats (
    idAlbum INT PRIMARY KEY,
    nombreVentes INT,
    noteMoyenne FLOAT,
    CONSTRAINT fk_stats_album FOREIGN KEY (idAlbum) REFERENCES musique.album(idAlbum)
);

