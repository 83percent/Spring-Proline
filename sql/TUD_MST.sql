USE PROLINE;

SELECT * FROM TUD_MST;

-- 유저 
CREATE TABLE TUD_MST (
	USR_CD INT NOT NULL AUTO_INCREMENT,
    USR_ID VARCHAR(36) NOT NULL UNIQUE,
    USR_PW CHAR(64) NOT NULL,
    USR_NM VARCHAR(10) NOT NULL,
    COLOR CHAR(6) NOT NULL,
    REG_ID TIMESTAMP DEFAULT current_timestamp,
    
    PRIMARY KEY (USR_CD)
);