# Entity Relationship Diagram
- [Setup](./erd_plantuml.md)
### With PlantUml format
```js
@startuml

entity User {
  +id: Integer
  +name: String
  +email: String
}

entity Product {
  +id: Iteger
  +name: String
  +price: Float
}

entity Order {
  +product_id: Integer
  +user_id: Integer
  +product_qty: Integer
  +price: Float
}

User ||--o{ Order
Product ||--o{ Order

@enduml
```
