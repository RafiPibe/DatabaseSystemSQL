REM   Script: Sesi 1 - Perpustakaan ITS
REM   Sesi 1 - Perpustakaan ITS
CREATE TABLE ANGGOTA (  
AN_ID               INT,  
AN_NAMA             VARCHAR(30),  
AN_JURUSAN          VARCHAR(20),  
AN_NRP              VARCHAR(15),  
AN_EMAIL            VARCHAR(64),  
AN_ALAMAT           VARCHAR(50),  
AN_JENIS_KELAMIN    CHAR(1),  
AN_TGL_REGIS        DATE,  
CONSTRAINT AN_PK PRIMARY KEY (AN_ID)  
);
CREATE TABLE NOMOR_TELP ( 
NT_ID               INT, 
NT_ANGGOTA_ID       INT,  
NT_NO_TELP          VARCHAR(15),  
CONSTRAINT NT_PK PRIMARY KEY (NT_ID),  
CONSTRAINT AN_NT_FK  
    FOREIGN KEY (NT_ANGGOTA_ID) REFERENCES ANGGOTA (AN_ID)  
);
CREATE TABLE RAK_BUKU (  
RB_ID               INT,  
RB_NAMA             VARCHAR(20),  
RB_LOKASI           VARCHAR(30),  
CONSTRAINT RB_PK PRIMARY KEY (RB_ID)  
);

CREATE TABLE BUKU (  
BU_KODE_BUKU        CHAR(15),  
BU_RB_ID            INT,  
BU_JUDUL            VARCHAR(64),  
BU_PENULIS          VARCHAR(30),  
BU_PENERBIT         VARCHAR(64),  
BU_STOK             INT,  
BU_TAHUN_TERBIT     INT,  
CONSTRAINT BU_PK PRIMARY KEY (BU_KODE_BUKU),  
CONSTRAINT BU_RB_FK  
    FOREIGN KEY (BU_RB_ID) REFERENCES RAK_BUKU (RB_ID)  
);

CREATE TABLE AKSES (  
AK_ID               INT,  
AK_JENIS_AKSES      VARCHAR(200),  
CONSTRAINT AK_PK PRIMARY KEY (AK_ID)  
);

CREATE TABLE PETUGAS (  
PE_ID               INT,  
PE_AK_ID            INT,  
PE_NAMA             VARCHAR(30),  
PE_NIP              CHAR(18),  
PE_NO_TELP          VARCHAR(15),  
PE_EMAIL            VARCHAR(64),  
PE_ALAMAT           VARCHAR(50),  
PE_JENIS_KELAMIN    CHAR(1),  
CONSTRAINT PE_PK PRIMARY KEY (PE_ID),  
CONSTRAINT PE_AK_FK  
    FOREIGN KEY (PE_AK_ID) REFERENCES AKSES (AK_ID)  
);

CREATE TABLE TRANSAKSI_PEMINJAMAN (  
TP_ID               INT,  
TP_PE_ID            INT,  
TP_AN_ID            INT,  
TP_TGL_KEMBALI      DATE,  
TP_TGL_PINJAM       DATE,  
TP_DENDA            INT,  
CONSTRAINT TP_PK PRIMARY KEY (TP_ID),  
CONSTRAINT TP_PE_FK  
    FOREIGN KEY (TP_PE_ID) REFERENCES PETUGAS (PE_ID),  
CONSTRAINT TP_AN_FK  
    FOREIGN KEY (TP_AN_ID) REFERENCES ANGGOTA (AN_ID)  
);

CREATE TABLE PEMINJAMAN_BUKU (  
PB_ID               INT, 
PB_BU_KODE_BUKU     CHAR(15),  
PB_TP_ID            INT,  
CONSTRAINT PB_PK PRIMARY KEY (PB_ID),  
CONSTRAINT PB_BU_FK  
    FOREIGN KEY (PB_BU_KODE_BUKU) REFERENCES BUKU (BU_KODE_BUKU),  
CONSTRAINT PB_TP_FK  
    FOREIGN KEY (PB_TP_ID) REFERENCES TRANSAKSI_PEMINJAMAN (TP_ID)  
);

ALTER SESSION SET nls_date_format = 'RRRR-MM-DD HH24:MI:SS';

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (1, 'Raihan Gunarto', 'Teknik Industri', '422474921250001', 'raihangunarto@gmail.com', '4654 Bernhard Terrace', 'P', DATE '2022-04-30');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (3, 'Gilang Yanuar', 'Teknik Industri', 422474921250003, 'gilangyanuar@gmail.com', '09244 Aurelia River', 'P', DATE '2020-12-03');

select * from petugas;

