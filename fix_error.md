# * Một số lỗi hay gặp trong Oracle và cách fix *

1. Fix ORA-00257: archiver error. Connect internal only, until freed
```
df -h
/dev/mapper/centos-root   50G   50G   16K 100% /

--> Nếu ổ đầy xóa bớt log đi ví dụ: /u01/app/oracle/diag/rdbms/orcl/orcl/alert
chú ý: chỉ xóa các file đã ghi ví dụ: rm -rf log_*.xml. không được xóa file log.xml vì có thể lỗi hệ thống.
[oracle@db02 ~]$ rman target /
RMAN> delete archivelog all;

Tham khảo thêm: http://www.dba-oracle.com/sf_ora_00257_archiver_error_connect_internal_only_until_freed.htm

```