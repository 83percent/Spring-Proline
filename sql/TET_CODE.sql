-- 공통 코드 관리
USE PROLINE;

SELECT * FROM TET_CODE;

CREATE TABLE TET_CODE (
	MAJOR_CD CHAR(5) NOT NULL,
    MINOR_CD CHAR(2) NOT NULL,
    CD_NM VARCHAR(30) NOT NULL,
    CD_COMMENT VARCHAR(255),
    PRIMARY KEY (MAJOR_CD, MINOR_CD)
);


-- ST001 : 프로젝트 상태 코드
INSERT INTO TET_CODE VALUES ("ST001", "01", "Completed", null);
INSERT INTO TET_CODE VALUES ("ST001", "02", "In Progress", null);
INSERT INTO TET_CODE VALUES ("ST001", "03", "Not Started", null);