select * from anggota;

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (4, 'Lutfan Hutapea', 'Sistem Informasi', 422474921250004, 'lutfanhutapea@gmail.com', '293 Juwita Parkway', 'P', DATE '2021-04-03');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (6, 'Oskar Waluyo', 'Biomedik', 422474921250006, 'oskarwaluyo@gmail.com', '7986 Alessandra Ramp', 'L', DATE '2021-09-07');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (7, 'Ami Febrianti', 'Teknik Elektro', 422474921250007, 'amifebrianti@gmail.com', '43449 Skye Field', 'L', DATE '2021-08-29');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (2, 'Damu Budiyanto', 'Sistem Informasi', 422474921250002, 'damubudiyanto@gmail.com', '001 Darrick Forks', 'P', DATE '2022-04-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (5, 'Agustina Anandya S.T.', 'Manajemen', 422474921250005, 'agustinaanandyas.t.@gmail.com', '1714 Mack Valley', 'P', DATE '2021-05-10');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (9, 'Bakda Wicaksono S.IP', 'Kedokteran', 422474921250009, 'bakdawicaksonos.ip@gmail.com', '4778 Mayasari Extension', 'P', DATE '2022-01-23');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (10, 'Janet Nuraini', 'Biomedik', 422474921250010, 'janetnuraini@gmail.com', '11952 Armani Radial', 'L', DATE '2021-03-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (8, 'Karsa Purwadi S.Sos', 'Teknik Mesin', 422474921250008, 'karsapurwadis.sos@gmail.com', '313 Mozelle Landing', 'L', DATE '2021-07-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (11, 'Yuni Uyainah', 'Kedokteran', 422474921250011, 'yuniuyainah@gmail.com', '61752 Suartini Mountain', 'L', DATE '2022-09-08');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (12, 'Ophelia Uyainah M.TI.', 'Manajemen', 422474921250012, 'opheliauyainahm.ti.@gmail.com', '8290 Saefullah Route', 'P', DATE '2022-03-24');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (13, 'Hilda Aryani', 'Teknik Industri', 422474921250013, 'hildaaryani@gmail.com', '888 Kelley Trafficway', 'L', DATE '2021-02-02');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (14, 'Warsita Pradana', 'Teknik Informatika', 422474921250014, 'warsitapradana@gmail.com', '50949 Santoso Loop', 'L', DATE '2022-09-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (16, 'Sherly Permata', 'Biomedik', 422474921250016, 'sherlypermata@gmail.com', '8224 Geovanni Dam', 'L', DATE '2022-03-08');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (17, 'Kurnia Uwais S.Gz', 'Kedokteran', 422474921250017, 'kurniauwaiss.gz@gmail.com', '71699 Ophelia Vista', 'P', DATE '2022-04-20');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (18, 'Irma Maharani S.Ked', 'Psikologi', 422474921250018, 'irmamaharanis.ked@gmail.com', '470 Rajata Loaf', 'L', DATE '2021-09-25');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (19, 'Yani Yulianti', 'Sistem Informasi', 422474921250019, 'yaniyulianti@gmail.com', '9795 Karlie Villages', 'P', DATE '2022-01-21');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (15, 'Hana Damayanti', 'Teknik Informatika', 422474921250015, 'hanadamayanti@gmail.com', '106 Isaias Causeway', 'P', DATE '2021-02-12');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (21, 'Suci Kuswandari', 'Psikologi', 422474921250021, 'sucikuswandari@gmail.com', '932 Rayhan Field', 'L', DATE '2021-09-25');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (20, 'Omar Lazuardi', 'Biomedik', 422474921250020, 'omarlazuardi@gmail.com', '70198 Katharina Forest', 'L', DATE '2022-07-10');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (22, 'Oni Ardiyanti', 'Kedokteran', 422474921250022, 'oniardiyanti@gmail.com', '91472 Micheal Corners', 'L', DATE '2021-09-29');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (23, 'Elma Putri', 'Psikologi', 422474921250023, 'elmaputri@gmail.com', '6508 Puspasari Summit', 'P', DATE '2021-06-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (24, 'Farah Safitri M.Farm', 'Sistem Informasi', 422474921250024, 'farahsafitrim.farm@gmail.com', '954 Mahestri Rue', 'L', DATE '2021-03-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (25, 'Artanto Waluyo', 'Teknik Elektro', 422474921250025, 'artantowaluyo@gmail.com', '7669 Augusta Estates', 'L', DATE '2021-03-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (27, 'Salwa Yuliarti S.H.', 'Psikologi', 422474921250027, 'salwayuliartis.h.@gmail.com', '937 Curtis Skyway', 'L', DATE '2021-01-29');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (26, 'Dian Hariyah', 'Psikologi', 422474921250026, 'dianhariyah@gmail.com', '550 Aqila Islands', 'P', DATE '2022-03-08');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (28, 'Balijan Nashiruddin S.Farm', 'Teknik Elektro', 422474921250028, 'balijannashiruddins.farm@gmail.com', '6707 Oktavian Junction', 'L', DATE '2022-10-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (29, 'Bagiya Faresta', 'Sistem Informasi', 422474921250029, 'bagiyafaresta@gmail.com', '198 Prabowo Park', 'L', DATE '2021-05-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (30, 'Zelaya Permata', 'Psikologi', 422474921250030, 'zelayapermata@gmail.com', '953 Winarsih Parkway', 'L', DATE '2021-12-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (31, 'Uli Melinda', 'Kedokteran', 422474921250031, 'ulimelinda@gmail.com', '192 Kale Village', 'L', DATE '2021-10-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (32, 'Genta Astuti', 'Teknik Informatika', 422474921250032, 'gentaastuti@gmail.com', '43904 Rico Grove', 'L', DATE '2022-03-07');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (33, 'Salwa Susanti', 'Manajemen', 422474921250033, 'salwasusanti@gmail.com', '6409 Steve Shores', 'L', DATE '2022-01-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (34, 'Mursinin Yulianto', 'Teknik Elektro', 422474921250034, 'mursininyulianto@gmail.com', '30036 Benedict Heights', 'P', DATE '2021-03-04');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (36, 'Mahmud Hermawan M.Farm', 'Psikologi', 422474921250036, 'mahmudhermawanm.farm@gmail.com', '67938 Lailasari Curve', 'P', DATE '2021-11-29');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (37, 'Rita Purwanti', 'Teknik Mesin', 422474921250037, 'ritapurwanti@gmail.com', '041 Nashiruddin Shoal', 'L', DATE '2022-02-04');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (38, 'Vicky Leilani', 'Teknik Mesin', 422474921250038, 'vickyleilani@gmail.com', '16510 Kara Summit', 'L', DATE '2021-07-11');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (39, 'Ade Ardana', 'Teknik Industri', 422474921250039, 'adeardana@gmail.com', '78047 Elinore Route', 'L', DATE '2022-08-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (40, 'Adinata Sihombing', 'Teknik Elektro', 422474921250040, 'adinatasihombing@gmail.com', '9714 Pradana Rapids', 'P', DATE '2021-07-24');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (41, 'Digdaya Perdana', 'Teknik Mesin', 422474921250041, 'digdayaperdana@gmail.com', '5256 Megantara Islands', 'P', DATE '2022-10-15');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (42, 'Aisyah Kuswandari', 'Biomedik', 422474921250042, 'aisyahkuswandari@gmail.com', '932 Isabella River', 'P', DATE '2022-02-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (43, 'Jarwi Saefullah', 'Teknik Industri', 422474921250043, 'jarwisaefullah@gmail.com', '541 Nurlaela Court', 'L', DATE '2022-08-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (44, 'Daru Napitupulu', 'Teknik Elektro', 422474921250044, 'darunapitupulu@gmail.com', '32260 Florian Ramp', 'P', DATE '2021-09-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (45, 'Harjo Purwadi', 'Teknik Industri', 422474921250045, 'harjopurwadi@gmail.com', '65846 Sheldon Squares', 'P', DATE '2022-06-03');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (46, 'Paiman Uwais', 'Teknik Elektro', 422474921250046, 'paimanuwais@gmail.com', '8633 Jamel Cove', 'P', DATE '2022-08-09');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (47, 'Rosa Mustika S.T.', 'Teknik Informatika', 422474921250047, 'rosamustikas.t.@gmail.com', '34833 Namaga Square', 'P', DATE '2020-12-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (48, 'Wani Saraswati', 'Teknik Mesin', 422474921250048, 'wanisaraswati@gmail.com', '75709 Utami Forges', 'L', DATE '2020-11-25');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (35, 'Humaira Purnawati', 'Manajemen', 422474921250035, 'humairapurnawati@gmail.com', '7396 Waluyo Centers', 'L', DATE '2022-03-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (50, 'Garda Pratama', 'Psikologi', 422474921250050, 'gardapratama@gmail.com', '259 Sitorus Mission', 'L', DATE '2021-08-24');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (49, 'Kania Juwita', 'Manajemen', 422474921250049, 'kaniajuwita@gmail.com', '680 Salahudin Park', 'L', DATE '2022-09-30');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (51, 'Patricia Pertiwi S.Pt', 'Sistem Informasi', 422474921250051, 'patriciapertiwis.pt@gmail.com', '72575 Rickey Locks', 'L', DATE '2022-05-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (53, 'Karsa Gunarto', 'Sistem Informasi', 422474921250053, 'karsagunarto@gmail.com', '5418 Nababan Mills', 'L', DATE '2021-05-04');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (54, 'Lasmanto Saputra', 'Kedokteran', 422474921250054, 'lasmantosaputra@gmail.com', '77448 Tarihoran Burgs', 'L', DATE '2021-08-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (52, 'Soleh Abiputra', 'Teknik Elektro', 422474921250052, 'solehabiputra@gmail.com', '63329 Kusuma Camp', 'P', DATE '2020-12-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (55, 'Putri Juwita S.Farm', 'Teknik Mesin', 422474921250055, 'putrijuwitas.farm@gmail.com', '1210 Preston Turnpike', 'P', DATE '2022-04-21');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (56, 'Indira Mulyani', 'Teknik Mesin', 422474921250056, 'indiramulyani@gmail.com', '5236 Sudiati Crossroad', 'P', DATE '2021-04-29');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (57, 'Septi Juwita', 'Manajemen', 422474921250057, 'septijuwita@gmail.com', '25774 Aubrey Curve', 'P', DATE '2021-06-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (58, 'Hasna Maryati', 'Teknik Informatika', 422474921250058, 'hasnamaryati@gmail.com', '9313 Fredrick Green', 'P', DATE '2020-12-15');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (60, 'Kani Farida', 'Psikologi', 422474921250060, 'kanifarida@gmail.com', '419 Shirley Locks', 'L', DATE '2022-11-07');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (59, 'Cemplunk Samosir', 'Psikologi', 422474921250059, 'cemplunksamosir@gmail.com', '0172 Candida Mission', 'L', DATE '2021-07-16');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (61, 'Lalita Melani', 'Biomedik', 422474921250061, 'lalitamelani@gmail.com', '4565 Serenity Common', 'L', DATE '2022-02-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (63, 'Lintang Usamah', 'Sistem Informasi', 422474921250063, 'lintangusamah@gmail.com', '706 Yulianti Forge', 'P', DATE '2021-10-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (64, 'Anggun Melinda S.E.I', 'Teknik Informatika', 422474921250064, 'anggunmelindas.e.i@gmail.com', '91049 Haley Plains', 'L', DATE '2022-03-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (65, 'Kasiyah Puspita', 'Teknik Informatika', 422474921250065, 'kasiyahpuspita@gmail.com', '2977 Willie Glen', 'P', DATE '2022-03-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (62, 'Almira Febrianti', 'Teknik Mesin', 422474921250062, 'almirafebrianti@gmail.com', '06681 Russel Common', 'P', DATE '2021-03-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (66, 'Eman Ardianto', 'Teknik Elektro', 422474921250066, 'emanardianto@gmail.com', '1742 Brionna Lakes', 'P', DATE '2022-02-15');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (67, 'Latif Aswandi S.Pd', 'Teknik Elektro', 422474921250067, 'latifaswandis.pd@gmail.com', '7110 Wulandari Square', 'L', DATE '2022-07-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (68, 'Sabrina Pertiwi', 'Teknik Elektro', 422474921250068, 'sabrinapertiwi@gmail.com', '324 Darien Tunnel', 'P', DATE '2021-03-31');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (70, 'Sartika Widiastuti', 'Biomedik', 422474921250070, 'sartikawidiastuti@gmail.com', '5031 Isidro Tunnel', 'L', DATE '2022-10-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (69, 'Carub Nanda', 'Teknik Mesin', 422474921250069, 'carubnanda@gmail.com', '21615 Kale Shore', 'P', DATE '2022-09-09');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (71, 'Vivi Anandya', 'Manajemen', 422474921250071, 'vivianandya@gmail.com', '814 Widiastuti Lodge', 'P', DATE '2021-10-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (72, 'Dian Wastuti', 'Teknik Elektro', 422474921250072, 'dianwastuti@gmail.com', '2025 Kusuma Coves', 'L', DATE '2021-09-30');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (73, 'Kemba Setiawan', 'Sistem Informasi', 422474921250073, 'kembasetiawan@gmail.com', '19081 Najmudin Falls', 'L', DATE '2021-08-15');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (74, 'Suci Pertiwi', 'Teknik Industri', 422474921250074, 'sucipertiwi@gmail.com', '4419 Johanna Ranch', 'L', DATE '2021-05-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (75, 'Ilsa Rahimah', 'Teknik Industri', 422474921250075, 'ilsarahimah@gmail.com', '741 Saptono Lock', 'L', DATE '2021-03-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (76, 'Tri Aryani', 'Psikologi', 422474921250076, 'triaryani@gmail.com', '721 Darby Forest', 'L', DATE '2022-01-09');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (77, 'Rosalina Yuniar M.TI.', 'Teknik Elektro', 422474921250077, 'rosalinayuniarm.ti.@gmail.com', '334 Sedrick Knoll', 'L', DATE '2022-02-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (78, 'Anggun Suryatmi', 'Psikologi', 422474921250078, 'anggunsuryatmi@gmail.com', '7825 Usada Fall', 'P', DATE '2022-01-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (79, 'Irwan Mansur S.Ked', 'Sistem Informasi', 422474921250079, 'irwanmansurs.ked@gmail.com', '75994 Anjani Estate', 'P', DATE '2021-07-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (80, 'Edi Hutasoit', 'Kedokteran', 422474921250080, 'edihutasoit@gmail.com', '1798 Pudjiastuti Route', 'P', DATE '2021-07-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (81, 'Reza Adhitama S.Kom', 'Biomedik', 422474921250081, 'rezaadhitamas.kom@gmail.com', '7709 Margaretta Summit', 'L', DATE '2022-05-23');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (83, 'Ghaliyati Harini', 'Teknik Elektro', 422474921250083, 'ghaliyatiharini@gmail.com', '8755 Soledad Pine', 'L', DATE '2022-04-30');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (84, 'Jefri Mahendra', 'Kedokteran', 422474921250084, 'jefrimahendra@gmail.com', '545 Kiana Fords', 'P', DATE '2022-11-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (82, 'Nyoman Saefullah', 'Psikologi', 422474921250082, 'nyomansaefullah@gmail.com', '3065 Emmy Stravenue', 'L', DATE '2021-12-31');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (87, 'Yusuf Prasetyo S.T.', 'Kedokteran', 422474921250087, 'yusufprasetyos.t.@gmail.com', '91272 Cory Corner', 'P', DATE '2021-01-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (86, 'Banawi Sihotang', 'Manajemen', 422474921250086, 'banawisihotang@gmail.com', '38374 Widodo Villages', 'P', DATE '2021-12-04');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (85, 'Harsaya Oktovian', 'Kedokteran', 422474921250085, 'harsayaoktovian@gmail.com', '5073 Aubree Loaf', 'L', DATE '2021-08-21');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (88, 'Jamal Wasita S.Pt', 'Teknik Informatika', 422474921250088, 'jamalwasitas.pt@gmail.com', '978 Wastuti Mountains', 'L', DATE '2021-12-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (89, 'Eli Widiastuti', 'Manajemen', 422474921250089, 'eliwidiastuti@gmail.com', '1038 Abdullah Station', 'L', DATE '2022-08-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (90, 'Gamanto Sinaga', 'Teknik Elektro', 422474921250090, 'gamantosinaga@gmail.com', '21939 Giovanni Dale', 'P', DATE '2021-03-29');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (92, 'Diana Rahayu S.Farm', 'Sistem Informasi', 422474921250092, 'dianarahayus.farm@gmail.com', '620 Nathania Village', 'L', DATE '2021-12-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (91, 'Amalia Febrianti', 'Teknik Industri', 422474921250091, 'amaliafebrianti@gmail.com', '9185 Demetris Ramp', 'L', DATE '2021-01-15');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (93, 'Jessica Melinda', 'Teknik Industri', 422474921250093, 'jessicamelinda@gmail.com', '0636 Josh Summit', 'P', DATE '2021-10-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (94, 'Imam Suwarno', 'Teknik Mesin', 422474921250094, 'imamsuwarno@gmail.com', '40330 Megantara Overpass', 'P', DATE '2022-11-08');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (95, 'Eka Azzahra S.Pt', 'Sistem Informasi', 422474921250095, 'ekaazzahras.pt@gmail.com', '446 Maya Gateway', 'L', DATE '2022-10-31');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (97, 'Daryani Purwadi S.Kom', 'Kedokteran', 422474921250097, 'daryanipurwadis.kom@gmail.com', '084 Tarihoran Shoals', 'P', DATE '2022-11-17');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (96, 'Kariman Dirgantara', 'Kedokteran', 422474921250096, 'karimandirgantara@gmail.com', '8863 Carlie Gateway', 'P', DATE '2021-08-16');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (98, 'Tri Maharani', 'Teknik Industri', 422474921250098, 'trimaharani@gmail.com', '74202 Dolores Camp', 'P', DATE '2020-12-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (99, 'Daruna Nugroho', 'Sistem Informasi', 422474921250099, 'darunanugroho@gmail.com', '5262 Waskita Coves', 'L', DATE '2021-10-04');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (100, 'Gasti Laksmiwati', 'Biomedik', 422474921250100, 'gastilaksmiwati@gmail.com', '1951 Abimanyu Square', 'P', DATE '2022-10-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (101, 'Padma Wahyuni', 'Biomedik', 422474921250101, 'padmawahyuni@gmail.com', '355 Bagaskara Prairie', 'P', DATE '2022-09-11');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (103, 'Ganesha Widiastuti', 'Teknik Industri', 422474921250103, 'ganeshawidiastuti@gmail.com', '1573 Melani Manors', 'P', DATE '2022-07-20');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (104, 'Fathonah Hastuti', 'Teknik Industri', 422474921250104, 'fathonahhastuti@gmail.com', '459 Sharon Court', 'L', DATE '2021-09-23');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (102, 'Latif Prasasta', 'Psikologi', 422474921250102, 'latifprasasta@gmail.com', '87382 Danny Forks', 'P', DATE '2021-03-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (105, 'Alika Suryatmi M.M.', 'Teknik Elektro', 422474921250105, 'alikasuryatmim.m.@gmail.com', '1833 Halim Ports', 'L', DATE '2022-06-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (106, 'Damar Yanuar M.Farm', 'Teknik Industri', 422474921250106, 'damaryanuarm.farm@gmail.com', '653 Widiastuti Crossroad', 'L', DATE '2021-10-16');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (107, 'Tina Zahrah M.M.', 'Teknik Industri', 422474921250107, 'tinazahrahm.m.@gmail.com', '7868 Emmanuelle Forges', 'L', DATE '2022-02-21');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (108, 'Prasetya Setiawan', 'Teknik Elektro', 422474921250108, 'prasetyasetiawan@gmail.com', '28265 Usamah Plaza', 'P', DATE '2022-01-24');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (109, 'Febi Nurlaela', 'Teknik Elektro', 422474921250109, 'febinurlaela@gmail.com', '981 Carrie Plain', 'L', DATE '2021-09-07');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (110, 'Bakidin Prakasa', 'Kedokteran', 422474921250110, 'bakidinprakasa@gmail.com', '7749 Angeline Glens', 'P', DATE '2022-02-08');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (111, 'Fitria Anjani', 'Sistem Informasi', 422474921250111, 'fitriaanjani@gmail.com', '3262 Malika Roads', 'P', DATE '2021-11-09');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (112, 'Dalima Febrianti', 'Manajemen', 422474921250112, 'dalimafebrianti@gmail.com', '139 Aurelia Ville', 'L', DATE '2022-02-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (113, 'Ria Nuraini', 'Kedokteran', 422474921250113, 'rianuraini@gmail.com', '58424 Zetta Rue', 'P', DATE '2022-05-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (114, 'Paramita Aurelia S.T.', 'Teknik Informatika', 422474921250114, 'paramitaaurelias.t.@gmail.com', '903 Nathania Points', 'L', DATE '2022-05-23');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (115, 'Syahrini Jelita', 'Manajemen', 422474921250115, 'syahrinijelita@gmail.com', '485 Otilia Radial', 'P', DATE '2021-10-21');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (116, 'Gaiman Siregar', 'Kedokteran', 422474921250116, 'gaimansiregar@gmail.com', '48843 Leda Ports', 'L', DATE '2022-08-12');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (117, 'Jane Sudiati', 'Kedokteran', 422474921250117, 'janesudiati@gmail.com', '7284 Tess Mill', 'L', DATE '2022-08-04');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (118, 'Linda Putri', 'Manajemen', 422474921250118, 'lindaputri@gmail.com', '17623 Purnama Forge', 'L', DATE '2022-11-17');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (119, 'Darsirah Marpaung', 'Teknik Elektro', 422474921250119, 'darsirahmarpaung@gmail.com', '1269 Fay Locks', 'P', DATE '2022-07-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (120, 'Humaira Nathania M.Farm', 'Sistem Informasi', 422474921250120, 'humairanathaniam.farm@gmail.com', '20636 Marbun Lodge', 'P', DATE '2022-04-29');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (121, 'Tami Puspita', 'Biomedik', 422474921250121, 'tamipuspita@gmail.com', '577 Marshall Ridges', 'P', DATE '2021-08-03');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (122, 'Sakti Winarno', 'Kedokteran', 422474921250122, 'saktiwinarno@gmail.com', '3042 Vladimir Cliffs', 'L', DATE '2021-10-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (123, 'Malik Antoni', 'Sistem Informasi', 422474921250123, 'malikantoni@gmail.com', '255 Alysa Run', 'P', DATE '2020-11-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (124, 'Sintia Uyainah M.Ak', 'Biomedik', 422474921250124, 'sintiauyainahm.ak@gmail.com', '0284 Carleton Underpass', 'L', DATE '2022-06-07');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (125, 'Kenari Pradana', 'Sistem Informasi', 422474921250125, 'kenaripradana@gmail.com', '776 Loy Crossing', 'P', DATE '2021-10-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (126, 'Jaya Natsir', 'Manajemen', 422474921250126, 'jayanatsir@gmail.com', '196 Napitupulu Mountains', 'L', DATE '2022-02-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (127, 'Indira Puspasari', 'Teknik Industri', 422474921250127, 'indirapuspasari@gmail.com', '0948 Oktavian Way', 'P', DATE '2021-07-25');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (128, 'Adhiarja Yanuar', 'Sistem Informasi', 422474921250128, 'adhiarjayanuar@gmail.com', '230 Haryanti Meadow', 'L', DATE '2022-06-30');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (129, 'Cornelia Harini', 'Teknik Mesin', 422474921250129, 'corneliaharini@gmail.com', '42729 Suryatmi Points', 'L', DATE '2021-12-10');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (130, 'Bagya Setiawan S.Farm', 'Teknik Industri', 422474921250130, 'bagyasetiawans.farm@gmail.com', '90450 Allie Parks', 'P', DATE '2021-07-10');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (131, 'Qori Saraswati S.Ked', 'Kedokteran', 422474921250131, 'qorisaraswatis.ked@gmail.com', '837 Lee Path', 'P', DATE '2022-04-13');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (132, 'Rafi Prasasta', 'Teknik Mesin', 422474921250132, 'rafiprasasta@gmail.com', '267 Mahardika Mission', 'L', DATE '2021-07-09');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (133, 'Ami Susanti', 'Teknik Elektro', 422474921250133, 'amisusanti@gmail.com', '525 Agustian Forest', 'L', DATE '2022-11-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (134, 'Nur Puspasari S.T.', 'Biomedik', 422474921250134, 'nurpuspasaris.t.@gmail.com', '6144 Iswahyudi Haven', 'L', DATE '2021-12-31');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (137, 'Tri Hidayat', 'Psikologi', 422474921250137, 'trihidayat@gmail.com', '6460 Kaitlyn Ports', 'L', DATE '2021-05-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (135, 'Oliva Yuliarti', 'Psikologi', 422474921250135, 'olivayuliarti@gmail.com', '537 Alisa Mount', 'P', DATE '2021-09-08');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (136, 'Irwan Utama', 'Psikologi', 422474921250136, 'irwanutama@gmail.com', '162 Kasandra Locks', 'L', DATE '2021-01-19');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (138, 'Anggun Uyainah', 'Teknik Informatika', 422474921250138, 'anggunuyainah@gmail.com', '92541 Eduardo Valleys', 'L', DATE '2021-10-03');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (139, 'Titin Mustika', 'Teknik Elektro', 422474921250139, 'titinmustika@gmail.com', '26523 Febian Fields', 'L', DATE '2021-12-13');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (140, 'Ophelia Amanta', 'Kedokteran', 422474921250140, 'opheliaamanta@gmail.com', '4323 Jarrett Vista', 'L', DATE '2021-11-11');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (141, 'Parman Abimanyu', 'Manajemen', 422474921250141, 'parmanabimanyu@gmail.com', '44303 Tamba Fords', 'L', DATE '2021-12-29');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (143, 'Wulandari Nuraini', 'Teknik Informatika', 422474921250143, 'wulandarinuraini@gmail.com', '288 Freddy Expressway', 'P', DATE '2021-07-23');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (142, 'Paulin Mardhiyah', 'Teknik Industri', 422474921250142, 'paulinmardhiyah@gmail.com', '32321 Kuswoyo Cove', 'L', DATE '2021-03-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (144, 'Kiandra Rahimah', 'Kedokteran', 422474921250144, 'kiandrarahimah@gmail.com', '92414 Rosetta Lights', 'L', DATE '2021-06-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (145, 'Jessica Melani S.Psi', 'Psikologi', 422474921250145, 'jessicamelanis.psi@gmail.com', '1412 Santoso Station', 'L', DATE '2021-02-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (146, 'Kawaca Wibowo', 'Teknik Industri', 422474921250146, 'kawacawibowo@gmail.com', '411 Ramadhani Square', 'P', DATE '2021-07-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (147, 'Irfan Ahmad M.Kom.', 'Teknik Industri', 422474921250147, 'irfanahmadm.kom.@gmail.com', '1071 Padmasari Islands', 'P', DATE '2022-10-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (148, 'Mila Lailasari', 'Manajemen', 422474921250148, 'milalailasari@gmail.com', '84130 Puspita Squares', 'L', DATE '2020-12-20');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (150, 'Gada Ardianto', 'Kedokteran', 422474921250150, 'gadaardianto@gmail.com', '530 Tad Station', 'L', DATE '2021-11-10');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (151, 'Hardana Darmawan', 'Teknik Elektro', 422474921250151, 'hardanadarmawan@gmail.com', '5936 Perdana Row', 'P', DATE '2022-01-13');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (152, 'Rendy Arifin', 'Teknik Elektro', 422474921250152, 'rendyarifin@gmail.com', '7169 Jacquelyn Springs', 'P', DATE '2022-10-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (153, 'Jinawi Hutasoit', 'Manajemen', 422474921250153, 'jinawihutasoit@gmail.com', '6011 Handoko Hill', 'P', DATE '2022-01-07');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (154, 'Lukman Saragih', 'Teknik Mesin', 422474921250154, 'lukmansaragih@gmail.com', '1494 Prasetyo Avenue', 'P', DATE '2021-12-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (155, 'Wani Hariyah S.IP', 'Teknik Industri', 422474921250155, 'wanihariyahs.ip@gmail.com', '605 Fujiati Hill', 'P', DATE '2022-10-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (149, 'Kamidin Tarihoran', 'Teknik Informatika', 422474921250149, 'kamidintarihoran@gmail.com', '61580 Rahayu Coves', 'P', DATE '2021-07-23');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (157, 'Bakiadi Satria', 'Psikologi', 422474921250157, 'bakiadisatria@gmail.com', '38288 Winarsih Pike', 'L', DATE '2022-11-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (156, 'Banawi Mahardika', 'Biomedik', 422474921250156, 'banawimahardika@gmail.com', '529 Hasanah Course', 'L', DATE '2021-08-29');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (158, 'Pangestu Mahardika', 'Biomedik', 422474921250158, 'pangestumahardika@gmail.com', '88629 Halimah Unions', 'L', DATE '2021-04-20');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (159, 'Jamal Sitompul', 'Teknik Informatika', 422474921250159, 'jamalsitompul@gmail.com', '32834 Vickie Run', 'L', DATE '2022-05-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (160, 'Ika Nuraini', 'Sistem Informasi', 422474921250160, 'ikanuraini@gmail.com', '73050 Ambrose Village', 'L', DATE '2022-08-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (161, 'Saka Tamba S.Psi', 'Manajemen', 422474921250161, 'sakatambas.psi@gmail.com', '613 Lestari Isle', 'L', DATE '2021-04-11');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (162, 'Vivi Anjani', 'Teknik Mesin', 422474921250162, 'vivianjani@gmail.com', '15585 Hassan Streets', 'L', DATE '2021-08-24');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (163, 'Okto Saragih', 'Sistem Informasi', 422474921250163, 'oktosaragih@gmail.com', '52903 Darwin Squares', 'L', DATE '2021-12-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (164, 'Linda Mardhiyah S.Kom', 'Psikologi', 422474921250164, 'lindamardhiyahs.kom@gmail.com', '392 Megantara Ranch', 'P', DATE '2021-07-24');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (165, 'Wardaya Ahmad', 'Kedokteran', 422474921250165, 'wardayaahmad@gmail.com', '586 Arianna Squares', 'P', DATE '2021-04-19');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (166, 'Sabri Nugroho', 'Biomedik', 422474921250166, 'sabrinugroho@gmail.com', '7110 Yulianti Viaduct', 'P', DATE '2022-07-07');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (167, 'Galak Santoso', 'Teknik Industri', 422474921250167, 'galaksantoso@gmail.com', '88690 Mansur Streets', 'L', DATE '2021-08-15');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (168, 'Janet Kusmawati', 'Manajemen', 422474921250168, 'janetkusmawati@gmail.com', '17781 Nainggolan Field', 'L', DATE '2021-10-02');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (170, 'Ilyas Napitupulu', 'Kedokteran', 422474921250170, 'ilyasnapitupulu@gmail.com', '53864 Febrianti Mount', 'P', DATE '2021-02-10');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (171, 'Kamila Maheswari', 'Teknik Mesin', 422474921250171, 'kamilamaheswari@gmail.com', '10065 Kadin Place', 'P', DATE '2021-02-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (172, 'Bakianto Putra', 'Psikologi', 422474921250172, 'bakiantoputra@gmail.com', '1057 Jelita Valley', 'P', DATE '2022-05-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (169, 'Bakidin Syahreza', 'Biomedik', 422474921250169, 'bakidinsyahreza@gmail.com', '60826 Geraldine Drive', 'L', DATE '2022-02-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (173, 'Nabila Yolanda S.Gz', 'Teknik Elektro', 422474921250173, 'nabilayolandas.gz@gmail.com', '10262 Yoshiko Flats', 'P', DATE '2021-05-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (174, 'Ilsa Maharani S.Pd', 'Teknik Industri', 422474921250174, 'ilsamaharanis.pd@gmail.com', '142 Alexie Road', 'L', DATE '2021-04-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (175, 'Artanto Sabian', 'Teknik Industri', 422474921250175, 'artantosabian@gmail.com', '0664 Melinda Trafficway', 'L', DATE '2022-04-21');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (176, 'Rahman Prasetyo', 'Teknik Elektro', 422474921250176, 'rahmanprasetyo@gmail.com', '40999 Kendrick Mountains', 'L', DATE '2021-09-13');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (177, 'Putri Wijayanti S.H.', 'Kedokteran', 422474921250177, 'putriwijayantis.h.@gmail.com', '42599 Phoebe Fork', 'L', DATE '2022-07-30');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (178, 'Luwar Utama S.Pt', 'Sistem Informasi', 422474921250178, 'luwarutamas.pt@gmail.com', '165 Anjani Cliff', 'L', DATE '2022-05-24');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (179, 'Kurnia Habibi M.Kom.', 'Teknik Industri', 422474921250179, 'kurniahabibim.kom.@gmail.com', '70448 Purnama Ramp', 'P', DATE '2022-09-19');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (180, 'Mursita Airlangga', 'Teknik Industri', 422474921250180, 'mursitaairlangga@gmail.com', '0291 Pradana Mountains', 'P', DATE '2021-10-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (181, 'Kuncara Handoko', 'Teknik Informatika', 422474921250181, 'kuncarahandoko@gmail.com', '5520 Kieran Creek', 'P', DATE '2021-01-16');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (182, 'Ifa Andriani', 'Psikologi', 422474921250182, 'ifaandriani@gmail.com', '0689 Ardiyanti Parks', 'L', DATE '2021-12-23');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (183, 'Kala Natsir', 'Teknik Elektro', 422474921250183, 'kalanatsir@gmail.com', '271 Manullang Prairie', 'P', DATE '2021-02-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (184, 'Banara Sudrajat', 'Psikologi', 422474921250184, 'banarasudrajat@gmail.com', '700 Claudie Trafficway', 'L', DATE '2022-05-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (185, 'Eko Hutagalung', 'Biomedik', 422474921250185, 'ekohutagalung@gmail.com', '5663 Santoso Knoll', 'P', DATE '2022-02-03');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (186, 'Lili Usada', 'Sistem Informasi', 422474921250186, 'liliusada@gmail.com', '18012 Wastuti Course', 'L', DATE '2022-02-09');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (187, 'Argono Jailani', 'Kedokteran', 422474921250187, 'argonojailani@gmail.com', '157 Perdana Spurs', 'P', DATE '2022-01-11');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (188, 'Raina Anandya', 'Psikologi', 422474921250188, 'rainaanandya@gmail.com', '771 Holly Groves', 'L', DATE '2021-06-17');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (189, 'Elon Hidayat', 'Manajemen', 422474921250189, 'elonhidayat@gmail.com', '780 Patsy Corners', 'P', DATE '2022-05-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (190, 'Parman Sirait', 'Biomedik', 422474921250190, 'parmansirait@gmail.com', '8760 Puspasari Lakes', 'L', DATE '2021-05-31');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (191, 'Elisa Aryanti', 'Teknik Mesin', 422474921250191, 'elisaaryanti@gmail.com', '64725 Prastuti Shores', 'L', DATE '2022-04-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (192, 'Abyasa Antoni', 'Sistem Informasi', 422474921250192, 'abyasaantoni@gmail.com', '16875 Anjani Track', 'P', DATE '2022-11-08');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (194, 'Ganda Yudhistira', 'Psikologi', 422474921250194, 'gandayudhistira@gmail.com', '31280 Mahestri Roads', 'L', DATE '2021-04-11');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (193, 'Lutfan Situmorang S.Sos', 'Teknik Informatika', 422474921250193, 'lutfansitumorangs.sos@gmail.com', '13045 Shanny Squares', 'P', DATE '2021-09-02');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (195, 'Uchita Hartati', 'Psikologi', 422474921250195, 'uchitahartati@gmail.com', '0267 Consuelo Squares', 'P', DATE '2022-09-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (196, 'Himawan Uwais', 'Sistem Informasi', 422474921250196, 'himawanuwais@gmail.com', '742 Purnawati Green', 'P', DATE '2021-09-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (197, 'Ganjaran Megantara S.Farm', 'Manajemen', 422474921250197, 'ganjaranmegantaras.farm@gmail.com', '55863 Lailasari Ports', 'P', DATE '2021-02-13');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (198, 'Amalia Nuraini S.I.Kom', 'Manajemen', 422474921250198, 'amalianurainis.i.kom@gmail.com', '01582 Anggraini Points', 'P', DATE '2022-02-12');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (199, 'Ayu Aurelia', 'Psikologi', 422474921250199, 'ayuaurelia@gmail.com', '694 Toby Dam', 'P', DATE '2022-05-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (200, 'Galiono Oktavian', 'Kedokteran', 422474921250200, 'galionooktavian@gmail.com', '999 Vivienne Highway', 'P', DATE '2022-01-03');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (201, 'Okto Wibowo', 'Psikologi', 422474921250201, 'oktowibowo@gmail.com', '2738 Lazuardi Lodge', 'P', DATE '2022-09-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (202, 'Ditya Andini', 'Teknik Industri', 422474921250202, 'dityaandini@gmail.com', '610 Fabian Ports', 'P', DATE '2022-11-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (204, 'Uda Satria', 'Sistem Informasi', 422474921250204, 'udasatria@gmail.com', '67938 Febrianti Center', 'L', DATE '2021-09-15');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (203, 'Mitra Prasetya', 'Teknik Informatika', 422474921250203, 'mitraprasetya@gmail.com', '95323 Selina Forges', 'L', DATE '2022-09-02');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (205, 'Wawan Latupono', 'Teknik Industri', 422474921250205, 'wawanlatupono@gmail.com', '79877 Hasanah Harbor', 'L', DATE '2021-11-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (206, 'Ade Mahendra', 'Kedokteran', 422474921250206, 'ademahendra@gmail.com', '696 Eleanora Circle', 'L', DATE '2020-12-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (207, 'Balidin Nugraha', 'Psikologi', 422474921250207, 'balidinnugraha@gmail.com', '12775 Lesmana Cape', 'L', DATE '2021-07-10');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (208, 'Padmi Rachmawati', 'Biomedik', 422474921250208, 'padmirachmawati@gmail.com', '944 Christy Greens', 'P', DATE '2021-08-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (209, 'Ganjaran Putra', 'Psikologi', 422474921250209, 'ganjaranputra@gmail.com', '641 Jacinto Hills', 'L', DATE '2020-12-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (210, 'Vinsen Zulkarnain', 'Teknik Elektro', 422474921250210, 'vinsenzulkarnain@gmail.com', '95003 Dana Rapid', 'L', DATE '2021-01-13');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (211, 'Zulaikha Salsabilla', 'Manajemen', 422474921250211, 'zulaikhasalsabilla@gmail.com', '0239 Mahardika Divide', 'L', DATE '2022-10-31');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (212, 'Titi Hastuti', 'Teknik Elektro', 422474921250212, 'titihastuti@gmail.com', '3398 Heaven Spur', 'P', DATE '2022-07-11');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (213, 'Ajimin Rajasa', 'Teknik Elektro', 422474921250213, 'ajiminrajasa@gmail.com', '292 Sitorus Ville', 'P', DATE '2020-12-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (214, 'Nasim Himawan', 'Psikologi', 422474921250214, 'nasimhimawan@gmail.com', '73961 Reece Junction', 'L', DATE '2022-08-02');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (215, 'Uli Salsabilla', 'Manajemen', 422474921250215, 'ulisalsabilla@gmail.com', '357 Justus Square', 'L', DATE '2021-12-16');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (216, 'Febrina Suryatmi M.Kom.', 'Biomedik', 422474921250216, 'febrinasuryatmim.kom.@gmail.com', '68163 Fujiati Brooks', 'P', DATE '2021-08-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (217, 'Wirda Astuti', 'Teknik Elektro', 422474921250217, 'wirdaastuti@gmail.com', '6477 Hanna Lodge', 'P', DATE '2020-11-21');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (218, 'Gada Faresta', 'Biomedik', 422474921250218, 'gadafaresta@gmail.com', '64194 Doris Corners', 'L', DATE '2021-10-13');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (219, 'Asmuni Nugraha', 'Teknik Industri', 422474921250219, 'asmuninugraha@gmail.com', '46395 Simanjuntak Skyway', 'P', DATE '2021-03-21');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (220, 'Elma Novitasari', 'Sistem Informasi', 422474921250220, 'elmanovitasari@gmail.com', '491 Fritz View', 'L', DATE '2022-02-08');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (221, 'Kunthara Purwadi', 'Teknik Industri', 422474921250221, 'kuntharapurwadi@gmail.com', '387 Phyllis Cape', 'L', DATE '2021-12-09');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (222, 'Clara Suryatmi S.Sos', 'Biomedik', 422474921250222, 'clarasuryatmis.sos@gmail.com', '31316 Wibowo Fort', 'L', DATE '2021-03-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (223, 'Mariadi Kuswoyo M.TI.', 'Teknik Mesin', 422474921250223, 'mariadikuswoyom.ti.@gmail.com', '3566 Widodo Spring', 'P', DATE '2022-10-11');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (224, 'Emas Ramadan S.Farm', 'Manajemen', 422474921250224, 'emasramadans.farm@gmail.com', '68148 Habibi Creek', 'P', DATE '2021-04-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (225, 'Prima Waluyo', 'Manajemen', 422474921250225, 'primawaluyo@gmail.com', '37841 Jason Park', 'P', DATE '2021-02-15');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (226, 'Oman Prabowo S.H.', 'Teknik Industri', 422474921250226, 'omanprabowos.h.@gmail.com', '402 Wahyuni Flats', 'P', DATE '2022-09-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (227, 'Adikara Bagaskara S.Gz', 'Manajemen', 422474921250227, 'adikarabagaskaras.gz@gmail.com', '730 Lailasari Orchard', 'L', DATE '2022-02-10');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (228, 'Bakiman Maryadi M.M.', 'Manajemen', 422474921250228, 'bakimanmaryadim.m.@gmail.com', '5015 Prastuti Station', 'P', DATE '2020-11-21');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (229, 'Bambang Sihombing', 'Manajemen', 422474921250229, 'bambangsihombing@gmail.com', '548 Wahyudin Turnpike', 'P', DATE '2021-03-13');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (230, 'Ayu Mandasari', 'Biomedik', 422474921250230, 'ayumandasari@gmail.com', '033 Sirait Lodge', 'P', DATE '2021-01-09');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (231, 'Gamani Rayhan M.Farm', 'Teknik Industri', 422474921250231, 'gamanirayhanm.farm@gmail.com', '8253 Marpaung Crest', 'L', DATE '2022-03-30');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (232, 'Capa Satria S.IP', 'Psikologi', 422474921250232, 'capasatrias.ip@gmail.com', '765 Alamsyah Mountains', 'L', DATE '2022-04-17');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (233, 'Gandi Bagaskara', 'Teknik Mesin', 422474921250233, 'gandibagaskara@gmail.com', '97813 Mayasari Ville', 'P', DATE '2022-09-12');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (234, 'Yani Purwanti', 'Teknik Mesin', 422474921250234, 'yanipurwanti@gmail.com', '8614 Prastuti Turnpike', 'L', DATE '2021-06-17');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (235, 'Fathonah Ardiyanti', 'Sistem Informasi', 422474921250235, 'fathonahardiyanti@gmail.com', '491 Leatha Drives', 'L', DATE '2021-07-20');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (236, 'Opan Natsir S.E.', 'Teknik Industri', 422474921250236, 'opannatsirs.e.@gmail.com', '180 Silas Forest', 'L', DATE '2022-05-12');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (237, 'Bagya Samosir M.Ak', 'Psikologi', 422474921250237, 'bagyasamosirm.ak@gmail.com', '5639 Stephania Forks', 'L', DATE '2021-12-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (238, 'Irwan Budiman', 'Teknik Informatika', 422474921250238, 'irwanbudiman@gmail.com', '31293 Lucile Freeway', 'P', DATE '2022-07-25');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (239, 'Karen Maheswari', 'Teknik Industri', 422474921250239, 'karenmaheswari@gmail.com', '6841 Antonina Road', 'P', DATE '2022-08-17');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (240, 'Leo Nababan', 'Psikologi', 422474921250240, 'leonababan@gmail.com', '82808 Barbara Isle', 'L', DATE '2021-08-24');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (242, 'Adhiarja Sudrajat', 'Teknik Mesin', 422474921250242, 'adhiarjasudrajat@gmail.com', '84625 Henry Locks', 'L', DATE '2022-11-04');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (241, 'Ian Hermawan', 'Manajemen', 422474921250241, 'ianhermawan@gmail.com', '580 Mikayla Courts', 'P', DATE '2021-06-08');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (243, 'Retno Nuraini', 'Biomedik', 422474921250243, 'retnonuraini@gmail.com', '66809 Purwanti Fords', 'P', DATE '2022-02-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (244, 'Farah Anggraini M.M.', 'Teknik Informatika', 422474921250244, 'farahanggrainim.m.@gmail.com', '92730 Herbert Stream', 'L', DATE '2022-11-16');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (245, 'Digdaya Arifin', 'Manajemen', 422474921250245, 'digdayaarifin@gmail.com', '19786 Salsabilla Brook', 'P', DATE '2021-02-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (246, 'Clara Usada', 'Kedokteran', 422474921250246, 'clarausada@gmail.com', '922 Rahmawati Track', 'P', DATE '2021-10-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (247, 'Michelle Nathania', 'Psikologi', 422474921250247, 'michellenathania@gmail.com', '2753 Ramon Hills', 'L', DATE '2021-12-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (248, 'Alambana Siregar', 'Teknik Industri', 422474921250248, 'alambanasiregar@gmail.com', '81148 Riyanti Locks', 'P', DATE '2022-07-15');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (249, 'Ciaobella Hartati', 'Psikologi', 422474921250249, 'ciaobellahartati@gmail.com', '3478 Kusmawati Pine', 'P', DATE '2022-01-03');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (250, 'Diana Anandya', 'Teknik Industri', 422474921250250, 'dianaanandya@gmail.com', '1436 Mandasari Mountains', 'P', DATE '2021-12-07');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (251, 'Eva Mulyani', 'Teknik Informatika', 422474921250251, 'evamulyani@gmail.com', '8978 Wibisono Avenue', 'P', DATE '2021-10-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (252, 'Cinta Novitasari', 'Sistem Informasi', 422474921250252, 'cintanovitasari@gmail.com', '144 Felicita Crest', 'L', DATE '2022-06-04');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (253, 'Yunita Farida', 'Teknik Elektro', 422474921250253, 'yunitafarida@gmail.com', '3863 Lesmana Summit', 'L', DATE '2020-12-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (254, 'Silvia Mandasari', 'Teknik Mesin', 422474921250254, 'silviamandasari@gmail.com', '644 Harini Ranch', 'P', DATE '2021-05-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (255, 'Tina Purnama', 'Manajemen', 422474921250255, 'tinapurnama@gmail.com', '9341 Darojat Cliff', 'P', DATE '2021-09-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (256, 'Mila Haryanti', 'Teknik Informatika', 422474921250256, 'milaharyanti@gmail.com', '2614 Samosir Club', 'P', DATE '2022-09-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (257, 'Rosa Damayanti', 'Teknik Elektro', 422474921250257, 'rosadamayanti@gmail.com', '0286 Jacky Garden', 'L', DATE '2022-01-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (258, 'Putri Nasyiah', 'Kedokteran', 422474921250258, 'putrinasyiah@gmail.com', '909 Brooke Ranch', 'L', DATE '2022-11-03');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (259, 'Maya Yuliarti', 'Biomedik', 422474921250259, 'mayayuliarti@gmail.com', '527 Laura Vista', 'P', DATE '2022-05-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (260, 'Arsipatra Saputra', 'Teknik Industri', 422474921250260, 'arsipatrasaputra@gmail.com', '17568 Niko Cliffs', 'L', DATE '2021-01-31');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (261, 'Elon Gunawan', 'Teknik Elektro', 422474921250261, 'elongunawan@gmail.com', '1538 Elias Mews', 'L', DATE '2021-01-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (262, 'Cakrabirawa Budiyanto S.Pt', 'Biomedik', 422474921250262, 'cakrabirawabudiyantos.pt@gmail.com', '213 Tito Isle', 'P', DATE '2022-05-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (263, 'Gawati Yulianti', 'Manajemen', 422474921250263, 'gawatiyulianti@gmail.com', '32900 Ernie Inlet', 'L', DATE '2022-06-20');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (264, 'Galih Sihotang S.E.I', 'Psikologi', 422474921250264, 'galihsihotangs.e.i@gmail.com', '7791 Kaylah Falls', 'L', DATE '2022-08-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (265, 'Siti Aryanti', 'Psikologi', 422474921250265, 'sitiaryanti@gmail.com', '4582 Bethel Mews', 'L', DATE '2020-12-17');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (266, 'Kirana Suartini', 'Manajemen', 422474921250266, 'kiranasuartini@gmail.com', '48009 Franco Landing', 'L', DATE '2021-01-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (268, 'Ophelia Novitasari', 'Kedokteran', 422474921250268, 'ophelianovitasari@gmail.com', '31868 Skye Ports', 'P', DATE '2021-06-03');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (267, 'Eka Natsir', 'Kedokteran', 422474921250267, 'ekanatsir@gmail.com', '56376 Raina Ford', 'P', DATE '2021-02-01');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (269, 'Atma Manullang', 'Kedokteran', 422474921250269, 'atmamanullang@gmail.com', '166 Yvette Forest', 'L', DATE '2021-11-29');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (271, 'Bajragin Damanik', 'Teknik Elektro', 422474921250271, 'bajragindamanik@gmail.com', '1148 Ardianto Crossroad', 'P', DATE '2020-12-23');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (272, 'Aswani Alamsyah', 'Teknik Industri', 422474921250272, 'aswanialamsyah@gmail.com', '737 Hutapea Ranch', 'L', DATE '2021-09-25');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (270, 'Hendri Mansur', 'Biomedik', 422474921250270, 'hendrimansur@gmail.com', '259 Ray Plaza', 'L', DATE '2022-02-19');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (273, 'Tomi Yulianto S.Pt', 'Sistem Informasi', 422474921250273, 'tomiyuliantos.pt@gmail.com', '61413 Salma Key', 'P', DATE '2022-09-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (275, 'Naradi Irfandi', 'Sistem Informasi', 422474921250275, 'naradiirfandi@gmail.com', '5565 Timmothy Loop', 'L', DATE '2021-11-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (274, 'Sakura Laksmiwati S.Gz', 'Sistem Informasi', 422474921250274, 'sakuralaksmiwatis.gz@gmail.com', '1145 Tyrique Mills', 'P', DATE '2020-12-06');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (276, 'Ulya Agustina', 'Sistem Informasi', 422474921250276, 'ulyaagustina@gmail.com', '9362 Lera Ports', 'P', DATE '2021-03-26');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (277, 'Uda Herlambang', 'Teknik Mesin', 422474921250277, 'udaherlambang@gmail.com', '127 Price Locks', 'P', DATE '2022-08-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (278, 'Ganesha Azzahra', 'Biomedik', 422474921250278, 'ganeshaazzahra@gmail.com', '2131 Caitlyn Corner', 'L', DATE '2020-11-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (279, 'Darmanto Salahudin M.Kom.', 'Kedokteran', 422474921250279, 'darmantosalahudinm.kom.@gmail.com', '236 Nurlaela Ports', 'L', DATE '2020-12-08');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (280, 'Damu Pangestu', 'Biomedik', 422474921250280, 'damupangestu@gmail.com', '29633 Samara Port', 'L', DATE '2022-02-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (281, 'Oni Afifah M.Farm', 'Psikologi', 422474921250281, 'oniafifahm.farm@gmail.com', '795 Herlambang Cove', 'L', DATE '2021-06-19');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (282, 'Ganesha Wijayanti', 'Manajemen', 422474921250282, 'ganeshawijayanti@gmail.com', '0147 Suartini Glen', 'P', DATE '2021-02-07');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (283, 'Asmuni Sudrajat S.I.Kom', 'Teknik Industri', 422474921250283, 'asmunisudrajats.i.kom@gmail.com', '9140 Elmore Heights', 'P', DATE '2021-01-28');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (284, 'Warji Kurniawan', 'Teknik Industri', 422474921250284, 'warjikurniawan@gmail.com', '0704 Genesis Road', 'P', DATE '2022-02-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (285, 'Safira Wijayanti', 'Teknik Industri', 422474921250285, 'safirawijayanti@gmail.com', '113 Widodo Extension', 'P', DATE '2022-06-05');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (287, 'Wulan Azzahra S.IP', 'Teknik Elektro', 422474921250287, 'wulanazzahras.ip@gmail.com', '821 Reinhold Brook', 'P', DATE '2021-09-02');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (288, 'Rini Kuswandari', 'Kedokteran', 422474921250288, 'rinikuswandari@gmail.com', '920 Peggie Shoals', 'L', DATE '2021-12-12');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (286, 'Linda Mustika S.Pd', 'Manajemen', 422474921250286, 'lindamustikas.pd@gmail.com', '031 Tracy Fork', 'P', DATE '2022-08-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (289, 'Tomi Purnawarman', 'Biomedik', 422474921250289, 'tomipurnawarman@gmail.com', '72285 Handayani Estate', 'L', DATE '2021-08-24');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (290, 'Ani Rachmawati M.M.', 'Teknik Industri', 422474921250290, 'anirachmawatim.m.@gmail.com', '41596 Nolan Forges', 'L', DATE '2022-07-14');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (291, 'Juli Mustika', 'Manajemen', 422474921250291, 'julimustika@gmail.com', '04189 Ardana Shore', 'L', DATE '2022-02-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (292, 'Irma Melani', 'Kedokteran', 422474921250292, 'irmamelani@gmail.com', '3008 Hardiansyah Crest', 'L', DATE '2021-10-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (293, 'Kalim Yudhistira', 'Biomedik', 422474921250293, 'kalimyudhistira@gmail.com', '17845 Airlangga Throughway', 'L', DATE '2021-07-27');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (294, 'Emil Budiyanto', 'Teknik Mesin', 422474921250294, 'emilbudiyanto@gmail.com', '66499 Yuniar Streets', 'L', DATE '2021-08-04');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (295, 'Eman Yudhistira', 'Kedokteran', 422474921250295, 'emanyudhistira@gmail.com', '0904 Jada Courts', 'P', DATE '2021-06-12');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (296, 'Halima Mardhiyah', 'Teknik Informatika', 422474921250296, 'halimamardhiyah@gmail.com', '76228 Hastuti Trafficway', 'P', DATE '2021-08-15');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (297, 'Akarsana Irawan', 'Psikologi', 422474921250297, 'akarsanairawan@gmail.com', '81588 Kody Inlet', 'P', DATE '2021-10-18');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (299, 'Kasiran Iswahyudi', 'Biomedik', 422474921250299, 'kasiraniswahyudi@gmail.com', '065 Tamba Knolls', 'P', DATE '2021-08-22');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (298, 'Rachel Andini', 'Teknik Industri', 422474921250298, 'rachelandini@gmail.com', '69757 Oktaviani Orchard', 'P', DATE '2022-03-09');

INSERT INTO Anggota (an_id, an_nama, an_jurusan, an_nrp, an_email, an_alamat, an_jenis_kelamin, an_tgl_regis) VALUES (300, 'Alika Aryani', 'Teknik Informatika', 422474921250300, 'alikaaryani@gmail.com', '198 Padmasari Center', 'P', DATE '2021-06-28');

select count(*) from anggota;

select * from nomor_telp;

select * from anggota;

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (1, 1, '+628816623979');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (3, 3, '+628379045071');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (4, 4, '+628887665145');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (2, 2, '+628736605251');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (7, 7, '+628035424853');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (6, 6, '+628211677346');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (5, 5, '+628849428739');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (8, 8, '+628550217929');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (10, 10, '+628258477845');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (9, 9, '+628060125219');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (11, 11, '+628564933325');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (12, 12, '+628741774974');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (13, 13, '+628177365326');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (14, 14, '+628951996287');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (15, 15, '+628888662850');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (16, 16, '+628120707091');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (17, 17, '+628653813036');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (18, 18, '+628193371702');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (19, 19, '+628124036379');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (20, 20, '+628125517645');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (21, 21, '+628134133450');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (23, 23, '+628606616884');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (24, 24, '+628807185203');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (22, 22, '+628639854429');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (25, 25, '+628921192952');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (26, 26, '+628214713174');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (27, 27, '+628200400127');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (28, 28, '+628981542993');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (29, 29, '+628085805189');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (30, 30, '+628077610490');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (31, 31, '+628216140170');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (32, 32, '+628895678457');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (33, 33, '+628016225005');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (34, 34, '+628054664744');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (35, 35, '+628088855274');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (36, 36, '+628047913488');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (37, 37, '+628960579702');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (38, 38, '+628881776284');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (39, 39, '+628436261286');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (40, 40, '+628901525987');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (41, 41, '+628765530017');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (42, 42, '+628430666285');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (43, 43, '+628705131910');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (44, 44, '+628508460380');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (45, 45, '+628368022560');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (46, 46, '+628038849506');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (48, 48, '+628760189825');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (47, 47, '+628100252881');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (49, 49, '+628813163718');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (50, 50, '+628362497051');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (51, 51, '+628669750725');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (52, 52, '+628780415254');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (53, 53, '+628597680734');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (54, 54, '+628802622299');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (55, 55, '+628839662067');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (56, 56, '+628031384991');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (57, 57, '+628066693053');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (58, 58, '+628136251289');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (59, 59, '+628975095292');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (60, 60, '+628139972504');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (61, 61, '+628871226924');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (62, 62, '+628546738775');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (63, 63, '+628010911535');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (64, 64, '+628175544418');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (65, 65, '+628261979621');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (66, 66, '+628467041137');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (67, 67, '+628462759618');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (68, 68, '+628591460099');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (69, 69, '+628715966998');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (70, 70, '+628532303980');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (71, 71, '+628481079630');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (72, 72, '+628098360660');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (73, 73, '+628289788730');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (74, 74, '+628678536952');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (75, 75, '+628570808146');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (76, 76, '+628879974037');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (77, 77, '+628685284704');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (78, 78, '+628627555098');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (79, 79, '+628970074392');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (80, 80, '+628131891483');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (81, 81, '+628196050178');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (82, 82, '+628349290139');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (83, 83, '+628421380790');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (84, 84, '+628964978486');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (85, 85, '+628333954865');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (86, 86, '+628753270695');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (87, 87, '+628733997000');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (88, 88, '+628043845291');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (89, 89, '+628126266400');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (90, 90, '+628953733402');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (91, 91, '+628698115639');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (92, 92, '+628949953200');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (93, 93, '+628356205294');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (94, 94, '+628492438683');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (95, 95, '+628501138394');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (96, 96, '+628020596334');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (97, 97, '+628174664202');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (98, 98, '+628442584314');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (99, 99, '+628194020442');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (100, 100, '+628931171508');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (101, 101, '+628146237296');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (102, 102, '+628475823357');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (103, 103, '+628129131643');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (104, 104, '+628188550029');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (105, 105, '+628428619490');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (106, 106, '+628085333002');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (107, 107, '+628381683336');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (108, 108, '+628042804346');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (109, 109, '+628500399512');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (110, 110, '+628067805329');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (111, 111, '+628397765228');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (112, 112, '+628532065643');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (113, 113, '+628344935616');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (114, 114, '+628301411225');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (115, 115, '+628231784424');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (116, 116, '+628900251488');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (117, 117, '+628718918546');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (118, 118, '+628588026278');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (119, 119, '+628831569831');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (120, 120, '+628975822452');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (121, 121, '+628613863542');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (122, 122, '+628064779567');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (123, 123, '+628452854342');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (124, 124, '+628289955828');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (125, 125, '+628473765326');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (126, 126, '+628607756789');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (127, 127, '+628057132351');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (128, 128, '+628845532606');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (129, 129, '+628326436257');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (130, 130, '+628114553494');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (131, 131, '+628183405500');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (132, 132, '+628214402244');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (133, 133, '+628633670848');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (134, 134, '+628911957032');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (135, 135, '+628704387721');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (136, 136, '+628473190813');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (137, 137, '+628607167684');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (138, 138, '+628139926994');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (139, 139, '+628749347178');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (140, 140, '+628486138431');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (141, 141, '+628579458063');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (142, 142, '+628933344567');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (143, 143, '+628599314550');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (144, 144, '+628998645684');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (145, 145, '+628073727739');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (146, 146, '+628293578941');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (147, 147, '+628674791577');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (148, 148, '+628758535071');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (149, 149, '+628892630273');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (150, 150, '+628726388599');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (151, 151, '+628166015158');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (152, 152, '+628509064369');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (153, 153, '+628765467593');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (154, 154, '+628897398225');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (155, 155, '+628133918972');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (156, 156, '+628874514605');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (157, 157, '+628262250610');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (158, 158, '+628757570759');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (159, 159, '+628953816136');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (160, 160, '+628182259029');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (161, 161, '+628076661409');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (162, 162, '+628332707159');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (163, 163, '+628600735459');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (164, 164, '+628694797798');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (165, 165, '+628813240676');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (166, 166, '+628432489690');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (167, 167, '+628152411971');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (168, 168, '+628097024082');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (169, 169, '+628143773804');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (170, 170, '+628260130873');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (171, 171, '+628770225321');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (172, 172, '+628102223732');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (173, 173, '+628618580223');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (174, 174, '+628930814712');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (175, 175, '+628515904559');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (176, 176, '+628984198680');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (177, 177, '+628155511349');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (178, 178, '+628059823194');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (179, 179, '+628285899878');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (180, 180, '+628456700034');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (181, 181, '+628130057419');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (182, 182, '+628594983582');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (183, 183, '+628584004499');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (184, 184, '+628929162252');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (185, 185, '+628783028921');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (186, 186, '+628630465727');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (187, 187, '+628967295603');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (188, 188, '+628660113675');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (189, 189, '+628007187345');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (190, 190, '+628025940221');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (191, 191, '+628174794575');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (192, 192, '+628067493400');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (193, 193, '+628359663929');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (194, 194, '+628181252161');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (195, 195, '+628593221264');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (196, 196, '+628171145239');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (197, 197, '+628047625125');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (198, 198, '+628345555194');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (199, 199, '+628793606220');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (200, 200, '+628385928626');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (201, 201, '+628017515893');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (202, 202, '+628896719224');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (203, 203, '+628470734103');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (204, 204, '+628974822714');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (205, 205, '+628713395924');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (206, 206, '+628592183283');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (207, 207, '+628292789534');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (208, 208, '+628128576794');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (209, 209, '+628673052265');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (210, 210, '+628381072051');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (211, 211, '+628532970096');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (212, 212, '+628429886341');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (213, 213, '+628482571672');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (214, 214, '+628986475457');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (215, 215, '+628180910134');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (216, 216, '+628679772874');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (217, 217, '+628725765280');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (218, 218, '+628344593067');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (219, 219, '+628026733824');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (220, 220, '+628130054680');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (221, 221, '+628691412859');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (224, 224, '+628651004256');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (222, 222, '+628039142307');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (223, 223, '+628646822024');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (225, 225, '+628571811519');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (226, 226, '+628921812404');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (227, 227, '+628237933737');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (228, 228, '+628884488587');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (229, 229, '+628286386409');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (230, 230, '+628558719194');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (231, 231, '+628492370881');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (232, 232, '+628772072150');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (233, 233, '+628930671836');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (234, 234, '+628591168390');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (235, 235, '+628433441318');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (236, 236, '+628161465481');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (237, 237, '+628413320023');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (238, 238, '+628449668007');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (239, 239, '+628152388488');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (240, 240, '+628323885823');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (241, 241, '+628670222608');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (242, 242, '+628140590018');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (243, 243, '+628311235781');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (244, 244, '+628667948297');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (245, 245, '+628108706826');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (246, 246, '+628541341944');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (247, 247, '+628285569829');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (248, 248, '+628365593239');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (249, 249, '+628460394458');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (250, 250, '+628654373774');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (251, 251, '+628957680066');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (252, 252, '+628490119820');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (253, 253, '+628221573125');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (254, 254, '+628825785759');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (255, 255, '+628718702200');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (256, 256, '+628097124004');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (257, 257, '+628436908063');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (258, 258, '+628855640371');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (259, 259, '+628531340083');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (260, 260, '+628837292477');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (261, 261, '+628468811232');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (262, 262, '+628513966519');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (263, 263, '+628944674658');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (264, 264, '+628344620028');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (267, 267, '+628201375057');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (265, 265, '+628863450652');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (266, 266, '+628987355200');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (268, 268, '+628548136157');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (269, 269, '+628743024446');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (270, 270, '+628233815530');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (271, 271, '+628216339276');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (272, 272, '+628386839087');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (273, 273, '+628959192320');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (274, 274, '+628014238534');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (275, 275, '+628882929292');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (276, 276, '+628946807883');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (277, 277, '+628113718472');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (278, 278, '+628906718512');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (279, 279, '+628226858628');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (280, 280, '+628882459208');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (281, 281, '+628800492704');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (282, 282, '+628901169553');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (283, 283, '+628615465622');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (284, 284, '+628854546126');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (285, 285, '+628784071883');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (286, 286, '+628038738669');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (288, 288, '+628173506521');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (287, 287, '+628676169360');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (289, 289, '+628051687761');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (290, 290, '+628656947221');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (291, 291, '+628010768327');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (292, 292, '+628642552392');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (293, 293, '+628024399797');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (294, 294, '+628917704372');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (295, 295, '+628234333671');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (296, 296, '+628094332497');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (297, 297, '+628534038659');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (298, 298, '+628488144354');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (299, 299, '+628942350988');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (300, 300, '+628956686138');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (301, 73, '+628172814710');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (302, 244, '+628602248315');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (303, 97, '+628552242464');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (304, 216, '+628564633446');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (305, 96, '+628192326295');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (306, 283, '+628962080764');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (307, 116, '+628598623187');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (308, 222, '+628749589083');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (309, 194, '+628266667793');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (310, 109, '+628767988825');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (312, 108, '+628211497926');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (313, 8, '+628965436095');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (311, 182, '+628510748717');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (314, 11, '+628213972066');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (316, 125, '+628826699057');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (315, 51, '+628186603750');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (317, 124, '+628346992205');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (318, 158, '+628967121655');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (319, 256, '+628173318110');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (320, 182, '+628287030633');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (321, 121, '+628407000430');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (323, 148, '+628258268749');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (322, 127, '+628607262585');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (324, 30, '+628349618203');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (325, 147, '+628346386901');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (327, 293, '+628704020369');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (328, 288, '+628061165303');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (329, 73, '+628218944577');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (330, 234, '+628307834933');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (331, 54, '+628901676075');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (332, 100, '+628346034119');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (333, 188, '+628009277152');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (334, 131, '+628809833762');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (335, 51, '+628376282166');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (326, 293, '+628102898164');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (336, 1, '+628324229908');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (337, 75, '+628495075086');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (338, 249, '+628179527453');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (339, 148, '+628374535094');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (340, 87, '+628160542708');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (341, 34, '+628508126089');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (342, 14, '+628986785310');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (343, 222, '+628229214079');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (344, 75, '+628229108855');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (345, 104, '+628827558898');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (346, 140, '+628538341212');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (347, 132, '+628513764013');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (348, 26, '+628600528877');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (349, 300, '+628510969565');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (350, 106, '+628845691614');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (351, 20, '+628296920848');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (353, 93, '+628207037746');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (352, 151, '+628732265966');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (354, 234, '+628319674698');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (355, 293, '+628894636889');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (357, 269, '+628028376041');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (356, 9, '+628137213652');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (358, 56, '+628178092900');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (359, 104, '+628136529682');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (360, 273, '+628333086942');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (361, 33, '+628918255243');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (362, 252, '+628675601475');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (363, 244, '+628505756601');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (364, 54, '+628287722762');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (365, 111, '+628880457206');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (366, 224, '+628006576893');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (367, 164, '+628999523134');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (368, 196, '+628953198155');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (369, 172, '+628031882844');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (370, 153, '+628328826974');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (371, 69, '+628520158709');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (372, 73, '+628485139866');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (373, 42, '+628129431264');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (374, 135, '+628105425258');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (375, 17, '+628630754780');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (376, 280, '+628267645863');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (377, 148, '+628905106344');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (378, 151, '+628837831612');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (379, 193, '+628206115041');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (380, 214, '+628193976424');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (381, 63, '+628367372448');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (382, 93, '+628483410329');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (383, 64, '+628913586242');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (384, 235, '+628887096069');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (385, 87, '+628482357989');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (386, 241, '+628605231355');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (387, 248, '+628503991203');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (388, 108, '+628200210274');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (389, 140, '+628016212739');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (390, 234, '+628245817088');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (391, 165, '+628709739784');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (392, 285, '+628187511518');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (393, 248, '+628218532919');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (394, 151, '+628479598124');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (395, 163, '+628008134852');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (396, 241, '+628517306301');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (397, 299, '+628851048936');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (398, 235, '+628241129608');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (399, 183, '+628861917346');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (400, 268, '+628604582901');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (401, 145, '+628731210833');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (402, 42, '+628906481145');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (403, 193, '+628504337474');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (404, 178, '+628372072241');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (405, 234, '+628722781866');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (406, 216, '+628409826238');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (407, 70, '+628680496177');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (408, 46, '+628377608736');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (409, 161, '+628566534398');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (410, 187, '+628005591789');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (411, 272, '+628141073525');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (412, 45, '+628351142289');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (413, 115, '+628678370919');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (414, 232, '+628646337842');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (415, 148, '+628195886898');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (416, 270, '+628982276387');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (417, 117, '+628709185848');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (418, 202, '+628447335029');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (419, 87, '+628634108578');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (420, 60, '+628539864640');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (421, 247, '+628883310447');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (422, 32, '+628219290932');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (423, 113, '+628281377620');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (424, 38, '+628822020850');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (425, 105, '+628240938216');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (426, 267, '+628382371868');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (427, 205, '+628427315243');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (428, 208, '+628539235141');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (429, 268, '+628581914362');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (430, 83, '+628663770763');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (431, 254, '+628330358138');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (432, 43, '+628775821793');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (433, 15, '+628761504721');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (434, 168, '+628850518385');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (435, 1, '+628031768667');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (436, 294, '+628360140951');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (437, 189, '+628748667748');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (438, 81, '+628175722076');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (439, 202, '+628246277059');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (440, 73, '+628410573215');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (441, 61, '+628060324765');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (442, 29, '+628723515820');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (443, 167, '+628908639256');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (444, 59, '+628256958834');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (445, 148, '+628756570609');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (446, 157, '+628140055198');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (447, 143, '+628923102372');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (448, 75, '+628502486412');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (449, 273, '+628857292786');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (450, 91, '+628691771735');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (451, 169, '+628449426385');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (452, 270, '+628294332482');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (453, 251, '+628173801125');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (454, 136, '+628662655689');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (455, 295, '+628001005423');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (456, 17, '+628120091968');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (457, 191, '+628874430318');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (458, 141, '+628115915505');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (460, 125, '+628330366819');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (459, 69, '+628126230759');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (461, 92, '+628374502237');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (462, 131, '+628653309263');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (463, 290, '+628431294371');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (464, 62, '+628394143334');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (465, 38, '+628823799775');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (466, 21, '+628078193837');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (467, 196, '+628562583557');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (468, 8, '+628549607460');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (469, 149, '+628414440428');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (470, 244, '+628197865370');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (471, 27, '+628862849837');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (472, 206, '+628199669780');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (473, 190, '+628679341906');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (474, 188, '+628137040909');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (475, 300, '+628165837854');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (476, 38, '+628415594647');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (477, 229, '+628531756351');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (478, 53, '+628558572597');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (479, 251, '+628138735549');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (480, 68, '+628232646150');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (481, 227, '+628647849313');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (482, 9, '+628343362617');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (483, 69, '+628749328151');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (484, 137, '+628215907769');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (486, 177, '+628880862521');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (487, 183, '+628042980327');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (488, 61, '+628283041987');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (489, 281, '+628908058557');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (490, 233, '+628936198444');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (491, 89, '+628699883827');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (492, 110, '+628752912543');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (493, 268, '+628765772078');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (494, 27, '+628307279721');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (495, 281, '+628552282877');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (496, 52, '+628154576552');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (497, 47, '+628382894057');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (498, 254, '+628568801675');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (499, 24, '+628798631448');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (500, 288, '+628307123938');

INSERT INTO Nomor_Telp (nt_id, nt_anggota_id, nt_no_telp) VALUES (485, 72, '+628584507910');

select count(*) from nomor_telp;

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (1, 'Sosial', 'Rak nomor 1 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (3, 'Sejarah', 'Rak nomor 3 barat');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (4, 'Teknologi', 'Rak nomor 5 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (2, 'Teknologi', 'Rak nomor 4 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (7, 'Sosial', 'Rak nomor 2 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (5, 'Sejarah', 'Rak nomor 4 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (6, 'Bahasa', 'Rak nomor 3 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (8, 'Agama', 'Rak nomor 2 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (10, 'Sosial', 'Rak nomor 2 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (9, 'Bahasa', 'Rak nomor 5 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (11, 'Pelajaran', 'Rak nomor 1 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (13, 'Sejarah', 'Rak nomor 4 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (12, 'Agama', 'Rak nomor 3 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (14, 'Sejarah', 'Rak nomor 2 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (15, 'Sejarah', 'Rak nomor 2 barat');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (16, 'Sejarah', 'Rak nomor 1 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (17, 'Pelajaran', 'Rak nomor 2 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (18, 'Teknologi', 'Rak nomor 3 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (19, 'Teknologi', 'Rak nomor 2 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (20, 'Fiksi', 'Rak nomor 3 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (21, 'Pelajaran', 'Rak nomor 5 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (22, 'Bahasa', 'Rak nomor 1 barat');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (23, 'Sosial', 'Rak nomor 5 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (24, 'Bahasa', 'Rak nomor 5 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (25, 'Sosial', 'Rak nomor 3 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (26, 'Bahasa', 'Rak nomor 3 barat');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (27, 'Pelajaran', 'Rak nomor 4 barat');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (28, 'Agama', 'Rak nomor 4 barat');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (29, 'Pelajaran', 'Rak nomor 3 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (30, 'Bahasa', 'Rak nomor 2 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (31, 'Pelajaran', 'Rak nomor 4 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (32, 'Sejarah', 'Rak nomor 4 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (34, 'Pelajaran', 'Rak nomor 1 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (33, 'Teknologi', 'Rak nomor 2 barat');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (35, 'Teknologi', 'Rak nomor 1 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (36, 'Sosial', 'Rak nomor 1 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (37, 'Pelajaran', 'Rak nomor 5 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (38, 'Fiksi', 'Rak nomor 1 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (39, 'Sejarah', 'Rak nomor 2 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (40, 'Sejarah', 'Rak nomor 5 barat');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (42, 'Sosial', 'Rak nomor 4 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (41, 'Agama', 'Rak nomor 2 selatan');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (43, 'Bahasa', 'Rak nomor 3 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (44, 'Sejarah', 'Rak nomor 3 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (46, 'Pelajaran', 'Rak nomor 3 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (45, 'Agama', 'Rak nomor 5 barat');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (47, 'Sejarah', 'Rak nomor 3 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (48, 'Bahasa', 'Rak nomor 5 timur');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (49, 'Agama', 'Rak nomor 1 utara');

INSERT INTO Rak_Buku (rb_id, rb_nama, rb_lokasi) VALUES (50, 'Bahasa', 'Rak nomor 1 timur');

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766001, 13, 'Future Brand Orchestrator', 'Maryadi Marpaung', 'Bukunesia', 13, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766100, 10, 'Principal Intranet Architect', 'Abyasa Nugraha M.Pd', 'Bintang Media', 1, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766101, 2, 'Lead Research Coordinator', 'Karsana Budiman', 'Quanta', 2, 2004);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766102, 34, 'National Tactics Manager', 'Jumadi Najmudin', 'Metagram', 6, 2000);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766103, 36, 'Global Mobility Liaison', 'Latif Oktovian M.Kom.', 'Kata Depan', 5, 2010);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766104, 40, 'National Branding Manager', 'Irma Mulyani', 'Bukunesia', 9, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766105, 31, 'International Factors Technician', 'Warsita Ardana', 'Mizan', 2, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766106, 18, 'Dynamic Division Specialist', 'Sasha Padmasari', 'Falcon', 13, 2014);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766107, 25, 'Human Applications Orchestrator', 'Winda Hasanah', 'Quanta', 13, 2008);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766108, 6, 'Global Infrastructure Strategist', 'Chandra Mustofa M.M.', 'Haru', 8, 2012);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766109, 49, 'Product Web Executive', 'Safina Rahimah M.TI.', 'Gramedia', 1, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766110, 43, 'Customer Implementation Strategist', 'Fathonah Usada', 'Inari', 9, 2006);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766111, 17, 'Internal Operations Specialist', 'Ciaobella Sudiati', 'Inari', 8, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766112, 25, 'Investor Data Orchestrator', 'Ayu Anggraini', 'Twigora', 9, 2014);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766113, 26, 'Corporate Implementation Specialist', 'Qori Wastuti', 'Deepublish', 6, 2009);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766114, 41, 'Chief Implementation Strategist', 'Kania Zulaika', 'Bukunesia', 3, 2022);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766116, 13, 'Investor Metrics Strategist', 'Ajeng Rachmawati M.M.', 'Haru', 9, 2006);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766115, 38, 'Lead Accounts Coordinator', 'Ridwan Rayhan', 'Bintang Media', 14, 2022);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766117, 40, 'Forward Configuration Executive', 'Martana Darojat S.Sos', 'Bukunesia', 2, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766118, 37, 'Direct Solutions Manager', 'Wadi Budiman', 'Kata Depan', 13, 2006);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766119, 34, 'Direct Applications Planner', 'Irawati Andini', 'Inari', 13, 2009);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766120, 37, 'Internal Branding Executive', 'Karen Putri', 'Gradien Mediatama', 4, 2013);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766122, 14, 'District Branding Executive', 'Pardi Hidayat', 'Quanta', 1, 2000);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766121, 38, 'Corporate Security Supervisor', 'Clara Damayanti', 'Erlangga', 13, 2019);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766123, 40, 'Senior Research Officer', 'Argono Oktavian', 'Gagas Media', 14, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766124, 33, 'Senior Mobility Representative', 'Puti Farida', 'Deepublish', 12, 2007);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766125, 33, 'Central Implementation Associate', 'Hana Rachmawati', 'Grasindo', 1, 2010);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766126, 4, 'National Usability Engineer', 'Melani Widiastuti', 'Gradien Mediatama', 10, 2004);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766127, 33, 'Senior Identity Officer', 'Luis Napitupulu', 'Grasindo', 13, 2012);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766128, 10, 'Global Brand Assistant', 'Opung Narpati M.M.', 'Kata Depan', 11, 2019);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766129, 21, 'Investor Markets Executive', 'Adika Prasetyo', 'Grasindo', 12, 2009);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766130, 30, 'Global Metrics Liaison', 'Vera Saputri', 'Bukunesia', 12, 2006);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766131, 6, 'Internal Accounts Representative', 'Nadine Kuswandari', 'Grasindo', 15, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766132, 19, 'Future Security Officer', 'Gabriella Wahyuni S.Psi', 'Deepublish', 14, 2020);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766133, 6, 'Regional Tactics Agent', 'Unjani Sudiati', 'Erlangga', 1, 2022);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766134, 7, 'Forward Integration Executive', 'Hendri Permadi', 'Deepublish', 1, 2016);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766135, 16, 'Direct Interactions Architect', 'Hana Maharani', 'Bukunesia', 7, 2017);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766136, 48, 'District Response Coordinator', 'Ian Najmudin', 'Gagas Media', 6, 2004);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766137, 38, 'Global Identity Consultant', 'Karja Saefullah', 'Deepublish', 5, 2007);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766138, 34, 'Internal Division Facilitator', 'Wardi Saefullah', 'Mizan', 10, 2020);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766139, 32, 'District Creative Manager', 'Puput Fujiati S.Pd', 'Falcon', 14, 2016);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766140, 3, 'Principal Security Technician', 'Olivia Kahyang', 'Falcon', 4, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766142, 50, 'Legacy Markets Supervisor', 'Prita Prastuti', 'Deepublish', 8, 2019);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766143, 37, 'International Assurance Officer', 'Dyah Kuswandari S.Psi', 'Inari', 5, 2017);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766141, 16, 'Lead Applications Agent', 'Ami Ramadhani', 'Haru', 10, 2019);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766144, 2, 'Lead Program Manager', 'Jagaraga Anggriawan', 'Gagas Media', 12, 2000);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766145, 26, 'International Configuration Assistant', 'Estiawan Setiawan', 'Bintang Media', 15, 2006);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766146, 28, 'Internal Operations Producer', 'Anggun Winarsih S.E.I', 'Inari', 7, 2019);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766147, 34, 'Corporate Directives Designer', 'Puspita Prastuti S.T.', 'Inari', 3, 2019);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766148, 2, 'International Creative Manager', 'Mursinin Widodo', 'Kata Depan', 13, 2008);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766149, 46, 'National Security Associate', 'Harjo Oktovian', 'Gradien Mediatama', 14, 2022);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766150, 35, 'Internal Paradigm Representative', 'Sabar Putra', 'Mizan', 12, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766151, 15, 'Direct Factors Specialist', 'Mustika Pradana S.Psi', 'Gradien Mediatama', 11, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766152, 14, 'Chief Assurance Technician', 'Heru Adhitama', 'Haru', 10, 2016);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766153, 8, 'Dynamic Directives Assistant', 'Fara Nurlaela', 'Bukunesia', 1, 2000);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766154, 34, 'Global Security Planner', 'Hani Harini', 'Inari', 15, 2020);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766155, 36, 'Customer Accounts Executive', 'Kenes Saefullah S.Psi', 'Bintang Media', 13, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766156, 24, 'Customer Program Architect', 'Dariati Saefullah S.Pt', 'Gramedia', 8, 2016);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766157, 41, 'Product Web Manager', 'Rika Haryanti', 'Quanta', 7, 2011);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766158, 5, 'Forward Response Coordinator', 'Mahmud Gunawan', 'Haru', 15, 2007);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766159, 40, 'Forward Implementation Orchestrator', 'Rika Mulyani', 'Gradien Mediatama', 8, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766160, 47, 'Dynamic Program Executive', 'Prita Fathina', 'Gramedia', 13, 2006);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766161, 16, 'Dynamic Optimization Administrator', 'Najwa Fernanda S.Pt', 'Twigora', 11, 2011);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766162, 42, 'Future Response Assistant', 'Syahrini Salsabilla', 'Quanta', 10, 2020);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766164, 16, 'Customer Factors Architect', 'Dariati Nainggolan', 'Mizan', 5, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766163, 9, 'Dynamic Identity Associate', 'Rini Yolanda', 'Metagram', 6, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766165, 24, 'Internal Brand Representative', 'Tirta Haikal', 'Gramedia', 10, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766166, 21, 'Legacy Interactions Strategist', 'Cakrawangsa Himawan', 'Quanta', 8, 2000);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766167, 46, 'Direct Usability Officer', 'Prayogo Prayoga', 'Haru', 11, 2012);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766168, 31, 'Regional Infrastructure Producer', 'Septi Aqila S.Gz', 'Inari', 7, 2017);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766169, 36, 'Dynamic Metrics Director', 'Ditya Farida', 'Deepublish', 10, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766170, 36, 'Direct Brand Consultant', 'Mahmud Budiman', 'Grasindo', 14, 2000);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766171, 46, 'Forward Security Supervisor', 'Rahayu Mahestri S.Sos', 'Quanta', 15, 2017);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766173, 45, 'Forward Communications Architect', 'Kuncara Habibi', 'Haru', 5, 2004);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766172, 3, 'National Usability Designer', 'Elma Aryanti', 'Bintang Media', 1, 2001);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766174, 9, 'Dynamic Infrastructure Architect', 'Rahmawati Suryatmi', 'Bukunesia', 10, 2020);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766175, 25, 'Regional Metrics Representative', 'Aisyah Widiastuti', 'Deepublish', 1, 2008);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766176, 36, 'National Creative Strategist', 'Hesti Halimah M.TI.', 'Quanta', 14, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766177, 39, 'Dynamic Markets Technician', 'Dimaz Aswandi', 'Bintang Media', 5, 2020);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766178, 4, 'District Program Executive', 'Ulva Sudiati', 'Grasindo', 6, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766179, 41, 'Regional Communications Facilitator', 'Danuja Faresta', 'Bukunesia', 3, 2001);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766180, 26, 'Chief Accountability Officer', 'Yulia Mulyani S.Pt', 'Twigora', 4, 2001);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766181, 22, 'Lead Integration Administrator', 'Mahmud Latupono S.T.', 'Mizan', 2, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766182, 17, 'Human Paradigm Planner', 'Prasetyo Aswandi S.Farm', 'Mizan', 14, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766183, 37, 'District Directives Assistant', 'Zelaya Yolanda', 'Haru', 13, 2010);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766184, 12, 'Legacy Metrics Supervisor', 'Betania Mulyani S.Pd', 'Grasindo', 4, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766185, 15, 'Regional Identity Representative', 'Dimas Januar', 'Falcon', 15, 2022);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766186, 29, 'Dynamic Factors Supervisor', 'Vanya Haryanti', 'Falcon', 8, 2014);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766187, 43, 'Customer Usability Facilitator', 'Hadi Hutasoit', 'Inari', 7, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766188, 37, 'Chief Accountability Planner', 'Ulya Yolanda', 'Erlangga', 9, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766189, 18, 'Human Data Designer', 'Harto Zulkarnain S.Ked', 'Gramedia', 14, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766190, 13, 'Future Division Architect', 'Almira Laksmiwati', 'Gagas Media', 14, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766191, 23, 'Product Factors Analyst', 'Akarsana Widodo', 'Twigora', 15, 2001);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766192, 5, 'Direct Infrastructure Director', 'Tina Palastri', 'Erlangga', 2, 2011);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766193, 22, 'Senior Group Associate', 'Rita Haryanti', 'Grasindo', 3, 2017);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766194, 8, 'Senior Intranet Representative', 'Natalia Prastuti', 'Metagram', 15, 2012);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766195, 43, 'Corporate Infrastructure Administrator', 'Prabowo Latupono', 'Twigora', 15, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766196, 29, 'Internal Accountability Architect', 'Parman Maulana', 'Twigora', 12, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766198, 31, 'Forward Brand Assistant', 'Dasa Situmorang', 'Bintang Media', 3, 2010);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766197, 24, 'International Factors Engineer', 'Luhung Marpaung', 'Gramedia', 5, 2020);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766199, 9, 'Legacy Group Planner', 'Mujur Marbun', 'Inari', 3, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766200, 39, 'Human Usability Administrator', 'Niyaga Saefullah', 'Grasindo', 2, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766002, 47, 'Corporate Quality Administrator', 'Vera Wijayanti S.Kom', 'Quanta', 14, 2008);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766003, 9, 'Forward Creative Designer', 'Daru Simanjuntak', 'Inari', 5, 2020);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766006, 12, 'Corporate Intranet Representative', 'Septi Mandasari', 'Falcon', 12, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766004, 1, 'Forward Marketing Officer', 'Setya Airlangga', 'Gramedia', 2, 2001);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766005, 47, 'Customer Program Associate', 'Zelda Aryanti', 'Deepublish', 15, 2013);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766007, 4, 'Corporate Configuration Designer', 'Harja Sihombing', 'Haru', 1, 2000);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766008, 45, 'Dynamic Brand Designer', 'Aswani Rajata', 'Gagas Media', 6, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766009, 12, 'Future Division Officer', 'Amalia Wijayanti', 'Grasindo', 8, 2006);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766010, 45, 'Investor Interactions Orchestrator', 'Indira Febrianti', 'Bukunesia', 2, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766011, 40, 'District Operations Consultant', 'Lamar Saragih', 'Mizan', 12, 2001);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766012, 31, 'Principal Configuration Executive', 'Hasan Firmansyah', 'Haru', 3, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766013, 48, 'Lead Data Consultant', 'Gangsar Dirgantara', 'Deepublish', 9, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766014, 24, 'Regional Research Analyst', 'Diana Pertiwi S.H.', 'Grasindo', 7, 2007);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766015, 1, 'Customer Accounts Agent', 'Sasha Fujiati M.M.', 'Bukunesia', 9, 2008);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766016, 12, 'National Group Developer', 'Capa Halim', 'Gradien Mediatama', 14, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766017, 36, 'National Operations Administrator', 'Eluh Ardana', 'Metagram', 11, 2010);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766018, 11, 'Lead Brand Manager', 'Umi Anjani', 'Bukunesia', 10, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766019, 29, 'Senior Program Technician', 'Nada Safitri', 'Kata Depan', 4, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766020, 16, 'Corporate Factors Facilitator', 'Edi Tamba', 'Erlangga', 1, 2020);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766021, 12, 'Senior Intranet Coordinator', 'Cawisadi Utama', 'Gradien Mediatama', 6, 2007);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766022, 7, 'Forward Brand Producer', 'Nrima Maulana', 'Gradien Mediatama', 14, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766023, 16, 'Dynamic Quality Assistant', 'Wulan Elvina S.E.I', 'Bukunesia', 9, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766024, 23, 'District Factors Representative', 'Ellis Ningrum', 'Inari', 7, 2006);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766025, 31, 'Investor Usability Developer', 'Kasiyah Jelita', 'Bukunesia', 15, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766027, 17, 'International Implementation Director', 'Safina Purnawati S.IP', 'Erlangga', 3, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766026, 24, 'Customer Accountability Manager', 'Yono Yudhistira', 'Inari', 12, 2009);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766028, 35, 'Direct Optimization Coordinator', 'Vera Mandasari', 'Haru', 14, 2011);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766029, 7, 'International Interactions Administrator', 'Jagapati Lesmana', 'Gagas Media', 5, 2013);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766030, 15, 'Chief Response Consultant', 'Noviana Hartati', 'Haru', 7, 2008);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766031, 45, 'Internal Quality Coordinator', 'Yuliana Nurdiyanti', 'Gramedia', 14, 2013);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766032, 15, 'Internal Accountability Analyst', 'Aisyah Maharani', 'Inari', 11, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766033, 25, 'Legacy Optimization Designer', 'Lasmanto Irfandi S.H.', 'Deepublish', 12, 2007);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766034, 7, 'Dynamic Creative Consultant', 'Jarwa Utama', 'Haru', 3, 2016);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766035, 41, 'International Creative Architect', 'Vino Pangestu', 'Quanta', 13, 2018);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766036, 32, 'Central Factors Administrator', 'Wakiman Haikal', 'Grasindo', 8, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766037, 28, 'International Web Facilitator', 'Tina Sudiati S.Kom', 'Grasindo', 13, 2017);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766038, 5, 'Global Response Specialist', 'Jaka Gunawan', 'Haru', 3, 2022);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766039, 46, 'International Response Coordinator', 'Yunita Permata', 'Haru', 4, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766040, 18, 'Dynamic Assurance Consultant', 'Nadine Mahestri', 'Bintang Media', 10, 2010);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766041, 31, 'Direct Directives Designer', 'Jaeman Nugraha', 'Gagas Media', 5, 2007);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766043, 25, 'Lead Branding Administrator', 'Jindra Nanda S.E.I', 'Falcon', 10, 2014);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766042, 25, 'Investor Functionality Engineer', 'Farah Farida', 'Mizan', 5, 2006);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766044, 9, 'International Creative Associate', 'Ajimat Lesmana M.Farm', 'Bintang Media', 12, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766046, 37, 'Regional Paradigm Specialist', 'Halim Iswahyudi', 'Falcon', 13, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766045, 29, 'Central Security Engineer', 'Rahmawati Pertiwi', 'Gradien Mediatama', 1, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766047, 37, 'Future Metrics Developer', 'Latika Sudiati', 'Metagram', 6, 2020);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766048, 12, 'Direct Infrastructure Coordinator', 'Opan Budiman S.Psi', 'Kata Depan', 3, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766049, 3, 'Senior Implementation Planner', 'Titi Namaga', 'Grasindo', 15, 2010);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766050, 16, 'Future Functionality Engineer', 'Hairyanto Wardana', 'Mizan', 13, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766051, 33, 'Customer Metrics Developer', 'Sartika Wijayanti', 'Kata Depan', 11, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766052, 45, 'Regional Paradigm Specialist', 'Kambali Gunawan', 'Grasindo', 4, 2008);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766053, 32, 'Forward Integration Designer', 'Luthfi Haryanto', 'Gramedia', 8, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766054, 38, 'Future Identity Consultant', 'Qori Azzahra', 'Kata Depan', 3, 2018);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766055, 25, 'Legacy Infrastructure Facilitator', 'Rama Nugroho', 'Mizan', 2, 2001);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766056, 32, 'Chief Data Engineer', 'Galiono Marbun S.T.', 'Quanta', 3, 2000);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766057, 22, 'Product Branding Representative', 'Betania Azizah S.T.', 'Quanta', 8, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766058, 46, 'District Group Technician', 'Edi Tarihoran', 'Bintang Media', 15, 2019);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766059, 39, 'Regional Creative Orchestrator', 'Edi Ramadan', 'Gagas Media', 6, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766060, 28, 'Forward Factors Consultant', 'Dadi Suryono', 'Gramedia', 4, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766062, 18, 'Legacy Branding Strategist', 'Harjasa Putra S.T.', 'Mizan', 1, 2006);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766063, 39, 'Internal Infrastructure Representative', 'Cawisono Irfandi', 'Twigora', 14, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766061, 18, 'Human Branding Planner', 'Vino Antoni', 'Bintang Media', 2, 2011);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766064, 36, 'Forward Paradigm Liaison', 'Virman Nababan', 'Quanta', 9, 2007);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766066, 17, 'Dynamic Branding Engineer', 'Gawati Damayanti', 'Falcon', 8, 2006);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766065, 29, 'International Data Administrator', 'Uli Mandasari', 'Quanta', 15, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766067, 39, 'Chief Metrics Technician', 'Jati Sinaga M.M.', 'Metagram', 9, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766068, 17, 'Forward Paradigm Engineer', 'Amalia Lestari', 'Mizan', 2, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766069, 35, 'Future Interactions Representative', 'Rahayu Winarsih S.Psi', 'Quanta', 6, 2016);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766071, 34, 'Direct Mobility Executive', 'Elisa Amanta S.Pd', 'Grasindo', 11, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766070, 20, 'Future Implementation Associate', 'Latika Nurlaela', 'Twigora', 5, 2008);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766072, 17, 'Global Factors Officer', 'Hartaka Sitorus', 'Bintang Media', 12, 2018);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766073, 28, 'Principal Group Director', 'Adhiarja Aswandi', 'Mizan', 9, 2018);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766074, 20, 'Human Marketing Producer', 'Jumadi Abimanyu', 'Twigora', 12, 2016);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766075, 28, 'Chief Solutions Orchestrator', 'Rini Haryanti', 'Erlangga', 12, 2001);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766076, 12, 'Legacy Integration Orchestrator', 'Indah Hasanah', 'Haru', 13, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766077, 41, 'Central Solutions Developer', 'Cinta Nathania S.IP', 'Metagram', 6, 2013);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766078, 48, 'Investor Group Designer', 'Laras Hastuti S.Farm', 'Erlangga', 14, 2017);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766079, 49, 'International Directives Specialist', 'Tugiman Darmawan', 'Deepublish', 5, 2002);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766080, 49, 'Central Creative Producer', 'Anita Aqila', 'Kata Depan', 10, 2012);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766081, 36, 'Legacy Applications Executive', 'Cinthia Jelita', 'Falcon', 2, 2003);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766082, 20, 'Senior Accounts Engineer', 'Paramita Saputri', 'Deepublish', 14, 2005);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766083, 32, 'Central Assurance Developer', 'Zahra Agustina', 'Grasindo', 9, 2020);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766084, 12, 'Human Marketing Executive', 'Kemba Firmansyah S.T.', 'Metagram', 6, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766085, 4, 'Human Identity Orchestrator', 'Purwanto Ardianto', 'Bintang Media', 10, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766086, 39, 'Dynamic Program Agent', 'Darmanto Perdana', 'Grasindo', 2, 2014);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766087, 6, 'Human Directives Producer', 'Laras Lestari', 'Gramedia', 7, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766088, 40, 'Customer Paradigm Supervisor', 'Cici Rahimah', 'Falcon', 2, 2001);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766089, 17, 'Future Marketing Supervisor', 'Radika Himawan', 'Grasindo', 2, 2016);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766090, 36, 'Direct Communications Designer', 'Uda Sitorus', 'Gradien Mediatama', 7, 2015);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766091, 16, 'Principal Data Supervisor', 'Maya Oktaviani', 'Mizan', 15, 2014);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766092, 48, 'Corporate Applications Technician', 'Ade Pudjiastuti', 'Kata Depan', 3, 2012);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766093, 36, 'National Communications Planner', 'Nadia Wijayanti', 'Gradien Mediatama', 4, 2004);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766094, 11, 'National Functionality Specialist', 'Clara Melinda M.M.', 'Inari', 3, 2012);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766095, 17, 'Corporate Operations Officer', 'Tari Jelita', 'Grasindo', 10, 2012);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766096, 11, 'Internal Quality Liaison', 'Lintang Maharani', 'Deepublish', 3, 2014);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766097, 25, 'International Group Facilitator', 'Gamblang Sinaga', 'Gramedia', 2, 2004);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766098, 47, 'Dynamic Intranet Agent', 'Prayoga Handoko', 'Bintang Media', 5, 2021);

