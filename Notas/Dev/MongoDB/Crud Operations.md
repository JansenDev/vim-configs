### Specify Conditions Using Query Operators

*Structure*:
```sql
{ <field1>: { <operator1>: <value1> }, ... }
```

The following example retrieves all documents from the inventory collection where status equals either "A" or "D":

```SQL
-- SELECT * FROM inventory WHERE status in ("A", "D")
db.inventory.find( { status: { $in: [ "A", "D" ] } } )
```


## Create Operations
--------------------

* db.collection.insertOne() 
* db.collection.insertMany() 

```sql
db.inventory.insertMany( [
   { item: "canvas", qty: 100, size: { h: 28, w: 35.5, uom: "cm" }, status: "A" },
   { item: "mat", qty: 85, size: { h: 27.9, w: 35.5, uom: "cm" }, status: "A" },
   { item: "notebook", qty: 50, size: { h: 8.5, w: 11, uom: "in" }, status: "P" },
   { item: "paper", qty: 100, size: { h: 8.5, w: 11, uom: "in" }, status: "D" }
] );
```


## Read Operations
----------

* db.collection.find()

```SQL
-- find all
 db.inventory.find( {} )

--  find where status=D
 db.inventory.find( { status: "D" } )

```


## Update Operations
---
*Structure*:
```sql
- db.collection.updateOne(<filter>, <update>, <options>)
- db.collection.updateMany(<filter>, <update>, <options>)
- db.collection.replaceOne(<filter>, <update>, <options>)
```
Update the *first* document `where` item equals `"paper"`:
- `db.collection.updateOne`
```sql
db.inventory.updateOne(
   { item: "paper" },
   {
     $set: { "size.uom": "cm", status: "P" },
     $currentDate: { lastModified: true }
   }
)
```
Uses the `$set` operator to update the value of the `size.uom` field to `"cm"` and the value of the `status` field to `"P"`,
- `db.collection.updateMany`
```sql
db.inventory.updateMany(
   { "qty": { $lt: 50 } },
   {
     $set: { "size.uom": "in", status: "P" },
     $currentDate: { lastModified: true }
   }
)
```
- `db.collection.replaceOne`

*Structure*:
```sql
db.collection.replaceOne(
   <filter>,
   <replacement>,
   {
     upsert: <boolean>, --si no encuentra coincidencias lo inserta
     writeConcern: <document>,
     collation: <document>,
     hint: <document|string>                   
   }
)
```
```sql
db.inventory.replaceOne(
   { item: "paper" },
   { item: "paper", instock: [ { warehouse: "A", qty: 60 }, { warehouse: "B", qty: 40 } ] }
)
```


## Delete Operations
---

* db.collection.deleteOne() 
* db.collection.deleteMany() 

*Structure:*
```sql
{ <field1>: <value1>, ... }
```
*Structure with `query operators`:*
```sql
{ <field1>: { <operator1>: <value1> }, ... }
```