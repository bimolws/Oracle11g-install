# Export Database oracle 

1. Goto database 
```
su - oracle 
[oracle@db opt2]$ echo $ORACLE_SID
mradio
[oracle@db opt2]$ sqlplus  / as sysdba

SQL*Plus: Release 11.2.0.1.0 Production on Fri Nov 2 09:12:40 2018

Copyright (c) 1982, 2009, Oracle.  All rights reserved.

Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

SQL> create directory dump2 as '/opt2';

Directory created.

SQL> exit
Disconnected from Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options
[oracle@db opt2]$ df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/cciss/c0d0p5      33G  4.0G   27G  14% /
/dev/cciss/c0d0p2     228G  191G   25G  89% /opt
/dev/cciss/c0d0p1      99M   12M   83M  13% /boot
tmpfs                  18G  7.6G   11G  43% /dev/shm
/dev/cciss/c0d1p1     1.1T  719G  327G  69% /opt2

[oracle@db opt2]$ expdp directory=dump2 dumpfile=databasename.dmp logfile=databasename.log full=y

Export: Release 11.2.0.1.0 - Production on Fri Nov 2 09:13:58 2018

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

Username: / as sysdba

Install Oracle
http://dbaora.com/install-oracle-11g-release-2-11-2-on-centos-linux-7/
https://oracle-base.com/articles/11g/oracle-db-11gr2-installation-on-oracle-linux-7

change password user Oracle
ALTER USER user_name IDENTIFIED BY new_password;

Datafiles Data Dictionary Views
SELECT NAME,
    FILE#,
    STATUS,
    CHECKPOINT_CHANGE# "CHECKPOINT"   
  FROM   V$DATAFILE;
Or 
select name from v$datafile;
```