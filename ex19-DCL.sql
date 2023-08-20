/*
DCL(Data Control Language) 
    DCL은 테이블에데이터를 조작할 때 필요한 권한을 조작하는 명령어

관련 키워드
    CONNECT : 데이터베이스에 접속하는 권한을 제공합니다.
    RESOURCE : 테이블, 시퀀스 프로시저 등을 생성할 수 있는 권한을 부여합니다.
    ALTER, DROP : 객체의 변경 또는 삭제 권한을 제공합니다.
    DBA : 데이터베이스 관리자로서 시스템을 완전히 제어할 수 있는 권한을 부여합니다.

*/

-- 원하는 이름으로 생성 가능
ALTER SESSION SET "_ORACLE_SCRIPT" = true;

-- 사용자 계정 생성하기
CREATE USER scott2 IDENTIFIED BY tiger;

-- GRANT 접속 권한 부여
GRANT CREATE SESSION TO scott2;
GRANT CONNECT TO scott2;

-- REVOKE 접속 권한 해제
REVOKE CREATE SESSION FROM scott2;
REVOKE CONNECT FROM scott2;

-- OBJECT 권한 부여
GRANT CREATE SEQUENCE TO scott2;
GRANT CREATE SYNONYM TO scott2;
GRANT CREATE TABLE TO scott2;
GRANT CREATE PROCEDURE TO scott2;
GRANT CREATE VIEW TO scott2;

-- 모든 권한 부여
GRANT CONNECT, DBA, RESOURCE TO scott2;

-- 모든 권한 해제
REVOKE CONNECT, DBA, RESOURCE FROM scott2;

-- 사용자 비밀번호 변경
ALTER USER scott2 IDENTIFIED BY tiger;

/*
ROLE - 권한 그룹
*/

-- role 생성방법
CREATE ROLE role01;

-- role 권한 할당
GRANT CREATE SESSION, CREATE TABLE, INSERT ANY TABLE TO role01;

-- 사용자에게 role 부여
GRANT role01 TO scott2;
REVOKE role01 FROM scott2;

-- 사용자 삭제하기
DROP USER scott2;
-- 사용자와 연관된 모든 객체 삭제
DROP USER scott2 CASCADE;




















