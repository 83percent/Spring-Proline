CREATE DATABASE PROLINE;

USE PROLINE;

CREATE TABLE TUD_MST (
	USR_CD INT NOT NULL AUTO_INCREMENT,
    USR_ID VARCHAR(36) NOT NULL UNIQUE,
    USR_PW CHAR(64) NOT NULL,
    USR_NM VARCHAR(10) NOT NULL,
    COLOR CHAR(6) NOT NULL,
    REG_ID TIMESTAMP DEFAULT current_timestamp,
    
    PRIMARY KEY (USR_CD)
);

CREATE TABLE TPD_MST (
	PRO_CD INT NOT NULL AUTO_INCREMENT,
    PRO_NM VARCHAR(16) NOT NULL,
    START_TM DATETIME NOT NULL,
    DEADLINE DATETIME NOT NULL,
    PRO_STATUS CHAR(2) NOT NULL, -- ST001
    USR_CD INT,
    REG_ID TIMESTAMP DEFAULT current_timestamp,
    PRIMARY KEY (PRO_CD),
    FOREIGN KEY (USR_CD) REFERENCES TUD_MST(USR_CD) ON DELETE SET NULL
);

CREATE TABLE TPD_MEMBER (
	PRO_CD INT NOT NULL,
    USR_CD INT NOT NULL,
    INV_TM TIMESTAMP DEFAULT current_timestamp,
    PRIMARY KEY (PRO_CD, USR_CD),
    FOREIGN KEY (PRO_CD) REFERENCES TPD_MST(PRO_CD) ON DELETE CASCADE,
    FOREIGN KEY (USR_CD) REFERENCES TUD_MST(USR_CD) ON DELETE CASCADE
);

