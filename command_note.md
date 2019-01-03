#     Comment check database on Oracle 

1. Check Capacity database
```
su - oracle 
echo $ORACLE_SID
If you want to check another database not default
export ORACLE_SID=devmradio 

SELECT ROUND (SUM (aaa), 2) || ' GB'
  FROM (SELECT SUM (bytes) / 1024 / 1024 / 1024 aaa FROM dba_data_files
        UNION ALL
        SELECT SUM (bytes) / 1024 / 1024 / 1024 aaa FROM dba_temp_files
        UNION ALL
        SELECT SUM (bytes * members) / 1024 / 1024 / 1024 aaa FROM v$log);  
```
2. Increase tablespace
```
ORA-39171: Job is experiencing a resumable wait.
ORA-01688: unable to extend table MRADIO.MYSUBREGISTERTRAN partition SYS_P701 by 128 in tablespace USERS

fix:
alter tablespace USERS add datafile '/data/users02.dbf' size 10m autoextend on;

or 

ALTER TABLESPACE VASGATE ADD DATAFILE '/data/vasgate02.dbf' SIZE 1024M REUSE AUTOEXTEND ON;  
```
3. Turn off datafile old 
```
select name from v$datafile;
alter database datafile '/u01/app/oracle/oradata/devmradio/users01.dbf' autoextend off;
Note: only users01.dbf 
SQL> select name from v$datafile;

NAME
--------------------------------------------------------------------------------
/u01/app/oracle/oradata/devmradio/system01.dbf
/u01/app/oracle/oradata/devmradio/sysaux01.dbf
/u01/app/oracle/oradata/devmradio/undotbs01.dbf
/u01/app/oracle/oradata/devmradio/users01.dbf

Don't turn off system01, sysaux01 and undotbs01 
```
4. Delete user 
```
DROP USER vasgate CASCADE;
```
5. Delete alert log
```
/opt/app/oracle/diag/tnslsnr/devmradio/listener/alert
```
6. Show user,DEFAULT_TABLESPACE,TEMPORARY_TABLESPACE
```
select USERNAME, DEFAULT_TABLESPACE, TEMPORARY_TABLESPACE 
	  from DBA_USERS
	  where USERNAME = 'MRADIO';
```
7. Show CHARACTER SET on database
```
SQL> select * from nls_database_parameters where parameter like '%SET%';

PARAMETER
------------------------------
VALUE
--------------------------------------------------------------------------------
NLS_CHARACTERSET
AL32UTF8

NLS_NCHAR_CHARACTERSET
AL16UTF16
```
8. Show job is running 
```
SQL> SELECT * FROM DBA_DATAPUMP_JOBS;

OWNER_NAME                     JOB_NAME
------------------------------ ------------------------------
OPERATION
--------------------------------------------------------------------------------
JOB_MODE
--------------------------------------------------------------------------------
STATE                              DEGREE ATTACHED_SESSIONS DATAPUMP_SESSIONS
------------------------------ ---------- ----------------- -----------------
SYSTEM                         SYS_IMPORT_SCHEMA_01
IMPORT
SCHEMA
EXECUTING                               1                 0                 2
```
9. Fix error ORA-12519: TNS:no appropriate service handler found
```
lsnrctl status

LSNRCTL for Linux: Version 12.2.0.1.0 - Production on 28-NOV-2018 17:17:10

Copyright (c) 1991, 2016, Oracle.  All rights reserved.

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=0.0.0.0)(PORT=1521)))
STATUS of the LISTENER
------------------------
Alias                     LISTENER
Version                   TNSLSNR for Linux: Version 12.2.0.1.0 - Production
Start Date                28-NOV-2018 17:12:12
Uptime                    0 days 0 hr. 4 min. 58 sec
Trace Level               off
Security                  ON: Local OS Authentication
SNMP                      OFF
Listener Parameter File   /home/u01/app/oracle/product/12.2.0/dbhome_1/network/admin/listener.ora
Listener Log File         /home/u01/app/oracle/diag/tnslsnr/vt2-beta-oracle01/listener/alert/log.xml
Listening Endpoints Summary...
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=0.0.0.0)(PORT=1521)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(KEY=EXTPROC1521)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcps)(HOST=vt2-beta-oracle01)(PORT=5500))(Security=(my_wallet_directory=/home/u01/app/oracle/product/12.2.0/dbhome_1/admin/orcl/xdb_wallet))(Presentation=HTTP)(Session=RAW))
Services Summary...
Service "orcl.viettalk.local" has 1 instance(s).
  Instance "orcl", status READY, has 1 handler(s) for this service...
Service "orclXDB.viettalk.local" has 1 instance(s).
  Instance "orcl", status READY, has 1 handler(s) for this service...
The command completed successfully
```
```
Check log /home/u01/app/oracle/diag/tnslsnr/vt2-beta-oracle01/listener/alert/log.xml
<msg time='2018-11-28T17:06:46.382+07:00' org_id='oracle' comp_id='tnslsnr'
 type='UNKNOWN' level='16' host_id='vt2-beta-oracle01'
 host_addr='10.84.86.38' pid='25030'>
 <txt>TNS-12519: TNS:no appropriate service handler found
 </txt>
</msg>

---> Restart lsnrctl
[oracle@vt2-beta-oracle01 ~]$ lsnrctl stop
[oracle@vt2-beta-oracle01 ~]$ lsnrctl start

[oracle@vt2-beta-oracle01 ~]$ lsnrctl status

LSNRCTL for Linux: Version 12.2.0.1.0 - Production on 28-NOV-2018 17:26:32

Copyright (c) 1991, 2016, Oracle.  All rights reserved.

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=0.0.0.0)(PORT=1521)))
STATUS of the LISTENER
------------------------
Alias                     LISTENER
Version                   TNSLSNR for Linux: Version 12.2.0.1.0 - Production
Start Date                28-NOV-2018 17:26:00
Uptime                    0 days 0 hr. 0 min. 32 sec
Trace Level               off
Security                  ON: Local OS Authentication
SNMP                      OFF
Listener Parameter File   /home/u01/app/oracle/product/12.2.0/dbhome_1/network/admin/listener.ora
Listener Log File         /home/u01/app/oracle/diag/tnslsnr/vt2-beta-oracle01/listener/alert/log.xml
Listening Endpoints Summary...
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=0.0.0.0)(PORT=1521)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(KEY=EXTPROC1521)))
The listener supports no services
The command completed successfully


Manual service registration
SQL> ALTER SYSTEM REGISTER; 
System altered.
SQL> alter database register;
ALTER SYSTEM REGISTER; 

This command forces the registration of database information to the listener.
referrent: http://www.dba-oracle.com/oracle_news/2005_4_28_use_alter_system_register_command.htm
```
10. show mode
```
SELECT open_mode FROM v$database;

OPEN_MODE
--------------------
READ WRITE

If the value is:
'MOUNTED', your database is mounted.
'READ WRITE', then you can assume it's been activated.
'READ ONLY' then it might be opened for query in read only mode, but not activated.
'READ ONLY WITH APPLY' when using active dataguard.

```

11. Export and import different oracle 

```
-- Before export we should show version oracle on source and target

SQL> show parameter compatible;

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
compatible                           string      12.2.0
noncdb_compatible                    boolean     FALSE
-- If different version solution export here:
Please set parameter Version=11.2 in export command and import the data without issue.

Source Database(12.2.0.1.0):
expdp schemas=wala directory=DUMP_DIR Version=11.2 dumpfile=wala20181227.dmp logfile=wala20181227.log 

Target Database(11.2.0.3.0):
impdp schemas=wala directory=dump_dir DUMPFILE=wala20181227.dmp LOGFILE=wala20181227.log

ORA-39112: Dependent object type INDEX_STATISTICS skipped, base object type INDEX:"EWALLET"."TBL_PROMOTION_TRANSACTION_PK" creation failed
--> Version Oracle --> Abort
```
12. Create read only user in Oracle
```
sqlplus / as sysdba
SQL> create user user_name identified by password;
SQL> grant create session to user_name;
SQL> grant select any table to user_name;
or > grant select on a.b to user_name;
a: schemas b: table
SQL> conn user_name/password
```
13. 