INSERT INTO Buku (bu_kode_buku, bu_rb_id, bu_judul, bu_penulis, bu_penerbit, bu_stok, bu_tahun_terbit) VALUES (999888777766099, 23, 'Global Usability Agent', 'Aisyah Wijayanti', 'Deepublish', 5, 2001);

INSERT INTO Akses (ak_id, ak_jenis_akses) VALUES (3101, 'owner');

INSERT INTO Akses (ak_id, ak_jenis_akses) VALUES (3102, 'admin');

INSERT INTO Akses (ak_id, ak_jenis_akses) VALUES (3103, 'editor');

INSERT INTO Akses (ak_id, ak_jenis_akses) VALUES (3104, 'reviewer');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4202, 3102, 'Michelle Suryatmi M.Ak', 5544443333222202, '+628444701606', 'karimahdamayanti@gmail.com', '50860 Felicia Plaza', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4203, 3102, 'Jaga Wahyudin', 5544443333222203, '+628617614160', 'lamarsabian@gmail.com', '3766 Putri Forest', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4204, 3104, 'Vera Mustika', 5544443333222204, '+628292845227', 'zulaikhapurnama@gmail.com', '967 Samosir Pine', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4205, 3103, 'Makara Budiman M.Pd', 5544443333222205, '+628321728966', 'sucikusuma@gmail.com', '49737 Suryatmi Oval', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4201, 3102, 'Daru Wibowo', 5544443333222201, '+628639289186', 'parispratiwis.ip@gmail.com', '179 Ressie Fields', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4207, 3102, 'Ida Riyanti', 5544443333222207, '+628564535371', 'padmahariyah@gmail.com', '85075 Aurelia Isle', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4206, 3102, 'Kawaya Hakim', 5544443333222206, '+628355492950', 'gangsarprayoga@gmail.com', '756 Andriani Gardens', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4208, 3104, 'Rahmi Azzahra', 5544443333222208, '+628827273096', 'mulyantomaryadim.m.@gmail.com', '96785 Cielo Forest', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4210, 3104, 'Diana Azzahra', 5544443333222210, '+628669564310', 'noviwahyunis.h.@gmail.com', '5390 Sabian Stravenue', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4209, 3102, 'Galak Airlangga', 5544443333222209, '+628914151965', 'asmuniuwais@gmail.com', '34320 Brent Overpass', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4211, 3103, 'Silvia Suryatmi S.Farm', 5544443333222211, '+628582104374', 'viktorirfandi@gmail.com', '2230 Katelyn Park', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4212, 3104, 'Endah Susanti', 5544443333222212, '+628746277592', 'limanwahyudinm.kom.@gmail.com', '89023 Jessyca Junction', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4213, 3102, 'Vanya Kuswandari S.E.', 5544443333222213, '+628890327893', 'farahazzahra@gmail.com', '96314 Gunawan Parks', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4215, 3104, 'Hamima Saputri', 5544443333222215, '+628218508077', 'pritalaksmiwati@gmail.com', '552 Wacana Pine', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4216, 3103, 'Michelle Mulyani', 5544443333222216, '+628449450113', 'ayuhassanah@gmail.com', '649 Annie Mountains', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4217, 3104, 'Cager Winarno', 5544443333222217, '+628837590083', 'oniyuliarti@gmail.com', '4950 Mariana Street', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4214, 3103, 'Dirja Nugroho', 5544443333222214, '+628234433349', 'dirjaprasetyos.ked@gmail.com', '225 Isobel Ports', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4218, 3104, 'Heryanto Maheswara', 5544443333222218, '+628007502511', 'jumadisitompul@gmail.com', '8188 Widodo Summit', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4219, 3104, 'Aris Perdana S.Pd', 5544443333222219, '+628082732282', 'riniwinarsihs.pt@gmail.com', '5448 Aurelia Route', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4221, 3103, 'Cayadi Mangunsong S.Farm', 5544443333222221, '+628206608799', 'dodoprasasta@gmail.com', '49782 Zachery Gardens', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4220, 3101, 'Queen Kusuma', 5544443333222220, '+628212818403', 'sherlysalsabillam.kom.@gmail.com', '618 Daphne Trail', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4222, 3101, 'Arta Mansur', 5544443333222222, '+628002813160', 'makutaputra@gmail.com', '37755 Velva Estate', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4223, 3101, 'Paramita Puspasari M.TI.', 5544443333222223, '+628932742865', 'belindanasyidah@gmail.com', '354 Garfield Terrace', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4224, 3101, 'Ade Rahmawati', 5544443333222224, '+628613744058', 'umiuyainah@gmail.com', '394 Jordi Field', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4225, 3104, 'Capa Putra S.Pd', 5544443333222225, '+628450109226', 'dianawastutis.ip@gmail.com', '1836 Mandala Radial', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4226, 3102, 'Irsad Waskita', 5544443333222226, '+628496603528', 'yancenasyiah@gmail.com', '851 Hutapea Station', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4227, 3101, 'Jarwa Febian', 5544443333222227, '+628671637950', 'indahkuswandari@gmail.com', '961 Hutapea Coves', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4228, 3102, 'Laras Salma S.Pd', 5544443333222228, '+628464771278', 'rianamaga@gmail.com', '6217 Pratiwi Path', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4229, 3101, 'Hardi Sirait', 5544443333222229, '+628813333978', 'kayunpangestus.psi@gmail.com', '26628 Rachmawati Walk', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4230, 3101, 'Harsana Rajasa S.Ked', 5544443333222230, '+628875540507', 'dasasirait@gmail.com', '686 Rahmawati Stravenue', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4231, 3104, 'Drajat Waskita', 5544443333222231, '+628090116918', 'bahuraksasiregars.farm@gmail.com', '99829 Stephan Inlet', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4232, 3104, 'Tania Zahrah', 5544443333222232, '+628176593135', 'febiharyantis.t.@gmail.com', '5750 Erick Plain', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4233, 3101, 'Zahra Rachmawati', 5544443333222233, '+628580297880', 'tirtayasaharyanto@gmail.com', '4028 Russ Throughway', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4234, 3102, 'Najwa Lailasari S.IP', 5544443333222234, '+628854326832', 'limarramadan@gmail.com', '360 Kahyang View', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4235, 3102, 'Oni Zahrah S.T.', 5544443333222235, '+628704355823', 'martaniprakasa@gmail.com', '6923 Hartati Groves', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4237, 3103, 'Lutfan Prakasa S.Pd', 5544443333222237, '+628466930260', 'prayitnaantoni@gmail.com', '98183 Iswahyudi Mountain', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4236, 3104, 'Virman Setiawan', 5544443333222236, '+628011605310', 'violetaqilas.gz@gmail.com', '7758 Danny Port', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4239, 3103, 'Febrina Rahmawati', 5544443333222239, '+628564998048', 'karjafarestas.gz@gmail.com', '5422 Desmond Pines', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4238, 3101, 'Eva Hartati', 5544443333222238, '+628568512129', 'mahdiardana@gmail.com', '51069 Alicia Hollow', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4240, 3101, 'Elisa Aryanti', 5544443333222240, '+628122456353', 'farauyainah@gmail.com', '092 Tampubolon Brooks', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4241, 3101, 'Febrina Jelita', 5544443333222241, '+628356219957', 'unjanizahrah@gmail.com', '508 Darmawan Harbor', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4242, 3104, 'Respati Supriyanto', 5544443333222242, '+628704018655', 'ediwidodo@gmail.com', '2766 Lonie Shoals', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4243, 3101, 'Nur Hastuti', 5544443333222243, '+628899933346', 'fitriagustina@gmail.com', '090 Saputra Lock', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4244, 3101, 'Tami Elvina S.Sos', 5544443333222244, '+628644581080', 'adhiarjaalamsyah@gmail.com', '849 Bernhard Views', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4245, 3101, 'Kirana Usada S.I.Kom', 5544443333222245, '+628731311463', 'jumarihimawan@gmail.com', '0608 Dovie Plaza', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4246, 3103, 'Shania Kusmawati M.Ak', 5544443333222246, '+628846795374', 'novianarahmawati@gmail.com', '2672 Maritza Vista', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4247, 3101, 'Hardana Tampubolon S.H.', 5544443333222247, '+628442944529', 'aswanirajasa@gmail.com', '5462 Ramadhani Terrace', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4248, 3101, 'Gaman Wibowo M.Ak', 5544443333222248, '+628655617043', 'pritawidiastuti@gmail.com', '2142 Rosalinda Via', 'P');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4249, 3102, 'Caturangga Prasetyo', 5544443333222249, '+628289670835', 'wanimayasari@gmail.com', '494 Aryanti Bridge', 'L');

