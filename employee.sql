-- TRIGGERS IN MYSQL
-- IN MY SQL TRIGGER IS A DATABASE OBJECT THAT IS AUTOMATICALLY
-- EXECUTE OR FIRED IN RESPONCE TO CERTAIN EVENTS OR ACTION 
-- LIKE(UPDATE,AFTER,BEFORE,ETC)
-- TRIGGERS ARE USED TO ENFORCE BUSINESS RULES THAT MAINTAIN 
-- DATA INTEGRITY AND AUTOMATE TASK WITHIN DATABASE...


CREATE DATABASE SBI_BANK;
USE SBI_BANK;
CREATE TABLE MAIN_TABLE(
CUS_ID INT AUTO_INCREMENT PRIMARY KEY,
CUS_NAME VARCHAR(50),
CUS_AC_NO BIGINT UNIQUE,
CUS_MOB_NO BIGINT UNIQUE,
CUS_BALANCE BIGINT,
CUS_CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CUS_UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE BACKUP_TABLE(
CUS_ID INT ,
CUS_NAME VARCHAR(50),
CUS_AC_NO BIGINT UNIQUE,
CUS_MOB_NO BIGINT UNIQUE,
CUS_BALANCE BIGINT,
CUS_CREATED_AT TIMESTAMP,
CUS_UPDATED_AT TIMESTAMP,
CUS_DELETED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CREATING TRIGGER...
DELIMITER //
CREATE TRIGGER BEFORE_MAIN_TABLE_DELETE
BEFORE DELETE ON MAIN_TABLE
FOR EACH ROW
	BEGIN
		INSERT INTO BACKUP_TABLE (CUS_ID,CUS_NAME,
        CUS_AC_NO,CUS_MOB_NO,CUS_BALANCE,CUS_CREATED_AT,CUS_UPDATED)
        VALUES(OLD.CUS_ID,
        OLD.CUS_NAME,
        OLD.CUS_AC_NO,
        OLD.CUS_MOB_NO,
        OLD.CUS_BALANCE,
        OLD.CUS_CREATED_AT,
        OLD.CUS_UPDATED_AT
        );
	END;
    //
    DELIMITER ;
INSERT INTO MAIN_TABLE(CUS_NAME,CUS_AC_NO,CUS_MOB_NO,CUS_BALANCE)
VALUES("ABHISHEK",16001570,6200659670,1800000,
"DEVASHISH",16001578,6200659671,5800000,
"SNEHA",16001545,6200659674,4800000,
"AMISHA",16001578,6200659677,2800000,
"RANJEET",16001571,6200659679,2000000);

SELECT * FROM MAIN_TABLE;
SELECT * FROM BACKUP_TABLE;
        