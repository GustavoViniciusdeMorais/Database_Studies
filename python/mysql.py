# pip install mysql-connector-python

import mysql.connector

mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="root",
  password=""
)

mycursor = mydb.cursor()

mycursor.execute("SELECT COUNT(*) FROM products")
