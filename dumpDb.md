# Dump DB
### msfconsole
```bash
cat /etc/passwd | grep postgres
cat /etc/group | grep postgres

touch /var/www/html/msf.sql

chown postgres:postgres /var/www/html/msf.sql

su postgres
pg_dump -U postgres -d msf > /var/www/html/msf.sql
head -n 10 /var/www/html/msf.sql
exit
whoami
```
### Load dumped db sql
```bash
psql -U postgres -d database_name -f /var/lib/postgresql/data/database.sql
```
