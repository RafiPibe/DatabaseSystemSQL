-- SQL by Faraihan Rafi Adityawarman / 5025211074

-- creating all the tables
CREATE TABLE kelompokfilm ( 
    jenis varchar(255) NOT NULL PRIMARY KEY , 
    harga_sewa int NOT NULL 
);

CREATE TABLE film ( 
    kode_film varchar(255) NOT NULL PRIMARY KEY, 
    jenis varchar(255) NOT NULL, 
    judul varchar(255) NOT NULL, 
    jml_keping int NOT NULL, 
    jml_film int NOT NULL,
    CONSTRAINT fk_film_kelompokfilm FOREIGN KEY (jenis) REFERENCES kelompokfilm(jenis)
);

CREATE TABLE customer ( 
    no_identitas varchar(255) NOT NULL PRIMARY KEY, 
    jenis_identitas varchar(255) NOT NULL, 
    nama varchar(255) NOT NULL, 
    alamat varchar(255) NOT NULL 
);

CREATE TABLE menyewa ( 
    kode_sewa varchar(255) NOT NULL PRIMARY KEY, 
    no_identitas varchar(255) NOT NULL,
    tgl_sewa varchar(255) NOT NULL, 
    tot_film int NOT NULL, 
    tgl_kembali varchar(255) NOT NULL, 
    tot_hrg int NOT NULL, 
    denda varchar(255) NOT NULL,
    CONSTRAINT fk_menyewa_customer FOREIGN KEY (no_identitas) REFERENCES customer(no_identitas)
);

CREATE TABLE detailmenyewa (
    kode_sewa varchar(255) NOT NULL,
    kode_film varchar(255) NOT NULL, 
    CONSTRAINT fk_detailmenyewa_menyewa FOREIGN KEY (kode_sewa) REFERENCES menyewa(kode_sewa),
    CONSTRAINT fk_detailmenyewa_film FOREIGN KEY (kode_film) REFERENCES film(kode_film)
);

-- Inserting values

-- Value of kelompokfilm
INSERT INTO kelompokfilm (jenis, harga_sewa)
VALUES ('action', 3000);
INSERT INTO kelompokfilm (jenis, harga_sewa)
VALUES ('drama', 3500);
INSERT INTO kelompokfilm (jenis, harga_sewa)
VALUES ('horor', 3000);

-- Value of film
INSERT INTO film (kode_film, jenis, judul, jml_keping, jml_film)
VALUES ('A01', 'action', 'Spiderman', 2, 3);
INSERT INTO film (kode_film, jenis, judul, jml_keping, jml_film)
VALUES ('A02', 'action', 'Spiderman 2', 2, 5);
INSERT INTO film (kode_film, jenis, judul, jml_keping, jml_film)
VALUES ('D01', 'drama', 'Love Story', 2, 3);
INSERT INTO film (kode_film, jenis, judul, jml_keping, jml_film)
VALUES ('H01', 'horor', 'Evil Death', 2, 2);

-- Value of customer
INSERT INTO customer (no_identitas, jenis_identitas, nama, alamat)
VALUES ('001', 'SIM', 'Andi', 'pontianak');
INSERT INTO customer (no_identitas, jenis_identitas, nama, alamat)
VALUES ('002', 'SIM', 'Budi', 'pontianak');

-- Value of menyewa
INSERT INTO menyewa (kode_sewa, no_identitas, tgl_sewa, tot_film, tgl_kembali, tot_hrg, denda)
VALUES ('S0001', '001', '01/01/2007', 2, '02/01/2007', 6000, '0');
INSERT INTO menyewa (kode_sewa, no_identitas, tgl_sewa, tot_film, tgl_kembali, tot_hrg, denda)
VALUES ('S0002', '002', '03/01/2007', 1, '03/01/2007', 3500, '0');
INSERT INTO menyewa (kode_sewa, no_identitas, tgl_sewa, tot_film, tgl_kembali, tot_hrg, denda)
VALUES ('S0003', '001', '06/01/2007', 3, '08/01/2007', 9500, '0');

-- Value of detailmenyewa
INSERT INTO detailmenyewa (kode_sewa, kode_film)
VALUES ('S0001', 'A01');
INSERT INTO detailmenyewa (kode_sewa, kode_film)
VALUES ('S0001', 'A02');
INSERT INTO detailmenyewa (kode_sewa, kode_film)
VALUES ('S0002', 'D01');
INSERT INTO detailmenyewa (kode_sewa, kode_film)
VALUES ('S0003', 'A02');
INSERT INTO detailmenyewa (kode_sewa, kode_film)
VALUES ('S0003', 'D01');
INSERT INTO detailmenyewa (kode_sewa, kode_film)
VALUES ('S0003', 'H01');

-- Altering

-- Adding no_hp to customer table
ALTER TABLE customer
ADD no_hp varchar(255);

-- changing the attribute of jenis to varchar(20)
ALTER TABLE film
MODIFY jenis varchar(20);

-- Renaming no_hp to no_wa
ALTER TABLE customer
RENAME COLUMN no_hp to no_wa;

-- Deleting the column jenis_identitas
ALTER TABLE customer
DROP COLUMN jenis_identitas;

-- Viewing data that has more than 2 film
CREATE VIEW jml_film_moreThan2
AS SELECT * FROM film
WHERE jml_film > 2;