# Python MySQL DB CLI
- [Script Example](./etl.py)
- [DataSet Pandas Example](https://github.com/GustavoViniciusdeMorais/DataScience_Studies/blob/master/pandas.md)
```bash
docker pull gustavovinicius/guspy:databases
```
```bash
pip install mysql-connector-python
pip install pandas
pip install notebook
```
### Run Jupyter Notebook Server
```bash
jupyter notebook --ip=0.0.0.0 --port=80 --allow-root
# it will generate link with ?token variable
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
