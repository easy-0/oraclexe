-- sys ��������
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE USER scott IDENTIFIED BY tiger;

GRANT CONNECT, DBA, RESOURCE TO scott;
