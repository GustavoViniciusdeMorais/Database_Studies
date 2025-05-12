# pip install mysql-connector-python

import mysql.connector

mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="remote_user",
  password="your_password",
  database="studies"
)

mycursor = mydb.cursor()

mycursor.execute("SELECT * FROM customers")
