-- NOMOR 1
-- Buatlah 3 tabel sesuai desain berikut!
CREATE TABLE MAHASISWA(
NIM CHAR(18) NOT NULL PRIMARY KEY,
NAMA VARCHAR2(20),
TANGGAL_LAHIR DATE,
JENIS_KELAMIN CHAR(1) CHECK(JENIS_KELAMIN IN ('P','L')),
IPK FLOAT
);

CREATE TABLE MATAKULIAH(
ID_MK CHAR(5) NOT NULL PRIMARY KEY,
NAMA VARCHAR2(20),
SEMESTER INT
);

CREATE TABLE KRS (
ID_KRS CHAR(5) NOT NULL,
ID_MK CHAR(5),
FOREIGN KEY (ID_MK) REFERENCES MATAKULIAH (ID_MK),
NIM CHAR (18),
FOREIGN KEY (NIM) REFERENCES MAHASISWA (NIM)
);


--NOMOR 2
--Ubah kolom nama pada tabel matakuliah menjadi VARCHAR2(100)	
ALTER TABLE MATAKULIAH MODIFY(
NAMA VARCHAR2(100)
);

insert into mahasiswa values ('21/473285/SV/18820', 'Nadya', to_date('2002-07-01','YYYY-MM-DD'), 'P', 3.56);
insert into mahasiswa values ('23/298888/SV/19802', 'Sodiq', to_date('2004-07-01','YYYY-MM-DD'), 'L', 3.70);
insert into mahasiswa values ('22/543231/SV/17770', 'Mukti', to_date('2003-07-01','YYYY-MM-DD'), 'P', 3.56);
insert into mahasiswa values ('22/543323/SV/17777', 'Siti', to_date('2004-01-05','YYYY-MM-DD'), 'P', 3.82);
insert into mahasiswa values ('21/473286/SV/18821', 'Danang', to_date('2002-05-15','YYYY-MM-DD'), 'L', 3.40);
insert into mahasiswa values ('22/298888/SV/18820', 'Amir', to_date('2004-07-01','YYYY-MM-DD'), 'L', 3.78);

insert into matakuliah values ('MK001', 'Praktikum Basis Data', 2);
insert into matakuliah values ('MK002', 'Pengantar Teknologi Informasi', 1);
insert into matakuliah values ('MK003', 'Matematika Diskrit', 1);
insert into matakuliah values ('MK004', 'Praktikum Pemrograman', 1);
insert into matakuliah values ('MK005', 'Metode Penelitian', 4);
insert into matakuliah values ('MK006', 'Verifikasi dan Validasi', 4);
insert into matakuliah values ('MK007', 'PMLD 2', 6);
insert into matakuliah values ('MK008', 'Bahasa Inggris 1',1);
insert into matakuliah values ('MK009', 'Ide Kreatif dan Kewirausahaan',6);
insert into matakuliah values ('MK010', 'Pemrograman Web',2);
						 
insert into KRS values ('KRS01', 'MK001', '23/298888/SV/19802');
insert into KRS values ('KRS02', 'MK002', '23/298888/SV/19802');
insert into KRS values ('KRS03', 'MK003','23/298888/SV/19802');
insert into KRS values ('KRS04', 'MK005', '22/543323/SV/17777');
insert into KRS values ('KRS05', 'MK009', '21/473286/SV/18821');
insert into KRS values ('KRS06', 'MK005', '22/543231/SV/17770');
insert into KRS values ('KRS07', 'MK005', '22/298888/SV/18820');
insert into KRS values ('KRS08', 'MK009', '21/473285/SV/18820');


--NOMOR 3
--Tampilkan semua mata kuliah yang ditawarkan di semester genap!
SELECT NAMA FROM MATAKULIAH WHERE MOD(SEMESTER,2) = 0;

--NOMOR 4
--Tampilkan jumlah mata kuliah yang harus diambil mahasiswa semester 1!
SELECT COUNT(SEMESTER)"JUMLAH MATA KULIAH MAHASISWA SEMESTER 1" FROM MATAKULIAH WHERE SEMESTER = 1;

--NOMOR 5
--Tampilkan berapa ipk terendah dari ipk seluruh mahasiswa! 
SELECT MIN(IPK)"IPK TERENDAH" FROM MAHASISWA;

--NOMOR 6
--Tampilkan data (nim,nama, jenis kelamin) mahasiswa perempuan yang ada di angkatan 2022!
SELECT NIM, NAMA, JENIS_KELAMIN FROM MAHASISWA WHERE JENIS_KELAMIN = 'P';

--NOMOR 7
--Tampilkan data mahasiswa (nim, nama, tgl_lahir, umur) yang sudah berumur lebih dari 21 tahun diurutkan dari yang paling muda!
--TANPA DIBULATKAN
SELECT NIM, NAMA, TANGGAL_LAHIR, (SYSDATE - TANGGAL_LAHIR)/365 "UMUR" FROM MAHASISWA WHERE (SYSDATE - TANGGAL_LAHIR)/365>21 ORDER BY (SYSDATE - TANGGAL_LAHIR)/365;
--DIBULATKAN SESUAI ANGKA DI BELAKANG KOMA
SELECT NIM, NAMA, TANGGAL_LAHIR, ROUND((SYSDATE - TANGGAL_LAHIR)/365) "UMUR" FROM MAHASISWA WHERE (SYSDATE - TANGGAL_LAHIR)/365>21 ORDER BY (SYSDATE - TANGGAL_LAHIR)/365;
--DIBULATKAN KE BAWAH
SELECT NIM, NAMA, TANGGAL_LAHIR, TRUNC((SYSDATE - TANGGAL_LAHIR)/365) "UMUR" FROM MAHASISWA WHERE (SYSDATE - TANGGAL_LAHIR)/365>21 ORDER BY (SYSDATE - TANGGAL_LAHIR)/365;


--NOMOR 8
--Tampilkan data semua mahasiswa dan semua mata kuliah yang diambil oleh tiap mahasiswa!
SELECT M.NIM, M.NAMA, M.TANGGAL_LAHIR, M.JENIS_KELAMIN, M.IPK, MAT.NAMA "MATA KULIAH" FROM MAHASISWA M JOIN KRS K ON (M.NIM=K.NIM) JOIN MATAKULIAH MAT ON (K.ID_MK=MAT.ID_MK);

--NOMOR 9
--Tampilkan data mahasiswa (nim, nama) yang mengambil kelas Metode Penelitian!
SELECT M.NIM, M.NAMA FROM MAHASISWA M JOIN KRS K ON (M.NIM=K.NIM) JOIN MATAKULIAH MAT ON (K.ID_MK=MAT.ID_MK) WHERE UPPER(MAT.NAMA) = 'METODE PENELITIAN';

--NOMOR 10
--Tampilkan data mata kuliah yang tidak memiliki mahasiswa urutkan berdasarkan semester!
SELECT MAT.ID_MK, MAT.NAMA, MAT.SEMESTER FROM MAHASISWA M JOIN KRS K ON (M.NIM=K.NIM) RIGHT OUTER JOIN MATAKULIAH MAT ON (K.ID_MK=MAT.ID_MK) WHERE M.NIM IS NULL; 

--BONUS SOAL
--Tampilkan data mahasiswa dengan ipk terendah!
SELECT * FROM(SELECT * FROM MAHASISWA ORDER BY IPK) WHERE ROWNUM=1;