INSERT INTO Petugas (pe_id, pe_ak_id, pe_nama, pe_nip, pe_no_telp, pe_email, pe_alamat, pe_jenis_kelamin) VALUES (4250, 3102, 'Nova Aqila S.Kom', 5544443333222250, '+628496763820', 'fitrianimahestri@gmail.com', '731 Anjani Walks', 'P');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53001, 188, 4240, DATE '2022-11-23', DATE '2022-11-16', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53002, 207, 4223, DATE '2022-11-18', DATE '2022-11-08', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53003, 124, 4205, DATE '2022-11-19', DATE '2022-11-14', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53004, 100, 4246, DATE '2022-11-28', DATE '2022-11-03', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53005, 124, 4217, DATE '2022-11-26', DATE '2022-11-05', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53007, 168, 4202, DATE '2022-11-26', DATE '2022-11-12', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53008, 20, 4239, DATE '2022-11-25', DATE '2022-11-11', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53006, 114, 4232, DATE '2022-11-27', DATE '2022-11-13', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53009, 289, 4228, DATE '2022-11-17', DATE '2022-11-13', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53010, 49, 4215, DATE '2022-11-16', DATE '2022-11-05', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53011, 236, 4217, DATE '2022-11-26', DATE '2022-11-11', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53013, 234, 4241, DATE '2022-11-28', DATE '2022-11-03', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53012, 256, 4235, DATE '2022-11-17', DATE '2022-11-06', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53014, 185, 4247, DATE '2022-11-17', DATE '2022-11-07', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53015, 33, 4244, DATE '2022-11-21', DATE '2022-11-03', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53016, 161, 4214, DATE '2022-11-21', DATE '2022-11-03', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53017, 120, 4235, DATE '2022-11-24', DATE '2022-11-03', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53018, 93, 4231, DATE '2022-11-20', DATE '2022-11-04', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53019, 43, 4223, DATE '2022-11-27', DATE '2022-11-08', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53021, 185, 4208, DATE '2022-11-26', DATE '2022-11-10', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53020, 264, 4247, DATE '2022-11-17', DATE '2022-11-03', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53022, 96, 4225, DATE '2022-11-16', DATE '2022-11-14', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53023, 242, 4240, DATE '2022-11-16', DATE '2022-11-12', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53024, 75, 4202, DATE '2022-11-21', DATE '2022-11-10', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53025, 278, 4233, DATE '2022-11-25', DATE '2022-11-17', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53026, 131, 4204, DATE '2022-11-22', DATE '2022-11-03', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53029, 55, 4223, DATE '2022-11-25', DATE '2022-11-11', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53027, 295, 4210, DATE '2022-11-21', DATE '2022-11-08', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53030, 147, 4246, DATE '2022-11-27', DATE '2022-11-16', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53028, 79, 4223, DATE '2022-11-18', DATE '2022-11-05', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53031, 191, 4231, DATE '2022-11-22', DATE '2022-11-03', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53032, 137, 4239, DATE '2022-11-28', DATE '2022-11-15', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53033, 63, 4229, DATE '2022-11-26', DATE '2022-11-08', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53034, 220, 4203, DATE '2022-11-25', DATE '2022-11-13', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53035, 138, 4236, DATE '2022-11-16', DATE '2022-11-12', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53036, 6, 4225, DATE '2022-11-27', DATE '2022-11-13', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53037, 76, 4223, DATE '2022-11-28', DATE '2022-11-03', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53038, 111, 4244, DATE '2022-11-24', DATE '2022-11-15', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53039, 84, 4236, DATE '2022-11-21', DATE '2022-11-06', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53040, 223, 4246, DATE '2022-11-17', DATE '2022-11-13', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53041, 179, 4219, DATE '2022-11-16', DATE '2022-11-06', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53042, 237, 4222, DATE '2022-11-22', DATE '2022-11-12', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53044, 243, 4249, DATE '2022-11-28', DATE '2022-11-17', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53043, 231, 4227, DATE '2022-11-28', DATE '2022-11-09', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53045, 99, 4202, DATE '2022-11-18', DATE '2022-11-05', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53046, 233, 4242, DATE '2022-11-21', DATE '2022-11-07', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53047, 246, 4241, DATE '2022-11-30', DATE '2022-11-14', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53048, 254, 4212, DATE '2022-11-25', DATE '2022-11-09', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53049, 65, 4205, DATE '2022-11-27', DATE '2022-11-16', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53050, 15, 4249, DATE '2022-11-21', DATE '2022-11-11', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53051, 187, 4233, DATE '2022-11-17', DATE '2022-11-14', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53052, 204, 4244, DATE '2022-11-20', DATE '2022-11-11', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53053, 266, 4215, DATE '2022-11-29', DATE '2022-11-15', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53054, 87, 4215, DATE '2022-11-20', DATE '2022-11-07', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53055, 67, 4205, DATE '2022-11-27', DATE '2022-11-03', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53056, 125, 4210, DATE '2022-11-26', DATE '2022-11-04', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53057, 145, 4248, DATE '2022-11-18', DATE '2022-11-16', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53058, 193, 4234, DATE '2022-11-21', DATE '2022-11-14', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53059, 261, 4221, DATE '2022-11-21', DATE '2022-11-08', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53060, 220, 4248, DATE '2022-11-23', DATE '2022-11-09', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53061, 280, 4239, DATE '2022-11-26', DATE '2022-11-04', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53062, 271, 4201, DATE '2022-11-26', DATE '2022-11-10', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53063, 274, 4218, DATE '2022-11-19', DATE '2022-11-11', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53064, 101, 4234, DATE '2022-11-22', DATE '2022-11-08', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53065, 246, 4232, DATE '2022-11-23', DATE '2022-11-10', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53066, 205, 4236, DATE '2022-11-29', DATE '2022-11-09', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53067, 60, 4232, DATE '2022-11-17', DATE '2022-11-04', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53068, 196, 4202, DATE '2022-11-18', DATE '2022-11-17', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53069, 23, 4233, DATE '2022-11-17', DATE '2022-11-13', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53070, 255, 4207, DATE '2022-11-21', DATE '2022-11-07', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53071, 69, 4203, DATE '2022-11-21', DATE '2022-11-04', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53072, 105, 4218, DATE '2022-11-28', DATE '2022-11-05', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53073, 299, 4215, DATE '2022-11-30', DATE '2022-11-17', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53074, 213, 4243, DATE '2022-11-26', DATE '2022-11-15', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53075, 62, 4215, DATE '2022-11-26', DATE '2022-11-04', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53076, 105, 4214, DATE '2022-11-22', DATE '2022-11-06', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53077, 134, 4221, DATE '2022-11-24', DATE '2022-11-10', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53078, 245, 4225, DATE '2022-11-17', DATE '2022-11-10', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53079, 260, 4205, DATE '2022-11-26', DATE '2022-11-03', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53080, 107, 4237, DATE '2022-11-25', DATE '2022-11-08', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53081, 191, 4214, DATE '2022-11-16', DATE '2022-11-16', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53082, 53, 4235, DATE '2022-11-18', DATE '2022-11-16', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53083, 46, 4220, DATE '2022-11-30', DATE '2022-11-10', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53084, 296, 4209, DATE '2022-11-25', DATE '2022-11-12', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53085, 143, 4211, DATE '2022-11-26', DATE '2022-11-09', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53086, 262, 4229, DATE '2022-11-17', DATE '2022-11-15', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53087, 139, 4215, DATE '2022-11-25', DATE '2022-11-11', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53088, 58, 4226, DATE '2022-11-23', DATE '2022-11-14', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53089, 69, 4218, DATE '2022-11-21', DATE '2022-11-05', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53090, 248, 4243, DATE '2022-11-17', DATE '2022-11-07', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53091, 35, 4245, DATE '2022-11-24', DATE '2022-11-14', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53092, 254, 4214, DATE '2022-11-24', DATE '2022-11-12', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53093, 252, 4241, DATE '2022-11-29', DATE '2022-11-07', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53094, 58, 4246, DATE '2022-11-19', DATE '2022-11-16', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53095, 200, 4225, DATE '2022-11-26', DATE '2022-11-16', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53096, 178, 4207, DATE '2022-11-20', DATE '2022-11-06', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53097, 268, 4244, DATE '2022-11-18', DATE '2022-11-11', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53098, 162, 4240, DATE '2022-11-17', DATE '2022-11-05', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53099, 258, 4220, DATE '2022-11-16', DATE '2022-11-08', '');

