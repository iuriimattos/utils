oracle loop 
```
DECLARE
    V_CD_USER           VARCHAR2(242) := 'ADMINISTRADOR';
    V_PERSON_ID         NUMBER        := 0;
    V_PERSON_ADDRESS_ID NUMBER        := 0;
    V_COUNT             NUMBER        := 0;
BEGIN
    FOR X IN ( SELECT TP.CD_PERSON,
                      TP.NM_PERSON,
                      TP.NB_PERSON,
                      TP.DT_PERSON,
                      TP.VL_PERSON,
                      TPA.ID_PERSON_ADDRESS,
                      TPA.ID_PERSON_NUMBER
               FROM TMP_PERSON TP
                        JOIN TMP_PERSON_ADDRESS TCS ON TPA.ID_ADDRESS = TP.ID_ADDRESS)
        LOOP
            SELECT COUNT(*) INTO V_COUNT FROM TBG_PERSON WHERE CD_PERSON = X.CD_PERSON;
            DBMS_OUTPUT.PUT_LINE('V_COUNT: ' || V_COUNT);
            IF V_COUNT > 0 THEN
                DBMS_OUTPUT.PUT_LINE('1111');
                select (SELECT ID_ADDRESS
                        FROM (SELECT C1.ID_ADDRESS
                              FROM TBG_PERSON C1
                              WHERE C1.CD_PERSON = X.CD_PERSON
                                AND C1.NM_PERSON = X.NM_PERSON
                                AND C1.NB_PERSON = X.NB_PERSON
                                AND C1.DT_PERSON = X.DT_PERSON
                                AND C1.VL_PERSON = X.VL_PERSON))
                into V_PERSON_ID
                from dual;
                DBMS_OUTPUT.PUT_LINE('1111 X.CD_PERSON: ' || X.CD_PERSON);
                DBMS_OUTPUT.PUT_LINE('2222');
                SELECT SEQ_TBG_PERSON_ADDRESS.NEXTVAL INTO V_PERSON_ADDRESS_ID FROM dual;
                DBMS_OUTPUT.PUT_LINE('2222 V_PERSON_ADDRESS_ID: ' || V_PERSON_ADDRESS_ID);
                DBMS_OUTPUT.PUT_LINE('2222 X.ID_PERSON_ADDRESS: ' || X.ID_PERSON_ADDRESS);
                INSERT INTO TBG_PERSON_ADDRESS(ID_PERSON_ADDRESS,
                                               ID_PERSON,
                                               ID_PERSON_VL,
                                               ID_PERSON_NUMBER,
                                               CD_USER,
                                               DT_UPDATED)
                VALUES (V_PERSON_ADDRESS_ID,
                        V_PERSON_ID,
                        X.ID_PERSON_VL,
                        X.ID_PERSON_NUMBER,
                        V_CD_USER,
                        SYSDATE);
            ELSE
                DBMS_OUTPUT.PUT_LINE('1111');
                DBMS_OUTPUT.PUT_LINE('1111 X.CD_PERSON: ' || X.CD_PERSON);
                SELECT SEQ_TBG_PERSON.NEXTVAL INTO V_PERSON_ID FROM dual;
                DBMS_OUTPUT.PUT_LINE('1111 V_PERSON_ID: ' || V_PERSON_ID);
                DBMS_OUTPUT.PUT_LINE('V_COUNT: ' || V_COUNT);
                DBMS_OUTPUT.PUT_LINE('2222');
                SELECT SEQ_TBG_PERSON_ADDRESS.NEXTVAL INTO V_PERSON_ADDRESS_ID FROM dual;
                DBMS_OUTPUT.PUT_LINE('2222 V_PERSON_ADDRESS_ID: ' || V_PERSON_ADDRESS_ID);
                DBMS_OUTPUT.PUT_LINE('2222 X.ID_PERSON_ADDRESS: ' || X.ID_PERSON_ADDRESS);
                INSERT INTO TBG_PERSON (ID_PERSON,
                                        CD_PERSON,
                                        NM_PERSON,
                                        NB_PERSON,
                                        DT_PERSON,
                                        VL_PERSON,
                                        CD_USER,
                                        DT_UPDATED)
                VALUES (V_PERSON_ID,
                        X.CD_PERSON,
                        X.NM_PERSON,
                        X.NB_PERSON,
                        X.DT_PERSON,
                        X.VL_PERSON,
                        V_CD_USER,
                        SYSDATE);
                DBMS_OUTPUT.PUT_LINE('step2');
                SELECT SEQ_TBG_PERSON_ADDRESS.NEXTVAL INTO V_PERSON_ADDRESS_ID FROM dual;
                DBMS_OUTPUT.PUT_LINE('step2 V_PERSON_ADDRESS_ID: ' || V_PERSON_ADDRESS_ID);
                INSERT INTO TBG_PERSON_ADDRESS(ID_PERSON_ADDRESS,
                                               ID_PERSON,
                                               ID_PERSON_VL,
                                               ID_PERSON_NUMBER,
                                               CD_USER,
                                               DT_UPDATED)
                VALUES (V_PERSON_ADDRESS_ID,
                        V_PERSON_ID,
                        X.ID_PERSON_VL,
                        X.ID_PERSON_NUMBER,
                        V_CD_USER,
                        SYSDATE);
            END IF;
        END LOOP;
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SUBSTR(SQLERRM, 1, 250));
END;
```
