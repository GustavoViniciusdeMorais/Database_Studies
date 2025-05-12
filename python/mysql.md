# Python MySQL DB CLI
- [Script Example](./mysql.py)
```bash
docker pull gustavovinicius/guspy:databases
```
```bash
pip install mysql-connector-python
```
### Config SGBD
```bash
service mariadb start

mariadb -u root -p

CREATE USER 'remote_user'@'%' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON *.* TO 'remote_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;
```
