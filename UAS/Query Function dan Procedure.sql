SET SERVEROUTPUT ON;

--FUNCTION UNTUK MENGHITUNG BEASISWA PADA JENJANG TERTENTU
CREATE OR REPLACE FUNCTION COUNT_BEASISWA_JENJANG(VJENJANG IN JENJANG.JENJANG_PENDIDIKAN%TYPE)
    RETURN INT
IS 
    BANYAK_BEASISWA INT;
BEGIN
    SELECT COUNT(BJ.ID_BEASISWA) INTO BANYAK_BEASISWA FROM JENJANG J JOIN BEASISWA_JENJANG BJ ON(J.ID_JENJANG = BJ.ID_JENJANG) 
    WHERE J.JENJANG_PENDIDIKAN = VJENJANG;
    RETURN BANYAK_BEASISWA;
END;
/
--MEMANGGIL FUNGSI COUNT_BEASISWA_JENJANG
DECLARE
    BANYAK_BEASISWA INT;
    JENJANG_PENDIDIKAN JENJANG.JENJANG_PENDIDIKAN%TYPE;
BEGIN
    JENJANG_PENDIDIKAN:='D4';
    BANYAK_BEASISWA:= COUNT_BEASISWA_JENJANG(JENJANG_PENDIDIKAN);
    DBMS_OUTPUT.PUT_LINE('BANYAK BEASISWA PADA JENJANG '||JENJANG_PENDIDIKAN|| ' YAITU ' || BANYAK_BEASISWA||'.');
END;
/

--PROCEDURE UNTUK MENGUPDATE KETIKA TERJADI PERUBAHAN TANGGAL AKHIR BEASISWA
CREATE OR REPLACE PROCEDURE UPDATE_TANGGAL_AKHIR (
    VID_BEASISWA JENIS_BEASISWA.ID_BEASISWA%TYPE, 
    VTANGGAL_AKHIR_BARU JENIS_BEASISWA.TANGGAL_AKHIR%TYPE)
IS
BEGIN
    UPDATE JENIS_BEASISWA
    SET JENIS_BEASISWA.TANGGAL_AKHIR = VTANGGAL_AKHIR_BARU
    WHERE JENIS_BEASISWA.ID_BEASISWA = VID_BEASISWA;
    DBMS_OUTPUT.PUT_LINE('TELAH DILAKUKAN PERUBAHAN');
END;
/
--FUNGSI UNTUK MENGUBAH DARI NAMA BEASISWA MENJADI ID BEASISWA
CREATE OR REPLACE FUNCTION GET_ID_BEASISWA(VNAMA_BEASISWA IN JENIS_BEASISWA.NAMA_BEASISWA%TYPE)
    RETURN JENIS_BEASISWA.ID_BEASISWA%TYPE
IS
    VID_BEASISWA JENIS_BEASISWA.ID_BEASISWA%TYPE;
BEGIN
    SELECT ID_BEASISWA INTO VID_BEASISWA FROM JENIS_BEASISWA WHERE NAMA_BEASISWA = VNAMA_BEASISWA;
    RETURN VID_BEASISWA;
END;
/
--MEMANGGIL PROCEDURE UPDATE TANGGAL AKHIR BEASISWA DENGAN MENGUBAH NAMA BEASISWA MENJADI ID BEASISWA MENGGUNAKAN FUNGSI GET_ID_BEASISWA
DECLARE
    VNAMA_BEASISWA JENIS_BEASISWA.NAMA_BEASISWA%TYPE;
    VID_BEASISWA JENIS_BEASISWA.ID_BEASISWA%TYPE;
    VTANGGAL_AKHIR_BARU JENIS_BEASISWA.TANGGAL_AKHIR%TYPE;
BEGIN
    VNAMA_BEASISWA := 'Beasiswa Unggulan';
    VID_BEASISWA := GET_ID_BEASISWA(VNAMA_BEASISWA);
    VTANGGAL_AKHIR_BARU := TO_DATE('2025-07-30', 'YYYY-MM-DD');
    UPDATE_TANGGAL_AKHIR(VID_BEASISWA,VTANGGAL_AKHIR_BARU);
END;
/