SELECT NO_TANDA_PENGENAL, NAMA_PENYEWA, TELP_PENYEWA FROM PENYEWA;

SELECT * FROM MOBIL;

SELECT ID_MOBIL "Plat Nomer", MERK_MOBIL AS Merk, HARGA_SEWA * (106/100) "Harga" FROM MOBIL;

DESC MOBIL;

--MERK MOBIL PLAT MOBIL DISEWAKAN RP HARGA SEWA

SELECT 'Mobil '||MERK_MOBIL||' dengan Plat '||ID_MOBIL||' disewakan Rp'||HARGA_SEWA FROM MOBIL;

SELECT DISTINCT (MERK_MOBIL) FROM MOBIL;

--TUGAS PERTEMUAN 2 PDB

SELECT * FROM PEGAWAI;

SELECT NAMA_PEGAWAI, ALAMAT FROM PEGAWAI;

SELECT ID_MOBIL, TGL_BAYAR, HARGA_TOTAL FROM DETAIL_SEWA;

SELECT DISTINCT (ALAMAT) FROM PEGAWAI;

SELECT 'Pegawai '||NAMA_PEGAWAI||' berasal dari kota '||ALAMAT FROM PEGAWAI;

SELECT ID_MOBIL "PLAT NOMER", TGL_BAYAR "TANGGAL BAYAR", HARGA_TOTAL "HARGA TOTAL", HARGA_TOTAL*0.9 "HARGA DISKON" FROM DETAIL_SEWA; 

SELECT NAMA_PEGAWAI, ALAMAT FROM PEGAWAI WHERE ALAMAT = 'SURABAYA';

SELECT * FROM DETAIL_SEWA WHERE TGL_BAYAR > '01-03-2009';

SELECT * FROM DETAIL_SEWA WHERE HARGA_TOTAL > 500000;

SELECT * FROM PEGAWAI WHERE ID_JABATAN = 'AD001';



