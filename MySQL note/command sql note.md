# Note MySQL

```
GRANT ALL ON <local name>.* TO <username>@<remote web node server ip address> IDENTIFIED BY '<password>';

GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'%' IDENTIFIED BY '<password>';
```
For example,
```
GRANT ALL ON magento_remote.* TO dbuser@192.0.2.50 IDENTIFIED BY 'dbuserpassword';

CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypass';
```
To list users:
```
select user,host from mysql.user;
```
To show privileges:
```
show grants for 'user'@'host';
```
To change privileges, first revoke. Such as:
```
revoke all privileges on *.* from 'user'@'host';
```
Then grant the appropriate privileges as desired:
```
grant SELECT,INSERT,UPDATE,DELETE ON `db`.* TO 'user'@'host';
```
Finally, flush:
```
flush privileges;
```
GRANT ALL PRIVILEGES ON sunfrog.* TO 'nolove'@'%' IDENTIFIED BY 'password';