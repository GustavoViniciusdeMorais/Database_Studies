# Mongodb Crud Operations

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
```js
db.linux.find({"name": {$regex: /ub/i }},{"name":1}).pretty()
db.linux.find({},{"name":1}).pretty()
```
### Sort, limit, skip
```js
db.linux.find({},{"name":1}).limit(2)
db.linux.find({},{"name":1}).sort({"name":-1});
db.linux.find({},{"name":1}).sort({"name":1}).skip(2).limit(1);
```
### Filter operators
```js
# $gt, $lt
db.linux.find({"version": { $lt:"13"}}, {"name":1})
```
### Where in
```js
db.linux.find({"name": {$in: ["debian","parrot"]}}, {"name":1,"version":1})
```
### Update
```js
db.linux.updateOne({"_id": ObjectId('684b02c0a5388e217969e328')}, [{$set: {name:"parrot"}}])
```