INSERT INTO Transaksi_Peminjaman (tp_id, tp_an_id, tp_pe_id, tp_tgl_kembali, tp_tgl_pinjam, tp_denda) VALUES (53100, 7, 4225, DATE '2022-11-17', DATE '2022-11-14', '');

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (1, 53001, 999888777766001);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (2, 53002, 999888777766133);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (3, 53003, 999888777766125);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (4, 53004, 999888777766199);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (6, 53006, 999888777766132);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (5, 53005, 999888777766077);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (9, 53009, 999888777766194);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (7, 53007, 999888777766076);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (10, 53010, 999888777766183);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (11, 53011, 999888777766067);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (8, 53008, 999888777766167);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (13, 53013, 999888777766034);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (14, 53014, 999888777766165);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (16, 53016, 999888777766082);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (17, 53017, 999888777766154);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (18, 53018, 999888777766139);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (15, 53015, 999888777766012);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (12, 53012, 999888777766085);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (19, 53019, 999888777766108);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (20, 53020, 999888777766153);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (21, 53021, 999888777766007);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (22, 53022, 999888777766037);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (23, 53023, 999888777766063);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (24, 53024, 999888777766112);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (25, 53025, 999888777766160);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (26, 53026, 999888777766157);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (27, 53027, 999888777766190);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (28, 53028, 999888777766085);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (29, 53029, 999888777766111);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (30, 53030, 999888777766058);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (31, 53031, 999888777766052);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (32, 53032, 999888777766153);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (33, 53033, 999888777766137);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (34, 53034, 999888777766100);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (35, 53035, 999888777766185);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (36, 53036, 999888777766100);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (37, 53037, 999888777766017);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (38, 53038, 999888777766001);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (39, 53039, 999888777766018);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (40, 53040, 999888777766051);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (41, 53041, 999888777766088);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (42, 53042, 999888777766086);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (43, 53043, 999888777766101);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (44, 53044, 999888777766181);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (45, 53045, 999888777766150);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (46, 53046, 999888777766193);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (47, 53047, 999888777766017);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (48, 53048, 999888777766153);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (49, 53049, 999888777766165);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (50, 53050, 999888777766192);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (51, 53051, 999888777766095);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (52, 53052, 999888777766101);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (53, 53053, 999888777766019);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (54, 53054, 999888777766101);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (55, 53055, 999888777766181);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (56, 53056, 999888777766047);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (57, 53057, 999888777766063);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (58, 53058, 999888777766162);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (59, 53059, 999888777766080);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (60, 53060, 999888777766155);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (61, 53061, 999888777766097);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (62, 53062, 999888777766137);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (63, 53063, 999888777766129);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (64, 53064, 999888777766191);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (65, 53065, 999888777766033);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (66, 53066, 999888777766034);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (67, 53067, 999888777766045);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (68, 53068, 999888777766020);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (69, 53069, 999888777766177);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (70, 53070, 999888777766060);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (71, 53071, 999888777766119);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (73, 53073, 999888777766101);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (74, 53074, 999888777766040);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (72, 53072, 999888777766178);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (75, 53075, 999888777766135);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (76, 53076, 999888777766136);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (77, 53077, 999888777766137);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (78, 53078, 999888777766057);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (79, 53079, 999888777766035);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (80, 53080, 999888777766046);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (81, 53081, 999888777766185);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (83, 53083, 999888777766023);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (82, 53082, 999888777766099);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (86, 53086, 999888777766199);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (84, 53084, 999888777766131);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (87, 53087, 999888777766134);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (85, 53085, 999888777766035);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (88, 53088, 999888777766003);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (89, 53089, 999888777766100);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (90, 53090, 999888777766011);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (91, 53091, 999888777766041);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (92, 53092, 999888777766132);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (93, 53093, 999888777766154);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (94, 53094, 999888777766004);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (95, 53095, 999888777766124);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (96, 53096, 999888777766102);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (97, 53097, 999888777766164);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (98, 53098, 999888777766115);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (99, 53099, 999888777766049);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (100, 53100, 999888777766028);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (101, 53070, 999888777766050);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (102, 53007, 999888777766197);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (104, 53087, 999888777766015);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (103, 53035, 999888777766180);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (105, 53027, 999888777766051);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (106, 53041, 999888777766134);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (107, 53072, 999888777766132);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (108, 53015, 999888777766197);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (109, 53049, 999888777766035);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (110, 53063, 999888777766023);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (111, 53044, 999888777766001);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (112, 53083, 999888777766132);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (113, 53075, 999888777766087);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (114, 53100, 999888777766200);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (115, 53089, 999888777766171);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (116, 53014, 999888777766018);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (117, 53023, 999888777766088);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (118, 53097, 999888777766006);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (119, 53006, 999888777766059);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (120, 53093, 999888777766189);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (121, 53083, 999888777766066);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (122, 53034, 999888777766030);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (123, 53029, 999888777766142);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (124, 53040, 999888777766124);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (126, 53085, 999888777766125);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (125, 53004, 999888777766049);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (127, 53097, 999888777766075);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (128, 53032, 999888777766111);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (129, 53082, 999888777766140);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (130, 53081, 999888777766013);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (131, 53056, 999888777766095);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (132, 53042, 999888777766181);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (133, 53015, 999888777766125);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (134, 53001, 999888777766079);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (135, 53009, 999888777766088);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (136, 53047, 999888777766104);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (137, 53048, 999888777766194);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (139, 53003, 999888777766063);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (138, 53089, 999888777766073);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (140, 53059, 999888777766183);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (141, 53013, 999888777766084);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (143, 53086, 999888777766072);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (144, 53062, 999888777766003);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (142, 53092, 999888777766071);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (145, 53061, 999888777766177);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (146, 53021, 999888777766013);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (147, 53014, 999888777766016);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (148, 53097, 999888777766159);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (149, 53027, 999888777766162);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (151, 53076, 999888777766091);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (150, 53047, 999888777766197);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (152, 53043, 999888777766153);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (153, 53045, 999888777766150);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (154, 53082, 999888777766139);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (155, 53059, 999888777766167);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (156, 53078, 999888777766003);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (157, 53011, 999888777766172);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (158, 53077, 999888777766175);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (159, 53023, 999888777766029);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (161, 53077, 999888777766174);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (160, 53060, 999888777766072);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (162, 53044, 999888777766024);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (163, 53090, 999888777766107);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (164, 53100, 999888777766118);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (165, 53030, 999888777766086);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (167, 53062, 999888777766141);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (166, 53083, 999888777766077);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (168, 53016, 999888777766113);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (170, 53008, 999888777766183);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (169, 53004, 999888777766079);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (172, 53052, 999888777766058);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (171, 53073, 999888777766194);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (173, 53081, 999888777766168);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (174, 53088, 999888777766021);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (175, 53089, 999888777766179);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (176, 53046, 999888777766158);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (177, 53014, 999888777766013);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (178, 53071, 999888777766035);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (179, 53025, 999888777766187);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (180, 53058, 999888777766160);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (181, 53045, 999888777766028);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (182, 53052, 999888777766097);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (184, 53079, 999888777766159);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (185, 53013, 999888777766019);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (183, 53042, 999888777766168);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (186, 53068, 999888777766086);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (187, 53042, 999888777766193);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (188, 53038, 999888777766025);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (189, 53048, 999888777766069);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (190, 53054, 999888777766020);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (191, 53006, 999888777766050);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (192, 53057, 999888777766183);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (193, 53019, 999888777766169);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (194, 53046, 999888777766043);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (195, 53036, 999888777766131);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (196, 53052, 999888777766012);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (197, 53087, 999888777766064);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (198, 53031, 999888777766098);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (199, 53009, 999888777766106);

INSERT INTO Peminjaman_Buku (pb_id, pb_tp_id, pb_bu_kode_buku) VALUES (200, 53087, 999888777766173);

select count(*) from peminjaman_buku;