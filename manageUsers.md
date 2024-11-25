# Manage users

```sh
create user 'guest'@'localhost' IDENTIFIED BY 'guest';

GRANT SELECT ON blog.customers TO 'guest'@'localhost';
```