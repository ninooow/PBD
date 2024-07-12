SET SERVEROUTPUT ON;

BEGIN DBMS_OUTPUT.PUT_LINE('Belajar Oracle');
END;
/
DECLARE teks VARCHAR2(20);
BEGIN 
teks := 'Belajar Oracle1';
DBMS_OUTPUT.PUT_LINE(teks);
END;
/
DECLARE 
X INTEGER;
ALAMAT VARCHAR2(40);
NO_INDUK CHAR(8);
BEGIN
X:=12;
ALAMAT:= 'Gelatik dalam 391, Bandung';
NO_INDUK := 'DOG29549';
DBMS_OUTPUT.PUT_LINE(X);
DBMS_OUTPUT.PUT_LINE(ALAMAT);
DBMS_OUTPUT.PUT_LINE(NO_INDUK);
END;
/
DECLARE
PI CONSTANT REAL:=3.14;
X INTEGER;
Y REAL;
BEGIN
Y:= PI*100;
DBMS_OUTPUT.PUT_LINE(Y);
X:='BELAJAR ORACLE TAPI SALAH';
EXCEPTION
WHEN VALUE_ERROR THEN 
DBMS_OUTPUT.PUT_LINE('TIPE DATA SALAH');
DBMS_OUTPUT.PUT_LINE(Y);
END;
/


DECLARE
    -- Deklarasi tipe rekaman (record)
    TYPE Alamat IS RECORD (
        NamaJalan VARCHAR2(100),
        NoJalan NUMBER,
        NoRumah VARCHAR2(5),
        Kota VARCHAR2(20)
    );
    TYPE PemilikRumah IS RECORD(
        Nama VARCHAR2(100),
        Domisili Alamat);

-- Deklarasi variabel dari tipe rekaman (record)
    PM PemilikRumah;

BEGIN
    -- Mengisi nilai ke dalam rekaman (record)
    PM.NAMA:='NINO';
    PM.Domisili.NamaJalan := 'Jalan Kenangan';
    PM.Domisili.NoJalan := 123;
    PM.Domisili.NoRumah := 'B12';
    PM.Domisili.Kota := 'Jakarta';

    -- Menampilkan nilai dari rekaman (record)
    DBMS_OUTPUT.PUT_LINE('Namaa:'||PM.NAMA);
    DBMS_OUTPUT.PUT_LINE('Nama Jalan: ' || PM.Domisili.NamaJalan);
    DBMS_OUTPUT.PUT_LINE('No Jalan: ' || PM.Domisili.NoJalan);
    DBMS_OUTPUT.PUT_LINE('No Rumah: ' || PM.Domisili.NoRumah);
    DBMS_OUTPUT.PUT_LINE('Kota: ' || PM.Domisili.Kota);
END;
/
