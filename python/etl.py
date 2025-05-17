# pip install mysql-connector-python
# pip install pandas

import mysql.connector
import pandas as pd

mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="remote_user",
  password="your_password",
  database="studies"
)

cursor = mydb.cursor()

cursor.execute("SELECT * FROM customers")

df = pd.read_csv('/var/www/html/python/products.csv')
df.head()
df.isna()

for index, product in df.iterrows():
  print(index, product['name'])

def getTableData(table):
  cursor.execute(f"SELECT * FROM {table}")
  results = cursor.fetchall()
  print(results)

getTableData("products")

def insertData(df):
  for index, product in df.iterrows():
    cursor.execute(f"INSERT INTO products (name, price) VALUES ('{product['name']}','{product['price']}')")
  mydb.commit()

def fromTableToCsv(table):
  cursor.execute(f"SELECT * FROM {table}")
  results = cursor.fetchall()
  for item in results:
    print(item['name'])

