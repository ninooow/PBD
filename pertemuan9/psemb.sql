create table BARANG (
KODE_BARANG CHAR(6) NOT NULL PRIMARY KEY,
NAMA_BARANG VARCHAR(20),
SATUAN_BARANG VARCHAR(10)
);

ALTER TABLE BARANG ADD STOK_BARANG INT;

create table SUPLIER (
KODE_SUPLIER CHAR(6) NOT NULL PRIMARY KEY,
NAMA_SUPLIER VARCHAR2(30),
ALAMAT_SUPLIER VARCHAR2(50)
);

ALTER TABLE SUPLIER MODIFY ALAMAT_SUPLIER CHAR(40);

create table CUSTOMER (
KODE_CUSTOMER CHAR(6) NOT NULL PRIMARY KEY,
NAMA_CUSTOMER VARCHAR2(30),
ALAMAT_CUSTOMER VARCHAR2(50)
);

create table PASOK (
KODE_PASOK CHAR(6) NOT NULL PRIMARY KEY,
KODE_BARANG CHAR(6) NOT NULL,
KODE_SUPLIER CHAR(6)NOT NULL,
JUMLAH_PASOK NUMBER(38)
); 

ALTER TABLE PASOK ADD FOREIGN KEY (KODE_BARANG) REFERENCES BARANG(KODE_BARANG);
ALTER TABLE PASOK ADD FOREIGN KEY (KODE_SUPLIER) REFERENCES SUPLIER(KODE_SUPLIER);

create table PEMBELIAN (
KODE_PEMBELIAN CHAR(6) NOT NULL PRIMARY KEY,
KODE_BARANG CHAR(6) NOT NULL,
KODE_CUSTOMER CHAR(6)NOT NULL,
JUMLAH_PEMBELIAN NUMBER(38)
);

ALTER TABLE PEMBELIAN ADD FOREIGN KEY (KODE_BARANG) REFERENCES BARANG(KODE_BARANG);
ALTER TABLE PEMBELIAN ADD FOREIGN KEY (KODE_CUSTOMER) REFERENCES CUSTOMER(KODE_CUSTOMER);

DESCRIBE PEMBELIAN;
--1--
INSERT INTO barang (kode_barang,nama_barang,satuan_barang,stok_barang)
VALUES ('B001', 'Lemari Es', 'unit', 11);
select * from barang;

--2--
INSERT INTO barang (kode_barang,nama_barang,satuan_barang,stok_barang)
VALUES ('B002', 'Rice Cooker', 'buah', 23);
select * from barang;

--3--
INSERT INTO barang (kode_barang,nama_barang)
VALUES ('B003', 'TV');
select * from barang;

--4--
INSERT INTO barang (kode_barang,nama_barang,satuan_barang,stok_barang)
VALUES ('B004', 'Radio', 'buah', 21);
select * from barang;

--5--
INSERT INTO suplier (kode_suplier,nama_suplier,alamat_suplier)
VALUES ('s001', 'Doni', 'Baturaja');
select * from suplier;

INSERT INTO suplier (kode_suplier,nama_suplier,alamat_suplier)
VALUES ('s002', 'Hana', 'Palembag');
select * from suplier;

INSERT INTO suplier (kode_suplier,nama_suplier,alamat_suplier)
VALUES ('c003', 'Lili', 'Jakarta');
select * from suplier;

--6--
INSERT INTO customer (kode_customer,nama_customer,alamat_customer)
VALUES ('s001', 'Doni', 'Baturaja');
select * from customer;

INSERT INTO customer (kode_customer,nama_customer,alamat_customer)
VALUES ('c002', 'Hana', 'Palembang');
select * from customer;

INSERT INTO customer (kode_customer,nama_customer,alamat_customer)
VALUES ('c003', 'Lili', 'Jakarta');
select * from customer;

--7--
INSERT INTO barang (kode_barang,nama_barang)
VALUES ('B003', 'TV');

UPDATE barang SET satuan_barang = 'UNIT'
WHERE kode_barang= 'B003';

UPDATE barang SET stok_barang = 30
WHERE kode_barang= 'B003';

select * from barang;

--8--
--INSERT INTO PASOK (KODE_PASOK, KODE_BARANG, KODE_SUPLIER, JUMLAH_PASOK)
--VALUES ('P001','B010','s001', 5);

--9--
INSERT INTO pasok (kode_pasok,kode_barang,kode_suplier,jumlah_pasok)
VALUES ('P001', 'B002', 's001', 5);
INSERT INTO pasok (kode_pasok,kode_barang,kode_suplier,jumlah_pasok)
VALUES ('P002', 'B003', 's002', 20);
INSERT INTO pasok (kode_pasok,kode_barang,kode_suplier,jumlah_pasok)
VALUES ('P003', 'B002', 's002', 26);
select * from pasok;

--10--
INSERT INTO pembelian (kode_pembelian,kode_barang,kode_customer,jumlah_pembelian)
VALUES ('PB001', 'B001', 'c003', 30);
select * from pembelian;

INSERT INTO pembelian (kode_pembelian,kode_barang,kode_customer,jumlah_pembelian)
VALUES ('PB002', 'B003', 'c002', 8);
select * from pembelian;

INSERT INTO pembelian (kode_pembelian,kode_barang,kode_customer,jumlah_pembelian)
VALUES ('PB003', 'B003', 'c003', 14);
select * from pembelian;

--11--
select table_name from user_tables;

--12--
disconnect;

DROP TABLE PASOK;
DROP TABLE CUSTOMER;
DROP TABLE SUPLIER;
DROP TABLE BARANG;
DROP TABLE PEMBELIAN;