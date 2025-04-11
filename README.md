# NoSQL with MongoDB
- [Mongosh doc](https://www.mongodb.com/docs/mongodb-shell/crud/)<br>
Here's a single, compact Markdown block you can copy and paste directly into your GitHub repository:

```markdown
# MongoDB Setup and Commands

## Installation
```bash
wget https://repo.mongodb.org/apt/debian/dists/bookworm/mongodb-org/8.0/main/binary-amd64/mongodb-org-server_8.0.6_amd64.deb
ls | grep mongo
dpkg -i mongodb-org-server_8.0.6_amd64.deb
```

## Configuration
```bash
nano /etc/mongod.conf
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

## Common Operations
```javascript
> show dbs
> use oficial_gs_test
> show collections
> db.users.find()
> db.collection_name.find({email: /amira/},{email:1,name:1})

// Example CRUD
linux = {"name":"debian","version":"25"}
db.linux.insertOne(linux)
db.linux.find()
db.linux.updateOne({name:"debian"}, {$set: {version:"26"}})
db.linux.deleteOne({name:"debian"})
```

## Example Session
```javascript
test> use gustavo
gustavo> db.linux.insertOne({"name":"debian","version":"25"})
gustavo> show collections
gustavo> db.linux.find()
[
  {
    _id: ObjectId('67f55c1887938550fc6b140b'),
    name: 'debian',
    version: '25'
  }
]
```
### Search data
```bash
db.linux.find({"name": {$regex: /ub/i }},{"name":1}).pretty()
db.linux.find({},{"name":1}).pretty()
```
### Sort, limit, skip
```bash
db.linux.find({},{"name":1}).limit(2)
db.linux.find({},{"name":1}).sort({"name":-1});
db.linux.find({},{"name":1}).sort({"name":1}).skip(2).limit(1);
```
