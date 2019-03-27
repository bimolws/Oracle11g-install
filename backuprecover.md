```
[oracle@db02 ~]$ rman target /

Recovery Manager: Release 11.2.0.4.0 - Production on Sat Mar 9 09:54:36 2019

Copyright (c) 1982, 2011, Oracle and/or its affiliates.  All rights reserved.

connected to target database: SINGLE (DBID=3970467183)

RMAN> 

RMAN> 

RMAN> 

RMAN> 

RMAN> run
2> {
3> backup incremental level 0 as compressed backupset format '/oradata/backup/%T_DATAAAAAAAAAAA_%U'  database plus archivelog;
4> backup current controlfile format '/oradata/backup/%T_CTL_%U';
5> backup spfile format '/oradata/backup/%T_SPFILE_%U';
6> }


Starting backup at 09-MAR-19
current log archived
using target database control file instead of recovery catalog
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=1135 device type=DISK
channel ORA_DISK_1: starting compressed archived log backup set
channel ORA_DISK_1: specifying archived log(s) in backup set
input archived log thread=1 sequence=258 RECID=254 STAMP=1002292058
input archived log thread=1 sequence=259 RECID=255 STAMP=1002292258
input archived log thread=1 sequence=260 RECID=256 STAMP=1002292448
channel ORA_DISK_1: starting piece 1 at 09-MAR-19
channel ORA_DISK_1: finished piece 1 at 09-MAR-19
piece handle=/oradata/backup/20190309_DATAAAAAAAAAAA_2its09ku_1_1 tag=TAG20190309T095542 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
channel ORA_DISK_1: starting compressed archived log backup set
channel ORA_DISK_1: specifying archived log(s) in backup set
input archived log thread=1 sequence=1 RECID=257 STAMP=1002293256
input archived log thread=1 sequence=2 RECID=258 STAMP=1002293436
input archived log thread=1 sequence=3 RECID=259 STAMP=1002294116
channel ORA_DISK_1: starting piece 1 at 09-MAR-19
channel ORA_DISK_1: finished piece 1 at 09-MAR-19
piece handle=/oradata/backup/20190309_DATAAAAAAAAAAA_2jts09kv_1_1 tag=TAG20190309T095542 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
channel ORA_DISK_1: starting compressed archived log backup set
channel ORA_DISK_1: specifying archived log(s) in backup set
input archived log thread=1 sequence=1 RECID=260 STAMP=1002294186
input archived log thread=1 sequence=2 RECID=261 STAMP=1002294355
input archived log thread=1 sequence=3 RECID=262 STAMP=1002294435
input archived log thread=1 sequence=4 RECID=263 STAMP=1002294462
input archived log thread=1 sequence=5 RECID=264 STAMP=1002294467
input archived log thread=1 sequence=6 RECID=265 STAMP=1002295048
input archived log thread=1 sequence=7 RECID=266 STAMP=1002295081
input archived log thread=1 sequence=8 RECID=267 STAMP=1002295096
input archived log thread=1 sequence=9 RECID=279 STAMP=1002448440
input archived log thread=1 sequence=10 RECID=280 STAMP=1002448440
input archived log thread=1 sequence=11 RECID=281 STAMP=1002448440
input archived log thread=1 sequence=12 RECID=282 STAMP=1002448440
channel ORA_DISK_1: starting piece 1 at 09-MAR-19
channel ORA_DISK_1: finished piece 1 at 09-MAR-19
piece handle=/oradata/backup/20190309_DATAAAAAAAAAAA_2kts09l0_1_1 tag=TAG20190309T095542 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
channel ORA_DISK_1: starting compressed archived log backup set
channel ORA_DISK_1: specifying archived log(s) in backup set
input archived log thread=1 sequence=1 RECID=283 STAMP=1002448529
input archived log thread=1 sequence=2 RECID=284 STAMP=1002448541
channel ORA_DISK_1: starting piece 1 at 09-MAR-19
channel ORA_DISK_1: finished piece 1 at 09-MAR-19
piece handle=/oradata/backup/20190309_DATAAAAAAAAAAA_2lts09l1_1_1 tag=TAG20190309T095542 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
Finished backup at 09-MAR-19

Starting backup at 09-MAR-19
using channel ORA_DISK_1
channel ORA_DISK_1: starting compressed incremental level 0 datafile backup set
channel ORA_DISK_1: specifying datafile(s) in backup set
input datafile file number=00003 name=/oradata/single/undotbs01.dbf
input datafile file number=00001 name=/oradata/single/system01.dbf
input datafile file number=00002 name=/oradata/single/sysaux01.dbf
input datafile file number=00004 name=/oradata/single/users01.dbf
channel ORA_DISK_1: starting piece 1 at 09-MAR-19
channel ORA_DISK_1: finished piece 1 at 09-MAR-19
piece handle=/oradata/backup/20190309_DATAAAAAAAAAAA_2mts09l2_1_1 tag=TAG20190309T095546 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:03:16
channel ORA_DISK_1: starting compressed incremental level 0 datafile backup set
channel ORA_DISK_1: specifying datafile(s) in backup set
including current control file in backup set
including current SPFILE in backup set
channel ORA_DISK_1: starting piece 1 at 09-MAR-19
channel ORA_DISK_1: finished piece 1 at 09-MAR-19
piece handle=/oradata/backup/20190309_DATAAAAAAAAAAA_2nts09r6_1_1 tag=TAG20190309T095546 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
Finished backup at 09-MAR-19

Starting backup at 09-MAR-19
current log archived
using channel ORA_DISK_1
channel ORA_DISK_1: starting compressed archived log backup set
channel ORA_DISK_1: specifying archived log(s) in backup set
input archived log thread=1 sequence=3 RECID=285 STAMP=1002448744
channel ORA_DISK_1: starting piece 1 at 09-MAR-19
channel ORA_DISK_1: finished piece 1 at 09-MAR-19
piece handle=/oradata/backup/20190309_DATAAAAAAAAAAA_2ots09r8_1_1 tag=TAG20190309T095904 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
Finished backup at 09-MAR-19

Starting backup at 09-MAR-19
using channel ORA_DISK_1
channel ORA_DISK_1: starting full datafile backup set
channel ORA_DISK_1: specifying datafile(s) in backup set
including current control file in backup set
channel ORA_DISK_1: starting piece 1 at 09-MAR-19
channel ORA_DISK_1: finished piece 1 at 09-MAR-19
piece handle=/oradata/backup/20190309_CTL_2pts09r9_1_1 tag=TAG20190309T095905 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
Finished backup at 09-MAR-19

Starting backup at 09-MAR-19
using channel ORA_DISK_1
channel ORA_DISK_1: starting full datafile backup set
channel ORA_DISK_1: specifying datafile(s) in backup set
including current SPFILE in backup set
channel ORA_DISK_1: starting piece 1 at 09-MAR-19
channel ORA_DISK_1: finished piece 1 at 09-MAR-19
piece handle=/oradata/backup/20190309_SPFILE_2qts09rb_1_1 tag=TAG20190309T095907 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
Finished backup at 09-MAR-19

RMAN>  

RMAN> 

RMAN> 

RMAN> 

RMAN> exit


Recovery Manager complete.
[oracle@db02 ~]$ 
[oracle@db02 ~]$ 
[oracle@db02 ~]$ 
[oracle@db02 ~]$ 
[oracle@db02 ~]$ 
[oracle@db02 ~]$ 
[oracle@db02 ~]$ cd /oradata/backup
[oracle@db02 backup]$ ls -ltr
total 626624
-rw-r----- 1 oracle asmadmin   1355776 Mar  9 09:55 20190309_DATAAAAAAAAAAA_2its09ku_1_1
-rw-r----- 1 oracle asmadmin    104960 Mar  9 09:55 20190309_DATAAAAAAAAAAA_2jts09kv_1_1
-rw-r----- 1 oracle asmadmin   2524672 Mar  9 09:55 20190309_DATAAAAAAAAAAA_2kts09l0_1_1
-rw-r----- 1 oracle asmadmin     87552 Mar  9 09:55 20190309_DATAAAAAAAAAAA_2lts09l1_1_1
-rw-r----- 1 oracle asmadmin 626253824 Mar  9 09:58 20190309_DATAAAAAAAAAAA_2mts09l2_1_1
-rw-r----- 1 oracle asmadmin   1130496 Mar  9 09:59 20190309_DATAAAAAAAAAAA_2nts09r6_1_1
-rw-r----- 1 oracle asmadmin      4608 Mar  9 09:59 20190309_DATAAAAAAAAAAA_2ots09r8_1_1
-rw-r----- 1 oracle asmadmin  10092544 Mar  9 09:59 20190309_CTL_2pts09r9_1_1
-rw-r----- 1 oracle asmadmin     98304 Mar  9 09:59 20190309_SPFILE_2qts09rb_1_1
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ sqlplus  / as sysdba

SQL*Plus: Release 11.2.0.4.0 Production on Sat Mar 9 10:04:10 2019

Copyright (c) 1982, 2013, Oracle.  All rights reserved.


Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.4.0 - 64bit Production
With the Partitioning, Real Application Clusters, OLAP, Data Mining
and Real Application Testing options

SQL> shut abort
ORACLE instance shut down.
SQL> exit
Disconnected from Oracle Database 11g Enterprise Edition Release 11.2.0.4.0 - 64bit Production
With the Partitioning, Real Application Clusters, OLAP, Data Mining
and Real Application Testing options
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ cd /oradata
[oracle@db02 oradata]$ ls
1_10_1002294141.dbf  1_1_1002448440.dbf   1_2_1002293142.dbf  1_258_998411441.dbf  1_3_1002293142.dbf  1_4_1002294141.dbf  1_7_1002294141.dbf  a.sql
1_1_1002293142.dbf   1_11_1002294141.dbf  1_2_1002294141.dbf  1_259_998411441.dbf  1_3_1002294141.dbf  1_5_1002294141.dbf  1_8_1002294141.dbf  backup
1_1_1002294141.dbf   1_12_1002294141.dbf  1_2_1002448440.dbf  1_260_998411441.dbf  1_3_1002448440.dbf  1_6_1002294141.dbf  1_9_1002294141.dbf  single
[oracle@db02 oradata]$ cd single/
[oracle@db02 single]$ ls
control01.ctl  redo01b.log  redo02b.log  redo03b.log  redo04b.log   system01.dbf  undotbs01.dbf
redo01a.log    redo02a.log  redo03a.log  redo04a.log  sysaux01.dbf  temp01.dbf    users01.dbf
[oracle@db02 single]$ ls -ltr
total 15698640
-rw-r----- 1 oracle asmadmin   20979712 Mar  9 06:00 temp01.dbf
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo01b.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo01a.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo02a.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo02b.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:59 redo03a.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:59 redo03b.log
-rw-r----- 1 oracle asmadmin 4078968832 Mar  9 09:59 system01.dbf
-rw-r----- 1 oracle asmadmin  608182272 Mar  9 09:59 sysaux01.dbf
-rw-r----- 1 oracle asmadmin    5251072 Mar  9 09:59 users01.dbf
-rw-r----- 1 oracle asmadmin 7177510912 Mar  9 09:59 undotbs01.dbf
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 10:03 redo04b.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 10:03 redo04a.log
-rw-r----- 1 oracle asmadmin   10043392 Mar  9 10:04 control01.ctl
[oracle@db02 single]$ rm system01.dbf 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ sqlplus  / as sysdba

SQL*Plus: Release 11.2.0.4.0 Production on Sat Mar 9 10:04:42 2019

Copyright (c) 1982, 2013, Oracle.  All rights reserved.

Connected to an idle instance.

SQL> startup
ORACLE instance started.

Total System Global Area 1.2527E+10 bytes
Fixed Size                  2264856 bytes
Variable Size            2919235816 bytes
Database Buffers         9596567552 bytes
Redo Buffers                8658944 bytes
Database mounted.
ORA-01157: cannot identify/lock data file 1 - see DBWR trace file
ORA-01110: data file 1: '/oradata/single/system01.dbf'


SQL> SQL> startup
SP2-0734: unknown command beginning "SQL> start..." - rest of line ignored.
SQL> ORACLE instance started.
SP2-0734: unknown command beginning "ORACLE ins..." - rest of line ignored.
SQL> 
SQL> Total System Global Area 1.2527E+10 bytes
SP2-0734: unknown command beginning "Total Syst..." - rest of line ignored.
SQL> Fixed Size                  2264856 bytes
SP2-0734: unknown command beginning "Fixed Size..." - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL> Variable Size            2919235816 bytes
Usage: VAR[IABLE] [ <variable> [ NUMBER | CHAR | CHAR (n [CHAR|BYTE]) |
                    VARCHAR2 (n [CHAR|BYTE]) | NCHAR | NCHAR (n) |
                    NVARCHAR2 (n) | CLOB | NCLOB | BLOB | BFILE
                    REFCURSOR | BINARY_FLOAT | BINARY_DOUBLE ] ]
SQL> Database Buffers         9596567552 bytes
SP2-0734: unknown command beginning "Database B..." - rest of line ignored.
SQL> Redo Buffers                8658944 bytes
SP2-0734: unknown command beginning "Redo Buffe..." - rest of line ignored.
SQL> Database mounted.
SP2-0734: unknown command beginning "Database m..." - rest of line ignored.
SQL> 
SQL> exit
Disconnected from Oracle Database 11g Enterprise Edition Release 11.2.0.4.0 - 64bit Production
With the Partitioning, Real Application Clusters, OLAP, Data Mining
and Real Application Testing options
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ ls -ltr
total 11715272
-rw-r----- 1 oracle asmadmin   20979712 Mar  9 06:00 temp01.dbf
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo01b.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo01a.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo02a.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo02b.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:59 redo03a.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:59 redo03b.log
-rw-r----- 1 oracle asmadmin  608182272 Mar  9 09:59 sysaux01.dbf
-rw-r----- 1 oracle asmadmin    5251072 Mar  9 09:59 users01.dbf
-rw-r----- 1 oracle asmadmin 7177510912 Mar  9 09:59 undotbs01.dbf
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 10:03 redo04b.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 10:03 redo04a.log
-rw-r----- 1 oracle asmadmin   10043392 Mar  9 10:05 control01.ctl
[oracle@db02 single]$  rm control01.ctl 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ sqlplus  / as sysdba

SQL*Plus: Release 11.2.0.4.0 Production on Sat Mar 9 10:05:46 2019

Copyright (c) 1982, 2013, Oracle.  All rights reserved.


Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.4.0 - 64bit Production
With the Partitioning, Real Application Clusters, OLAP, Data Mining
and Real Application Testing options

SQL> shut abort
ORACLE instance shut down.
SQL> startup
ORACLE instance started.

Total System Global Area 1.2527E+10 bytes
Fixed Size                  2264856 bytes
Variable Size            2919235816 bytes
Database Buffers         9596567552 bytes
Redo Buffers                8658944 bytes
ORA-00205: error in identifying control file, check alert log for more info


SQL> 
SQL> 
SQL> 
SQL> 
SQL> exit
Disconnected from Oracle Database 11g Enterprise Edition Release 11.2.0.4.0 - 64bit Production
With the Partitioning, Real Application Clusters, OLAP, Data Mining
and Real Application Testing options
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ 
[oracle@db02 single]$ ls
redo01a.log  redo02a.log  redo03a.log  redo04a.log  sysaux01.dbf  undotbs01.dbf
redo01b.log  redo02b.log  redo03b.log  redo04b.log  temp01.dbf    users01.dbf
[oracle@db02 single]$ ls -ltr
total 11705464
-rw-r----- 1 oracle asmadmin   20979712 Mar  9 06:00 temp01.dbf
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo01b.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo01a.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo02a.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:55 redo02b.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:59 redo03a.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 09:59 redo03b.log
-rw-r----- 1 oracle asmadmin  608182272 Mar  9 09:59 sysaux01.dbf
-rw-r----- 1 oracle asmadmin    5251072 Mar  9 09:59 users01.dbf
-rw-r----- 1 oracle asmadmin 7177510912 Mar  9 09:59 undotbs01.dbf
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 10:03 redo04b.log
-rw-r----- 1 oracle asmadmin  524288512 Mar  9 10:03 redo04a.log
[oracle@db02 single]$ cd ..
[oracle@db02 oradata]$ rm -rf single/
[oracle@db02 oradata]$ mkdir single
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ 
[oracle@db02 oradata]$ cd ..
[oracle@db02 /]$ ls -ltr
total 36
drwxr-xr-x.   2 root   root        6 Apr 11  2018 srv
drwxr-xr-x.   2 root   root        6 Apr 11  2018 media
lrwxrwxrwx.   1 root   root        7 Nov  7 14:00 bin -> usr/bin
lrwxrwxrwx.   1 root   root        7 Nov  7 14:00 lib -> usr/lib
lrwxrwxrwx.   1 root   root        9 Nov  7 14:00 lib64 -> usr/lib64
lrwxrwxrwx.   1 root   root        8 Nov  7 14:00 sbin -> usr/sbin
drwxr-xr-x.  13 root   root      207 Nov  7 14:00 usr
drwxr-xr-x.  19 root   root     4096 Nov  7 14:10 var
drwxr-xr-x.   2 root   root       27 Nov  7 22:02 ora
drwxr-xr-x.   4 root   root       44 Nov  8 09:23 home
drwxr-xr-x.   2 root   root        6 Nov  8 09:29 oradata01
dr-xr-xr-x.   5 root   root     4096 Nov  9 11:13 boot
drwxr-xr-x.   4 root   root       48 Nov  9 15:06 opt
drwxr-xr-x    4 oracle oinstall   45 Nov  9 17:09 ggs
drwxr-xr-x.   3 root   oinstall   17 Jan 20 21:02 u01
drwxr-xr-x.   4 root   root       41 Jan 21 20:56 mnt
drwxr-xr-x.  78 root   root     8192 Jan 22 10:21 etc
dr-xr-x---.   3 root   root     4096 Jan 25 10:28 root
drwxr-xr-x    2 root   root        6 Jan 25 10:33 oradata2
dr-xr-xr-x  314 root   root        0 Jan 28 10:25 proc
dr-xr-xr-x   13 root   root        0 Jan 28 10:25 sys
drwxr-xr-x   22 root   root      620 Jan 28 10:25 run
drwxr-xr-x   22 root   root     4220 Jan 28 16:30 dev
drwxr-xr-x    8 oracle oinstall  164 Jan 29 08:41 backup
drwxrwxrwt.  10 root   root      208 Mar  9 04:25 tmp
drwxr-xr-x.   4 oracle oinstall 8192 Mar  9 10:06 oradata
[oracle@db02 /]$ 
[oracle@db02 /]$ 
[oracle@db02 /]$ cd /oradata
[oracle@db02 oradata]$ ls
1_10_1002294141.dbf  1_1_1002448440.dbf   1_2_1002293142.dbf  1_258_998411441.dbf  1_3_1002293142.dbf  1_4_1002294141.dbf  1_7_1002294141.dbf  a.sql
1_1_1002293142.dbf   1_11_1002294141.dbf  1_2_1002294141.dbf  1_259_998411441.dbf  1_3_1002294141.dbf  1_5_1002294141.dbf  1_8_1002294141.dbf  backup
1_1_1002294141.dbf   1_12_1002294141.dbf  1_2_1002448440.dbf  1_260_998411441.dbf  1_3_1002448440.dbf  1_6_1002294141.dbf  1_9_1002294141.dbf  single
[oracle@db02 oradata]$ cd backup/
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ 
[oracle@db02 backup]$ rman target /

Recovery Manager: Release 11.2.0.4.0 - Production on Sat Mar 9 10:07:21 2019

Copyright (c) 1982, 2011, Oracle and/or its affiliates.  All rights reserved.

connected to target database: SINGLE (not mounted)

RMAN> shut abort

RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-00558: error encountered while parsing input commands
RMAN-01009: syntax error: found "identifier": expecting one of: "advise, allocate, alter, backup, @, catalog, change, configure, connect, convert, copy, create, crosscheck, delete, drop, duplicate, exit, flashback, grant, host, import, list, mount, open, print, quit, recover, register, release, repair, replace, report, reset, restore, resync, revoke, run, send, set, show, shutdown, spool, sql, startup, switch, transport, unregister, upgrade, validate, {, "
RMAN-01008: the bad identifier was: shut
RMAN-01007: at line 1 column 1 file: standard input

RMAN> exit


Recovery Manager complete.
[oracle@db02 backup]$ s

SQL*Plus: Release 11.2.0.4.0 Production on Sat Mar 9 10:07:27 2019

Copyright (c) 1982, 2013, Oracle.  All rights reserved.


Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.4.0 - 64bit Production
With the Partitioning, Real Application Clusters, OLAP, Data Mining
and Real Application Testing options

SQL> shut abort
ORACLE instance shut down.
SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> startup nomount
ORACLE instance started.

Total System Global Area 1.2527E+10 bytes
Fixed Size                  2264856 bytes
Variable Size            2919235816 bytes
Database Buffers         9596567552 bytes
Redo Buffers                8658944 bytes
SQL> exit
Disconnected from Oracle Database 11g Enterprise Edition Release 11.2.0.4.0 - 64bit Production
With the Partitioning, Real Application Clusters, OLAP, Data Mining
and Real Application Testing options
[oracle@db02 backup]$ rman target /

Recovery Manager: Release 11.2.0.4.0 - Production on Sat Mar 9 10:08:01 2019

Copyright (c) 1982, 2011, Oracle and/or its affiliates.  All rights reserved.

connected to target database: SINGLE (not mounted)

RMAN> restore controlfile from '/oradata/backup/20190309_CTL_2pts09r9_1_1';

Starting restore at 09-MAR-19
using target database control file instead of recovery catalog
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=1134 device type=DISK

channel ORA_DISK_1: restoring control file
channel ORA_DISK_1: restore complete, elapsed time: 00:00:01
output file name=/oradata/single/control01.ctl
output file name=/u01/app/oracle/fast_recovery_area/single/control02.ctl
Finished restore at 09-MAR-19

RMAN> alter database mount
2> ;

database mounted
released channel: ORA_DISK_1

RMAN> recover database;

Starting recover at 09-MAR-19
Starting implicit crosscheck backup at 09-MAR-19
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=1134 device type=DISK
Crosschecked 76 objects
Finished implicit crosscheck backup at 09-MAR-19

Starting implicit crosscheck copy at 09-MAR-19
using channel ORA_DISK_1
Finished implicit crosscheck copy at 09-MAR-19

searching for all files in the recovery area
cataloging files...
no files cataloged

using channel ORA_DISK_1
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: failure of recover command at 03/09/2019 10:08:38
RMAN-06094: datafile 1 must be restored

RMAN> restore database;

Starting restore at 09-MAR-19
using channel ORA_DISK_1

channel ORA_DISK_1: starting datafile backup set restore
channel ORA_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_DISK_1: restoring datafile 00001 to /oradata/single/system01.dbf
channel ORA_DISK_1: restoring datafile 00002 to /oradata/single/sysaux01.dbf
channel ORA_DISK_1: restoring datafile 00003 to /oradata/single/undotbs01.dbf
channel ORA_DISK_1: restoring datafile 00004 to /oradata/single/users01.dbf
channel ORA_DISK_1: reading from backup piece /oradata/backup/20190309_DATAAAAAAAAAAA_2mts09l2_1_1
channel ORA_DISK_1: piece handle=/oradata/backup/20190309_DATAAAAAAAAAAA_2mts09l2_1_1 tag=TAG20190309T095546
channel ORA_DISK_1: restored backup piece 1
channel ORA_DISK_1: restore complete, elapsed time: 00:03:15
Finished restore at 09-MAR-19

RMAN> 


RMAN> recover database;

Starting recover at 09-MAR-19
using channel ORA_DISK_1

starting media recovery

archived log for thread 1 with sequence 3 is already on disk as file /oradata/1_3_1002448440.dbf
archived log file name=/oradata/1_3_1002448440.dbf thread=1 sequence=3
unable to find archived log
archived log thread=1 sequence=4
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: failure of recover command at 03/09/2019 10:12:53
RMAN-06054: media recovery requesting unknown archived log for thread 1 with sequence 4 and starting SCN of 71581980

RMAN> alter database open resetlogs;

database opened

RMAN> exit


Recovery Manager complete.
[oracle@db02 backup]$ 
```