# NoSQL with MongoDB
- [Mongosh doc](https://www.mongodb.com/docs/mongodb-shell/crud/)<br>
- [CRUD](./crud.md)
- [PHP](./connect.php)
- [File of items to import](./linux_oses.json)
<br>

```markdown
# MongoDB Setup and Commands

## Installation
```bash
wget https://repo.mongodb.org/apt/debian/dists/bookworm/mongodb-org/8.0/main/binary-amd64/mongodb-org-server_8.0.6_amd64.deb
ls | grep mongo
dpkg -i mongodb-org-server_8.0.6_amd64.deb
```

## Configuration
- [config file](./mongod.conf)
```bash
grep -iR "mongo" /etc/*
nano /etc/mongod.conf
mongod --version
mongod --help
mongod --config /etc/mongod.conf
```
Add:
```yaml
net:
  port: 27031
  bindIp: 127.0.0.1
```

## Connection Commands
```bash
# Atlas connection
mongosh "mongodb+srv://YOUR_CLUSTER_NAME.YOUR_HASH.mongodb.net/" --apiVersion YOUR_API_VERSION --username YOUR_USERNAME

# Local connection
mongosh "mongodb://localhost:27031"
```

### Login at default mongo docker from docker hub
```js
mongosh
test> use admin
switched to db admin
admin> db.auth("root","example")
{ ok: 1 }
admin> use test
switched to db test
test> show dbs
admin   100.00 KiB
config   12.00 KiB
local    72.00 KiB
test> 
```

### Simple Import json
```bash
mongoimport --uri "mongodb://root:example@localhost:27017" --db admin --collection linux --file /var/www/html/data/linux_collection.json --jsonArray
mongosh
use admin
db.auth("root","example")
show collections
db.linux.find()
```
