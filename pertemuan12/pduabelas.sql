--1
CREATE OR REPLACE PROCEDURE CARI_NAMA_SUPLIER
IS 
    VNAMASUPLIER SUPLIER.NAMA_SUPLIER%TYPE;
BEGIN
    SELECT NAMA_SUPLIER INTO VNAMASUPLIER FROM SUPLIER WHERE KODE_SUPLIER='s001';
    DBMS_OUTPUT.PUT_LINE('Namanya : ' || VNAMASUPLIER);
END;
/
SET SERVEROUTPUT ON
EXECUTE CARI_NAMA_SUPLIER;


--2
CREATE OR REPLACE FUNCTION CARI_NAMASUPLIER
    RETURN SUPLIER.NAMA_SUPLIER%TYPE
IS 
    VNAMASUPLIER SUPLIER.NAMA_SUPLIER%TYPE;
BEGIN
    SELECT NAMA_SUPLIER INTO VNAMASUPLIER FROM SUPLIER WHERE KODE_SUPLIER='s001';
    RETURN VNAMASUPLIER;
END;
/
DECLARE
    NAMA SUPLIER.NAMA_SUPLIER%TYPE;
BEGIN
    NAMA:= CARI_NAMASUPLIER;
    DBMS_OUTPUT.PUT_LINE(NAMA);
END;
/


--3
CREATE OR REPLACE PROCEDURE CARI_NAMA_SUPLIER_PARAMETER (VKODE_SUPLIER IN SUPLIER.KODE_SUPLIER%TYPE)
IS 
    VNAMASUPLIER SUPLIER.NAMA_SUPLIER%TYPE;
BEGIN
    SELECT NAMA_SUPLIER INTO VNAMASUPLIER FROM SUPLIER WHERE KODE_SUPLIER=VKODE_SUPLIER;
    DBMS_OUTPUT.PUT_LINE('Namanya : ' || VNAMASUPLIER);
END;
/
EXECUTE CARI_NAMA_SUPLIER_PARAMETER('s001');
EXECUTE CARI_NAMA_SUPLIER_PARAMETER('s002');
EXECUTE CARI_NAMA_SUPLIER_PARAMETER('c003');
/
--4.1 (CARA1)
CREATE OR REPLACE PROCEDURE CARI_NAMA_SUPLIER_PARAMETER_OUT (VNAMASUPLIER OUT SUPLIER.NAMA_SUPLIER%TYPE)
IS 
BEGIN
    SELECT NAMA_SUPLIER INTO VNAMASUPLIER FROM SUPLIER WHERE KODE_SUPLIER='s001';
END;
/
DECLARE
    NAMA_SUPLIER_OUT SUPLIER.NAMA_SUPLIER%TYPE;
BEGIN
    CARI_NAMA_SUPLIER_PARAMETER_OUT(NAMA_SUPLIER_OUT);
    DBMS_OUTPUT.PUT_LINE('Namanya : ' || NAMA_SUPLIER_OUT);
END;
/
--4.2 (CARA2)
CREATE OR REPLACE PROCEDURE CARI_NAMA_SUPLIER_PARAMETER_OUT (VNAMASUPLIER OUT SUPLIER.NAMA_SUPLIER%TYPE, VKODE_SUPLIER IN SUPLIER.KODE_SUPLIER%TYPE)
IS 
BEGIN
    SELECT NAMA_SUPLIER INTO VNAMASUPLIER FROM SUPLIER WHERE KODE_SUPLIER=VKODE_SUPLIER;
END;
/
DECLARE
    NAMA_SUPLIER_OUT SUPLIER.NAMA_SUPLIER%TYPE;
BEGIN
    CARI_NAMA_SUPLIER_PARAMETER_OUT(NAMA_SUPLIER_OUT, 's001');
    DBMS_OUTPUT.PUT_LINE('Namanya : ' || NAMA_SUPLIER_OUT);
END;
/


--5
CREATE OR REPLACE PROCEDURE CARI_NAMA_SUPLIER_PARAMETER_INOUT (VNAMASUPLIER IN OUT SUPLIER.NAMA_SUPLIER%TYPE, VKODE_SUPLIER IN SUPLIER.KODE_SUPLIER%TYPE)
IS 
BEGIN
    SELECT NAMA_SUPLIER INTO VNAMASUPLIER FROM SUPLIER WHERE KODE_SUPLIER=VKODE_SUPLIER;
END;
/
DECLARE
    NAMA_SUPLIER_OUT SUPLIER.NAMA_SUPLIER%TYPE;
BEGIN
    CARI_NAMA_SUPLIER_PARAMETER_INOUT(NAMA_SUPLIER_OUT, 's001');
    DBMS_OUTPUT.PUT_LINE('Namanya : ' || NAMA_SUPLIER_OUT);
END;
/