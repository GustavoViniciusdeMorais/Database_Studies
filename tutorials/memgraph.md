## Memgraph basic commands

```yml
version: '3.8'
services:
  memgraph:
    image: memgraph/memgraph-platform:latest
    container_name: memgraph
    ports:
      - "7687:7687"    # Bolt
      - "3000:3000"    # Memgraph Lab UI
      - "7444:7444"    # Monitoring
    environment:
      - MEMGRAPH_USER=memgraph
      - MEMGRAPH_PASSWORD=password123
    volumes:
      - ./memgraph_data:/data
      - ./memgraph_logs:/logs
    networks:
            sql-app-network:
                ipv4_address: 10.0.0.8

networks:
    sql-app-network:
        driver: bridge
        ipam:
            driver: default
            config:
                - subnet: "10.0.0.0/16"
```

```bash
docker exec -it -u 0 memgraph bash
mgconsole --username memgraph --password password123
```

```bash
CREATE (p1:Product {id: 1, name: 'Laptop', price: 1200});
CREATE (p2:Product {id: 2, name: 'Mouse', price: 25});
CREATE (p3:Product {id: 3, name: 'Keyboard', price: 75});
CREATE INDEX ON :Product(id);

MATCH (p:Product) RETURN p.id, p.name, p.price;

CREATE (o1:Order {id: 101});
CREATE (o2:Order {id: 102});
CREATE INDEX ON :Order(id);

MATCH (o:Order) RETURN o.id, o.name;

# Create a relationship between existing nodes
MATCH (o2:Order {id: 102}), (p3:Product {id: 3})
CREATE (o1)-[:CONTAINS]->(p3);

MATCH (o:Order {id: 101})-[:CONTAINS]->(p:Product) RETURN p.id, p.name, p.price;

MATCH (o:Order {id: 102})-[:CONTAINS]->(p:Product) RETURN p.id, p.name, p.price;

# Create two nodes and a relationship in one clause
CREATE (o:Order {id: 101})-[:CONTAINS]->(p:Product {id: 1, name: 'Laptop', price: 1200});

# exit cli
:quit
```

```bash
# List all node labels (like SHOW TABLES)
MATCH (n) RETURN DISTINCT labels(n);

# List all relationship types
MATCH ()-[r]->() RETURN DISTINCT type(r);

# Show all nodes (like SELECT * FROM table)
MATCH (n) RETURN n;

# Show all products (like SELECT * FROM products)
MATCH (p:Product) RETURN p;

# No need to "connect to database" - you're already in it
# No CREATE DATABASE - Memgraph is single database
```
