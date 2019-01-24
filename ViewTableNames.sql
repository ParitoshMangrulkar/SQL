DECLARE
  VAR1 LONG;
  VAR2 VARCHAR2(4000);
  VAR3 NUMBER;
  VAR4 VARCHAR2(4000);
  VAR5 VARCHAR2(4000);
  --TYPE TABLE_COL1 IS TABLE OF LONG INDEX BY PLS_INTEGER;
  TYPE tbl_rec IS RECORD (
    view_name VARCHAR2(200),
    tbl_name VARCHAR2(4000)
  );
  TYPE TABLE_COL1 is table of tbl_rec;
  TABLE_COL TABLE_COL1;
  
BEGIN
  SELECT view_name, TEXT BULK COLLECT INTO TABLE_COL  FROM ALL_VIEWS WHERE owner = 'DS';  
  
   FOR indx IN 1 .. TABLE_COL.COUNT
      LOOP
      VAR2 := UPPER(SUBSTR(TABLE_COL(indx).tbl_name, 1, 4000));
      VAR3 := INSTR(VAR2, 'DS.', 1,1);
      VAR4 := SUBSTR( VAR2, VAR3+3);
      DBMS_OUTPUT.PUT_LINE(indx||','||trim(VAR4)||','||trim(TABLE_COL(indx).view_name));
    --  DBMS_OUTPUT.PUT_LINE(TABLE_COL(indx).view_name);
      END LOOP;      
END;
