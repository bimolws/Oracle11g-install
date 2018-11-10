# Enable schema HR on oracle 

[root@stag-app01 ~]# su - oracle 

Last login: Sat Nov 10 23:11:31 ICT 2018 on pts/1
[oracle@stag-app01 ~]$ sqlplus / as sysdba;

SQL*Plus: Release 11.2.0.3.0 Production on Sat Nov 10 23:22:30 2018

Copyright (c) 1982, 2011, Oracle.  All rights reserved.


Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.3.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options


SQL> alter user hr identified by Oracle123 ACCOUNT UNLOCK;

User altered.

Then, enter this command
SQL> CONNECT HR/Oracle123
Connected.
SQL> select * from countries;

CO COUNTRY_NAME                              REGION_ID
-- ---------------------------------------- ----------
AR Argentina                                         2
AU Australia                                         3
BE Belgium                                           1
BR Brazil                                            2
CA Canada                                            2
...

Login on SQL Devoloper
Username: HR
Password: Oracle123

Hostname: IP 
Port 1521
SID orcl
[root@stag-app01 ~]# su - oracle
Last login: Sat Nov 10 23:22:22 ICT 2018 on pts/0
[oracle@stag-app01 ~]$ echo $ORACLE_SID
orcl

------> Connect

* Referrent: https://docs.oracle.com/database/121/COMSC/installation.htm#COMSC00006 *