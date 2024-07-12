--LATIHAN 1
--NOMOR 1
CREATE OR REPLACE TRIGGER TR_COBA
    AFTER UPDATE ON BARANG
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Tabel barang telah diupdate');
END;
/
--NOMOR 2
SET SERVEROUTPUT ON
UPDATE BARANG
SET STOK_BARANG = 15
WHERE KODE_BARANG = 'B001';
--NOMOR 3
CREATE OR REPLACE TRIGGER TR_CEKSTOKBARANG
    BEFORE INSERT ON BARANG
    FOR EACH ROW
BEGIN
    IF(:NEW.STOK_BARANG<0)
    THEN
        :NEW.STOK_BARANG := 0;
        DBMS_OUTPUT.PUT_LINE('Stok barang diubah menjadi 0');
    END IF;
END;
/
INSERT INTO BARANG VALUES('B006', 'kursi', 'unit', -5);
SELECT * FROM BARANG;

--LATIHAN 2
--NOMOR 1
CREATE OR REPLACE TRIGGER TR_INSERT_PASOK
    AFTER INSERT ON PASOK
    FOR EACH ROW
BEGIN
    UPDATE BARANG SET STOK_BARANG = STOK_BARANG + :NEW.JUMLAH_PASOK WHERE KODE_BARANG = :NEW.KODE_BARANG;
END;
/
--NOMOR 2
INSERT INTO PASOK VALUES('P004', 'B002', 's002', 5);
SELECT * FROM PASOK;
SELECT * FROM BARANG;
