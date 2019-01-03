# Them config vao my.cf cua mariadb phần này hỗ trợ xóa datafile  ibdata1 trong /var/lib/mysql/  

#
# This group is read both both by the client and the server
# use it for options that affect everything
#
[client-server]

#
# include all files from the config directory
#
!includedir /etc/my.cnf.d


[mysqld]
datadir                 =/var/lib/mysql
socket                  =/var/lib/mysql/mysql.sock
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links          =0
bind_address            = 0.0.0.0
pid_file                = /var/lib/mysql/mysql.pid


user=mysql

key_buffer_size=384M
max_allowed_packet=16777216
max_connections=5000
max_user_connections=2000
read_buffer_size=8M
sort_buffer_size=512K
sort_buffer=8M
read_buffer_size=156K
read_rnd_buffer_size=512K
table_cache=4096
thread_cache=8
tmp_table_size=256M
wait_timeout=3600
max_binlog_size=500M
max_connect_errors=999999
character-set-server=utf8
query_cache_size=512M
thread_cache_size=256
myisam_max_sort_file_size=100G
myisam_sort_buffer_size=100M
thread_concurrency=8
#federated
innodb_mirrored_log_groups=1
innodb_data_file_path = db1:1024M:autoextend
innodb_data_home_dir = /var/lib/mysql/data/tablespace
innodb_log_group_home_dir = /var/lib/mysql/logs/iblogs
innodb_log_files_in_group=3
innodb_log_file_size=128M
innodb_log_buffer_size=8M
innodb_flush_log_at_trx_commit=1
innodb_buffer_pool_size=1000M
innodb_additional_mem_pool_size=200M
innodb_file_io_threads=4
innodb_lock_wait_timeout=50
innodb_file_per_table=1

[mysqld_safe]
log-error               =/var/lib/mysql/logs/mysqld.log
bind_address            = 0.0.0.0
datadir                 = /var/lib/mysql
