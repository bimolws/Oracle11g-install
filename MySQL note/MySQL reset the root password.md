# How to reset the root password for MySQL

To reset the root password for MySQL, follow these steps:

1. Log in to your account using SSH
2. Stop the MySQL server using the appropriate command for your Linux distribution:
```
- Centos 6, Ubuntu... type:
service mysqld stop

- Centos 7 type:
systemctl stop mariadb
```

3. Restart the MySQL server with the —skip-grant-tables option. To do this, type the following command:
```
[root@Mo ~]# mysqld_safe --skip-grant-tables &
[1] 12568
[root@Mo ~]# 181225 09:48:26 mysqld_safe Logging to '/var/lib/mysql/Mo.err'.
181225 09:48:26 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql
```

4. Log into MySQL using the following command:
```
[root@Mo ~]# mysql 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 2
Server version: 10.1.37-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
```

5. At the mysql> prompt, reset the password. To do this, type the following command, replacing NEW-PASSWORD with the new root password:
```
UPDATE mysql.user SET Password=PASSWORD('NEW-PASSWORD') WHERE User='root';

FLUSH PRIVILEGES;
exit;
```

6. Stop the MySQL server using the following command. You will be prompted to enter the new MySQL root password before the MySQL server shuts down:
```
[root@Mo ~]# mysqladmin -uroot -p shutdown
Enter password: 
[1]+  Done                    mysqld_safe --skip-grant-tables
```

7. Start the MySQL server normally. To do this, type the appropriate command for your Linux distribution:
```
- Centos 6, Ubuntu... type:
service mysqld start

- Centos 7 type:
systemctl start mariadb
```

8. Login and check password 
```

MariaDB [(none)]> select user,password from mysql.user where user ='root'\G;
*************************** 1. row ***************************
    user: root
password: *C694348125D959FA46A0D629F894D3ADB1B78DA3
*************************** 2. row ***************************
    user: root
password: *C694348125D959FA46A0D629F894D3ADB1B78DA3
*************************** 3. row ***************************
    user: root
password: *C694348125D959FA46A0D629F894D3ADB1B78DA3
*************************** 4. row ***************************
    user: root
password: *C694348125D959FA46A0D629F894D3ADB1B78DA3
4 rows in set (0.00 sec)
``` 