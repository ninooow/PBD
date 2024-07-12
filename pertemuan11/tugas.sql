--LATIHAN 1 (DASAR)
--1
BEGIN
DBMS_OUTPUT.PUT_LINE('Belajar Oracle');
END;
/

--2
SET SERVEROUTPUT ON
/

--3
DECLARE 
NAMA VARCHAR2(30);
ALAMAT VARCHAR2(30);
BEGIN
SELECT NAMA_CUSTOMER, ALAMAT_CUSTOMER INTO NAMA, ALAMAT
FROM CUSTOMER WHERE KODE_CUSTOMER='s001';
DBMS_OUTPUT.PUT_LINE('Data Customer dengan Kode c001');
DBMS_OUTPUT.PUT_LINE('Nama : '||NAMA);
DBMS_OUTPUT.PUT_LINE('Alamat : ' || ALAMAT);
END;
/


--LATIHAN 2 (RECORD)
DECLARE
TYPE Alamat IS RECORD (
    NamaJalan VARCHAR2(100),
    NoJalan NUMBER,
    NoRumah VARCHAR2(5),
    Kota VARCHAR2(20)
);
TYPE PemilikRumah IS RECORD(
    Nama VARCHAR2(100),
    Domisili Alamat
);
    REC PemilikRumah;
BEGIN
    REC.Nama := 'Ahmad Budianto';
    REC.Domisili.NamaJalan := 'Jalan Melati';
    REC.Domisili.NoJalan := 10;
    REC.Domisili.NoRumah := '10B' ;
    REC.Domisili.Kota := 'Palembang' ;
    DBMS_OUTPUT.PUT_LINE (REC.Nama);
    DBMS_OUTPUT.PUT_LINE (REC.Domisili.NamaJalan ||' ' ||
    REC.Domisili.NoJalan || ' ' ||'No' || ' ' || 
    REC.Domisili.NoRumah || ' ' || REC.Domisili.kota);
END; 
/


--Latihan 3 (ARRAY)
DECLARE
    TYPE LARIK IS TABLE OF NUMBER
        INDEX BY BINARY_INTEGER ;
    A LARIK ;
BEGIN
    A(1) := 10; 
    A(2) := 20;
    A(3) := 30; 
    A(4) := 40;
    DBMS_OUTPUT.PUT_LINE('Nilai elemen larik ke 1 : '|| to_char(A(1)));
    DBMS_OUTPUT.PUT_LINE('Nilai elemen larik ke 2 : '|| to_char(A(2)));
    DBMS_OUTPUT.PUT_LINE('Nilai elemen larik ke 3 : '|| to_char(A(3)));
    DBMS_OUTPUT.PUT_LINE('Nilai elemen larik ke 4 : '|| to_char(A(4)));
END;
/

--lATIHAN 4 (PERCABANGAN)
--1
DECLARE
    BIL INTEGER := 100;
BEGIN
    IF MOD(BIL,2)=0 THEN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(BIL)|| ' adalah bilangan Genap');
    END IF;
END;
/ 

--2
DECLARE
    BIL INTEGER := 100;
BEGIN
    IF MOD(BIL,2)=0 THEN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(BIL)|| ' adalah bilangan Genap');
    ELSIF MOD(BIL,2)<>0 THEN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(BIL)|| ' adalah bilangan Ganjil');
    END IF;
END;
/ 

--3
DECLARE
    BIL INTEGER := 100;
BEGIN
    IF BIL<0 THEN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(BIL)|| ' adalah bilangan Negatif');
    ELSIF MOD(BIL,2)=0 THEN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(BIL)|| ' adalah bilangan Genap');
    ELSIF MOD(BIL,2)<>0 THEN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(BIL)|| ' adalah bilangan Ganjil');
    END IF;
END;
/ 

--LATIHAN 5 (PERULANGAN)
--1
DECLARE
    I integer;
BEGIN
    I := 0;
    LOOP
        I:=I +1;
        DBMS_OUTPUT.PUT_LINE('Sukes dengan Oracle');
        EXIT WHEN i=10;
    END LOOP;
END;
/ 

--2
DECLARE
    I integer;
BEGIN
    I := 0;
    WHILE I<10 LOOP
        I:=I +1;
        DBMS_OUTPUT.PUT_LINE('Sukes dengan Oracle');
    END LOOP;
END;
/ 

--3
DECLARE
    I integer;
BEGIN
    FOR I IN  1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('Sukes dengan Oracle');
    END LOOP;
END;
/ 