# Import Database Oracle

1. Create dump dir:
mkdir -p /u01/app/oracle/backup/export

chown -R oracle:oinstall /u01/app/oracle/backup/export

SQL> CREATE directory dump_dir AS '/u01/app/oracle/backup/export';

SQL> grant write, read on directory dump_dir to system;

2. Create table space

mkdir -p /u01/app/oracle/oradata/mradio/

chown -R oracle:oinstall /u01/app/oracle/oradata/mradio/

CREATE TABLESPACE wala DATAFILE 
  '/u01/app/oracle/oradata/mradio/mradio01.dbf' SIZE 100M AUTOEXTEND ON NEXT 1280K MAXSIZE 8192M 
LOGGING 
PERMANENT 
EXTENT MANAGEMENT LOCAL AUTOALLOCATE 
BLOCKSIZE 8K 
SEGMENT SPACE MANAGEMENT AUTO 
FLASHBACK ON; 

3. Create user

create user mradio identified by devmradio123;

GRANT CONNECT, RESOURCE, DBA TO mradio;

GRANT UNLIMITED TABLESPACE TO mradio;

Change a user's password in Oracle

ALTER USER system IDENTIFIED BY Oracle123;

impdp userid=system/Oracle123 schemas=mradio directory=dump_dir DUMPFILE=20181102_mradio.dmp LOGFILE=mradio.log

CREATE ROLE OLAPI_TRACE_USER NOT IDENTIFIED;
GRANT OLAPI_TRACE_USER TO mradio;
CREATE ROLE SELECT_DATA NOT IDENTIFIED;
GRANT SELECT_DATA TO mradio;

**Error Import **
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

Fix change permission folder and file
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

** ORA-02380: profile NEVEREXPIRE does not exist**
Fix:
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
