# Entity Relationship Diagram
- [Setup](./erd_plantuml.md)
- [SQL Script](./erd.sql)
### With PlantUml format
```js
@startuml

left to right direction

entity User {
  +id: Integer
  +name: String
  +email: String 'Unique
  +password: String
  +created_at: Date
  +updated_at: Date
  +deleted_at: Date
}

entity Product {
  +id: Iteger
  +name: String
  +description: String
  +price_in_cents: Integer
  +stock_qty: Integer
  +created_at: Date
  +updated_at: Date
  +deleted_at: Date
}

entity Order {
  +product_id: Integer
  +user_id: Integer
  +product_qty: Integer
  +price_in_cents: Integer
  +created_at: Date
  +updated_at: Date
  +deleted_at: Date
}

User ||--o{ Order
Product ||--o{ Order

@enduml
```
