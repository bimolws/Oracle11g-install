# Note Turning database 

```
•	Một số tham số Turning database được cấu hình trong file /etc/my.cnf
# variable configuration
key_buffer_size=384M
max_allowed_packet=16777216
max_connections=5000
max_user_connections=2000
read_buffer_size=8M
sort_buffer_size=512K
sort_buffer=8M
read_buffer_size=156K
read_rnd_buffer_size=512K
thread_cache=8
tmp_table_size=256M
wait_timeout=3600
max_binlog_size=10M
max_connect_errors=999999
character-set-server=utf8
query_cache_size=512M
thread_cache_size=256
myisam_max_sort_file_size=100G
myisam_sort_buffer_size=200M
thread_concurrency=8
	Và một số tham số khác.
```