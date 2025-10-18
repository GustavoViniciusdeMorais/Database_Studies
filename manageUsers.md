# Manage users

```bash
create user 'guest'@'localhost' IDENTIFIED BY 'guest';

GRANT SELECT ON blog.customers TO 'guest'@'localhost';
```
### For DBeaver Client
```bash
# enter mariadb cli
CREATE USER 'remote_user'@'%' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON *.* TO 'remote_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```
### Connection url
```
jdbc:mysql://localhost:3306/mysql?allowPublicKeyRetrieval=true&useSSL=false
```
