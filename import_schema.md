# Import Database Oracle

1. Create dump dir:
```
mkdir -p /u01/app/oracle/backup/export

chown -R oracle:oinstall /u01/app/oracle/backup/export

SQL> CREATE directory dump_dir AS '/u01/app/oracle/backup/export';

SQL> grant write, read on directory dump_dir to system;
```
2. Create table space
```
mkdir -p /u01/app/oracle/oradata/mradio/
chown -R oracle:oinstall /u01/app/oracle/oradata/mradio/

CREATE TABLESPACE mradio DATAFILE 
  '/u01/app/oracle/oradata/mradio/devmradio.dbf' SIZE 100M AUTOEXTEND ON NEXT 1280K MAXSIZE 8192M 
LOGGING 
PERMANENT
EXTENT MANAGEMENT LOCAL AUTOALLOCATE 
BLOCKSIZE 8K 
SEGMENT SPACE MANAGEMENT AUTO 
FLASHBACK ON; 

```
3. Create user
```
create user mradio identified by sdp1234;
GRANT CONNECT, RESOURCE, DBA TO mradio;
GRANT UNLIMITED TABLESPACE TO mradio;
```
4. Create role 
```
CREATE PROFILE NEVEREXPIRE LIMIT
SESSIONS_PER_USER DEFAULT
CPU_PER_SESSION DEFAULT
CPU_PER_CALL DEFAULT
CONNECT_TIME DEFAULT
IDLE_TIME DEFAULT
LOGICAL_READS_PER_SESSION DEFAULT
LOGICAL_READS_PER_CALL DEFAULT
COMPOSITE_LIMIT DEFAULT
PRIVATE_SGA DEFAULT
FAILED_LOGIN_ATTEMPTS DEFAULT
PASSWORD_LIFE_TIME UNLIMITED
PASSWORD_REUSE_TIME DEFAULT
PASSWORD_REUSE_MAX DEFAULT
PASSWORD_LOCK_TIME DEFAULT
PASSWORD_GRACE_TIME DEFAULT
PASSWORD_VERIFY_FUNCTION DEFAULT;
```
Create Role and grant 
```
CREATE ROLE OLAPI_TRACE_USER NOT IDENTIFIED;
GRANT OLAPI_TRACE_USER TO mradio;
CREATE ROLE SELECT_DATA NOT IDENTIFIED;
GRANT RO_ROLE TO mradio;
```
Change a user's password in Oracle
```
ALTER USER system IDENTIFIED BY Oracle123;
export ORACLE_SID=devmradio
echo $ORACLE_SID
impdp userid=system/Oracle123 schemas=mradio directory=dump_dir DUMPFILE=20181102_mradio.dmp LOGFILE=20181102_mradio.log JOB_NAME=vasgate.impdp
```
**Error Import **
```
[oracle@stag-app01 ~]$ impdp userid=system/Oracle123 schemas=mradio directory=dump_dir DUMPFILE=20181102_mradio.dmp LOGFILE=mradio.log

Import: Release 11.2.0.3.0 - Production on Fri Nov 9 00:47:52 2018

Copyright (c) 1982, 2011, Oracle and/or its affiliates.  All rights reserved.

Connected to: Oracle Database 11g Enterprise Edition Release 11.2.0.3.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options
ORA-39001: invalid argument value
ORA-39000: bad dump file specification
ORA-31640: unable to open dump file "/u01/app/oracle/backup/export/20181102_mradio.dmp" for read
ORA-27041: unable to open file
Linux-x86_64 Error: 13: Permission denied
Additional information: 9
```
Fix change permission folder and file
```
[oracle@stag-app01 ~]$ cd /u01/app/oracle/backup/export/
[oracle@stag-app01 export]$ ls -la
total 34414648
drwxr-xr-x. 2 oracle oinstall          49 Nov  9 00:47 .
drwxr-xr-x. 3 oracle oinstall          19 Nov  7 16:45 ..
-rw-r-----. 1 root   root     35240595456 Nov  7 17:03 20181102_mradio.dmp
-rw-r-----. 1 oracle oinstall         560 Nov  9 00:47 mradio.log
[oracle@stag-app01 export]$ exit
logout
[root@stag-app01 oradata]# chown oracle:oinstall /u01/app/oracle/backup/export/20181102_mradio.dmp
[root@stag-app01 oradata]# ls -la /u01/app/oracle/backup/export/
total 34414648
drwxr-xr-x. 2 oracle oinstall          49 Nov  9 00:47 .
drwxr-xr-x. 3 oracle oinstall          19 Nov  7 16:45 ..
-rw-r-----. 1 oracle oinstall 35240595456 Nov  7 17:03 20181102_mradio.dmp
```
** ORA-02380: profile NEVEREXPIRE does not exist**
Fix:
```
CREATE PROFILE NEVEREXPIRE LIMIT
SESSIONS_PER_USER DEFAULT
CPU_PER_SESSION DEFAULT
CPU_PER_CALL DEFAULT
CONNECT_TIME DEFAULT
IDLE_TIME DEFAULT
LOGICAL_READS_PER_SESSION DEFAULT
LOGICAL_READS_PER_CALL DEFAULT
COMPOSITE_LIMIT DEFAULT
PRIVATE_SGA DEFAULT
FAILED_LOGIN_ATTEMPTS DEFAULT
PASSWORD_LIFE_TIME UNLIMITED
PASSWORD_REUSE_TIME DEFAULT
PASSWORD_REUSE_MAX DEFAULT
PASSWORD_LOCK_TIME DEFAULT
PASSWORD_GRACE_TIME DEFAULT
PASSWORD_VERIFY_FUNCTION DEFAULT;
```

6. Error incompatible version number 5.1

```
-- Before export we should show version oracle on source and target

SQL> show parameter compatible;

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
compatible                           string      12.2.0
noncdb_compatible                    boolean     FALSE
--------------------- show error ------------------------------------
impdp userid=system/Oracle123 schemas=wala directory=dump_dir Version=12.2 DUMPFILE=20181227wala.dmp LOGFILE=20181227wala.log

Import: Release 11.2.0.3.0 - Production on Fri Dec 28 04:51:00 2018

Copyright (c) 1982, 2011, Oracle and/or its affiliates.  All rights reserved.

Connected to: Oracle Database 11g Enterprise Edition Release 11.2.0.3.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options
ORA-39001: invalid argument value
ORA-39000: bad dump file specification
ORA-39142: incompatible version number 5.1 in dump file "/opt/export/20181227wala.dmp"
--------------------- end show error ------------------------------------

SOLUTION:

Please set parameter Version=11.2 in export command and import the data without issue.

Source Database(12.2.0.1.0):
expdp schemas=wala directory=DUMP_DIR Version=11.2 dumpfile=wala20181227.dmp logfile=wala20181227.log 

Target Database(11.2.0.3.0):
impdp schemas=wala directory=dump_dir DUMPFILE=wala20181227.dmp LOGFILE=wala20181227.log
```
