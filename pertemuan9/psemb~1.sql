

--1 Tampilkan data barang yang memiliki stok paling minimal!
SELECT * FROM BARANG WHERE STOK_BARANG = (SELECT MIN(STOK_BARANG) FROM BARANG);

--2 Tampilkan data pembelian yang memiliki jumlah pembelian diatas rata-rata!
SELECT * FROM PEMBELIAN WHERE JUMLAH_PEMBELIAN > (SELECT AVG(JUMLAH_PEMBELIAN) FROM PEMBELIAN);

--3 Tampilkan data pembelian untuk data barang yang memiliki stok paling minimal!
SELECT * FROM PEMBELIAN WHERE KODE_BARANG = (SELECT KODE_BARANG FROM BARANG WHERE STOK_BARANG = (SELECT MIN(STOK_BARANG) FROM BARANG));

--4 Tampilkan data pembelian untuk barang yang bukan ‘lemari es’!
SELECT * FROM PEMBELIAN WHERE KODE_BARANG IN (SELECT KODE_BARANG FROM BARANG WHERE UPPER(NAMA_BARANG) != 'LEMARI ES');

--5 Tampilkan data pembelian untuk pembelian yang memiliki jumlah pembelian lebih dari jumlah stok barang!
SELECT * FROM PEMBELIAN WHERE JUMLAH_PEMBELIAN > (SELECT STOK_BARANG FROM BARANG WHERE KODE_BARANG = PEMBELIAN.KODE_BARANG);