/*==============================================================*/
/* Table: JABATAN                                               */
/*==============================================================*/
create table JABATAN 
(
   ID_JABATAN           char(6)                        not null,
   NAMA_JABATAN         varchar(20)                    null,
   GAJI_POKOK           numeric(8,2)                   null,
   constraint PK_JABATAN primary key (ID_JABATAN)
);



/*==============================================================*/
/* Table: MOBIL                                                 */
/*==============================================================*/
create table MOBIL 
(
   ID_MOBIL             char(7)                        not null,
   MERK_MOBIL           varchar(20)                    null,
   TAHUN                date                           null,
   HARGA_SEWA           numeric(8,2)                   null,
   constraint PK_MOBIL primary key (ID_MOBIL)
);


/*==============================================================*/
/* Table: PEGAWAI                                               */
/*==============================================================*/
create table PEGAWAI 
(
   ID_PEGAWAI           char(6)                        not null,
   ID_JABATAN           char(6)                        not null,
   NAMA_PEGAWAI         varchar(30)                    null,
   ALAMAT               varchar(50)                    null,
   constraint PK_PEGAWAI primary key (ID_PEGAWAI)
);



/*==============================================================*/
/* Table: PENYEWA                                               */
/*==============================================================*/
create table PENYEWA 
(
   ID_PENYEWA           char(6)                        not null,
   NAMA_PENYEWA         varchar(30)                    null,
   ALAMAT_PENYEWA       varchar(50)                    null,
   TELP_PENYEWA         varchar(15)                    null,
   NO_TANDA_PENGENAL    varchar(20)                    null,
   constraint PK_PENYEWA primary key (ID_PENYEWA)
);



/*==============================================================*/
/* Table: PENYEWAAN                                             */
/*==============================================================*/
create table PENYEWAAN 
(
   ID_SEWA              char(6)                        not null,
   ID_PENYEWA           char(6)                        not null,
   ID_PEGAWAI           char(6)                        not null,
   TGL_MULAI_SEWA       date                           null,
   TGL_AKHIR_SEWA       date                           null,
   constraint PK_PENYEWAAN primary key (ID_SEWA)
);

/*==============================================================*/
/* Table: DETAIL_SEWA                                           */
/*==============================================================*/
create table DETAIL_SEWA 
(
   ID_MOBIL             char(7)                        not null,
   ID_SEWA              char(6)                        not null,
   TGL_BAYAR            date                           null,
   HARGA_TOTAL          numeric(10,2)                  null,
   constraint PK_DETAIL_SEWA primary key (ID_MOBIL, ID_SEWA)
);

alter table DETAIL_SEWA
   add constraint FK_DETAIL_S_MEMPUNYAI_MOBIL foreign key (ID_MOBIL)
      references MOBIL (ID_MOBIL);

alter table DETAIL_SEWA
   add constraint FK_DETAIL_S_MEMPUNYAI_PENYEWAA foreign key (ID_SEWA)
      references PENYEWAAN (ID_SEWA);

alter table PEGAWAI
   add constraint FK_PEGAWAI_MEMPUNYAI_JABATAN foreign key (ID_JABATAN)
      references JABATAN (ID_JABATAN);
      
-- INSERTING into MOBIL
Insert into MOBIL values ('L4732AZ','KIJANG INOVA',to_date('2007-01-01','YYYY-MM-DD'),350000);
Insert into MOBIL values ('L3285FR','SUZUKI CARRY',to_date('2005-01-01','YYYY-MM-DD'),250000);
Insert into MOBIL values ('L5639KM','MERCEDES BENZ',to_date('2008-01-01','YYYY-MM-DD'),900000);
Insert into MOBIL values ('L3853VB','TOYOTA AVANZA',to_date('2007-01-01','YYYY-MM-DD'),300000);
Insert into MOBIL values ('L4871AS','SUZUKI APV',to_date('2006-01-01','YYYY-MM-DD'),350000);
Insert into MOBIL values ('L6774VC','HONDA JAZZ',to_date('2008-01-01','YYYY-MM-DD'),400000);

-- INSERTING into JABATAN
Insert into JABATAN values ('AD001','ADMINISTRASI',150000);
Insert into JABATAN values ('SO001','SOPIR',100000);


-- INSERTING into PEGAWAI
Insert into PEGAWAI values ('PEG001','AD001 ','RAHMA','SURABAYA');
Insert into PEGAWAI values ('PEG002','AD001 ','FITRI','MALANG');
Insert into PEGAWAI values ('PEG003','SO001 ','CHARLIE','MAKASSAR');
Insert into PEGAWAI values ('PEG004','SO001 ','JAMES','BOGOR');
Insert into PEGAWAI values ('PEG005','SO001 ','ARIEL','BANDUNG');
Insert into PEGAWAI values ('PEG006','SO001 ','BOB','SURABAYA');
INSERT INTO PEGAWAI VALUES ('PEG007', 'AD001', 'ESTI', 'SURABAYA');

-- INSERTING into PENYEWA
Insert into PENYEWA values ('PEN003','HARI','SURABAYA','0317525537','12564587965');
Insert into PENYEWA values ('PEN002','BUDI','MALANG','08123456789','12561548796');
Insert into PENYEWA values ('PEN001','LELY','SURABAYA','085645357504','125615160488');

-- INSERTING into PENYEWAAN
Insert into PENYEWAAN values ('SE0001','PEN001','PEG001',to_date('2009-02-28','YYYY-MM-DD'),to_date('2009-03-01','YYYY-MM-DD'));
Insert into PENYEWAAN values ('SE0002','PEN002','PEG002',to_date('2009-03-01','YYYY-MM-DD'),to_date('2009-03-03','YYYY-MM-DD'));
Insert into PENYEWAAN values ('SE0003','PEN003','PEG001',to_date('2009-03-01','YYYY-MM-DD'),to_date('2009-03-02','YYYY-MM-DD'));
Insert into PENYEWAAN values ('SE0004','PEN001','PEG002',to_date('2009-03-02','YYYY-MM-DD'),to_date('2009-03-03','YYYY-MM-DD'));

-- INSERTING into DETAIL_SEWA
Insert into DETAIL_SEWA values ('L6774VC','SE0001',to_date('2009-03-01','YYYY-MM-DD'),800000);
Insert into DETAIL_SEWA values ('L5639KM','SE0001',to_date('2009-03-01','YYYY-MM-DD'),900000);
Insert into DETAIL_SEWA values ('L3853VB','SE0001',to_date('2009-03-01','YYYY-MM-DD'),600000);
Insert into DETAIL_SEWA values ('L4871AS','SE0002',to_date('2009-03-03','YYYY-MM-DD'),105000);
Insert into DETAIL_SEWA values ('L5639KM','SE0003',to_date('2009-03-02','YYYY-MM-DD'),900000);
Insert into DETAIL_SEWA values ('L3853VB','SE0004',to_date('2009-03-02','YYYY-MM-DD'),600000);

 