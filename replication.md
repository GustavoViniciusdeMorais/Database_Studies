# Replication Configs (Beginning)
```bash
touch /etc/replicas.key && echo $(openssl rand -base64 16) > /etc/replicas.key && cat /etc/replicas.key

touch /etc/mongod.conf && cat /etc/mongod.conf.orig >> /etc/mongod.conf

# add the key reference
nano /etc/mongod.conf

mongod --config /etc/mongod.conf

mongosh
```
### config file
```yaml
security:
  authorization: enabled
  keyFile: /etc/replicas.key

replication:
  replSetName: rs0
```
