# apt update && apt install python3-pymongo
from pymongo import MongoClient
c2 = MongoClient('localhost',27017,username="root",password="example")
c2.oses.linux.find_one()
