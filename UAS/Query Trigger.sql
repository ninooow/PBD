SET SERVEROUTPUT ON;
--TRIGGER YANG MENGINFORMASIKAN KETIKA TELAH MELAKUKAN INSERT BARIS PADA TABEL JENIS BEASISWA
CREATE OR REPLACE TRIGGER TAMBAH_BEASISWA
    AFTER INSERT ON JENIS_BEASISWA
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('BEASISWA TELAH DITAMBAHKAN');
END;
/


--TRIGGER YANG AKAN MENGHAPUS BARIS YANG MEMUAT FOREIGN KEY DARI TABEL JENIS BEASISWA YANG ADA DI TABEL LAIN
CREATE OR REPLACE TRIGGER DELETE_BEASISWA
    AFTER DELETE ON JENIS_BEASISWA
    FOR EACH ROW
BEGIN
    DELETE PENYEDIA_BEASISWA WHERE ID_PENYEDIA = :OLD.ID_PENYEDIA;
    DELETE BEASISWA_NEGARA WHERE ID_BEASISWA = :OLD.ID_BEASISWA;
    DELETE BEASISWA_JENJANG WHERE ID_BEASISWA = :OLD.ID_BEASISWA;
    DBMS_OUTPUT.PUT_LINE('BEASISWA TELAH DIHAPUS BESERTA PENYEDIA BEASISWA DAN HUBUNGANNYA DENGAN TABEL NEGARA DAN JENJANG');
END;
/

DELETE JENIS_BEASISWA WHERE ID_BEASISWA = 'B50';

INSERT INTO PENYEDIA_BEASISWA (ID_PENYEDIA, NAMA_PENYEDIA, WEBSITE_PENYEDIA) VALUES
('PB50', 'Yayasan Pendidikan Bangsa Maju', 'https://www.ypbm.org');
INSERT INTO JENIS_BEASISWA (ID_BEASISWA, ID_PENYEDIA, NAMA_BEASISWA, DESKRIPSI_BEASISWA, PERSYARATAN, BESARAN_DANA, TANGGAL_MULAI, TANGGAL_AKHIR) VALUES
('B50', 'PB50', 'Beasiswa Bangsa Maju', 'Beasiswa untuk bangsa yang maju.', 'IPK minimal 3.4', 10000000, TO_DATE('2028-07-01', 'YYYY-MM-DD'), TO_DATE('2029-06-30', 'YYYY-MM-DD'));
INSERT INTO BEASISWA_NEGARA (ID_DETAIL_BEASISWA, ID_BEASISWA, ID_NEGARA) VALUES
('BN77', 'B50', 'NG1');
INSERT INTO BEASISWA_JENJANG (ID_BEA_JENJANG, ID_BEASISWA, ID_JENJANG) VALUES
('BJ83', 'B50', 'JJ2');