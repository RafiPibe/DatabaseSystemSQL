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
VALUES ('S0001', '001',DATE '2007-01-01', 2,DATE '2007-01-02', 6000, '0')
INSERT INTO menyewa (kode_sewa, no_identitas, tgl_sewa, tot_film, tgl_kembali, tot_hrg, denda) 
VALUES ('S0002', '002',DATE '2007-03-01', 1,DATE '2007-01-03', 3500, '0')
INSERT INTO menyewa (kode_sewa, no_identitas, tgl_sewa, tot_film, tgl_kembali, tot_hrg, denda) 
VALUES ('S0003', '001',DATE '2007-06-01', 3,DATE '2007-01-08', 9500, '0')

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

ALTER TABLE kelompokfilm
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

-- 2. Adding new genre into the table
INSERT INTO kelompokfilm (jenis, harga_sewa)
VALUES ('Komedi', 5000);

-- 3. Adding new data into the film table
INSERT INTO film (kode_film, jenis, judul, jml_keping, jml_film)
VALUES ('K01', 'Komedi', 'Kapan Kawin', 10, 2);
INSERT INTO film (kode_film, jenis, judul, jml_keping, jml_film)
VALUES ('K02', 'Komedi', 'Takut Kawin', 6, 3);
INSERT INTO film (kode_film, jenis, judul, jml_keping, jml_film)
VALUES ('D02', 'drama', 'Ayat ayat Cinta', 8, 3);
INSERT INTO film (kode_film, jenis, judul, jml_keping, jml_film)
VALUES ('D03', 'drama', 'Tiga doa tiga Cinta', 5, 2);
INSERT INTO film (kode_film, jenis, judul, jml_keping, jml_film)
VALUES ('H02', 'horor', 'Resident Evil', 7, 4);

-- You can also insert several data at once, by using function below
INSERT INTO film(KODE_FILM,JENIS,JUDUL,JML_KEPING,JML_FILM) WITH NAMES AS (
    SELECT 'K01', 'komedi', 'Kapan Kawin', 10, 2 FROM dual UNION ALL
    SELECT 'K02', 'Komedi', 'Takut Kawin', 6, 3 FROM dual UNION ALL
    SELECT 'D02', 'drama', 'Ayat ayat Cinta', 8, 3 FROM dual UNION ALL
    SELECT 'D03', 'drama', 'Tiga doa tiga Cinta', 5, 2 FROM dual UNION ALL
    SELECT 'H02', 'horor', 'Resident Evil', 7, 4 FROM dual
)
SELECT * FROM NAMES



-- 4. Update Value by multiplying by 10
UPDATE kelompokfilm SET harga_sewa = (harga_sewa * 10);

-- 5. Select kode_film and judul that have horror or drama
SELECT kode_film, judul FROM film WHERE jenis = 'horor' OR jenis = 'drama';

-- 6. Select data on detailmenyewa that have kode_sewa S0003
SELECT kode_sewa FROM detailmenyewa WHERE kode_sewa = 'S0003'

-- 7. Select no_identitas, tanggal_sewa, tot_film of menyewa table that have a minimum number of tot_film
SELECT no_identitas, tgl_sewa, tot_film FROM menyewa
WHERE tot_film = (select min(tot_film) FROM menyewa);

-- 8. Select names and addresses of customers who returned films before 5 Jan 2007!
SELECT nama, alamat FROM customer JOIN menyewa
ON (menyewa.tgl_kembali < DATE '2007-01-05');

-- 9. Select no_identitas and judul that has the initial letter of judul S
SELECT no_identitas, film.judul FROM menyewa JOIN detailmenyewa 
ON (menyewa.kode_sewa = detailmenyewa.kode_sewa)
JOIN film ON (detailmenyewa.kode_film = film.kode_film) 
WHERE film.judul LIKE 'S%';

-- we can also use the function below
SELECT DISTINCT my.no_identitas, fm.judul
FROM menyewa my JOIN detailmenyewa dm on (my.kode_sewa)

-- 10. Select the name of the customer who rented the movie genre “drama”
SELECT customer.nama FROM customer JOIN menyewa
ON (customer.no_identitas = menyewa.no_identitas)
JOIN detailmenyewa ON (menyewa.kode_sewa = detailmenyewa.kode_sewa) JOIN film 
ON (detailmenyewa.kode_film = film.kode_film)
WHERE film.jenis = 'drama';

