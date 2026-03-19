test> use INVOICE
switched to db INVOICE
INVOICE> 
1. Write a MongoDB query to create a user “CUSTOMER1” and grant the read role in the INVOICE database. 



 2. Write a MongoDB query to create the backup for the INVOICE database. 
INVOICE> db.createUser(
...   {
...     user: "CUSTOMER1",
...     pwd: "password123",
...     roles: [ { role: "read", db: "INVOICE" } ]
...   }
... )
{ ok: 1 }



 3. Write a MongoDB query to restore a particular database or a collection.

➜  ~ mongodump --db INVOICE                                                                
2026-03-19T14:52:52.799+0530	writing INVOICE.PRODUCT to dump/INVOICE/PRODUCT.bson
2026-03-19T14:52:52.799+0530	writing INVOICE.CUSTOMER to dump/INVOICE/CUSTOMER.bson
2026-03-19T14:52:52.800+0530	done dumping INVOICE.PRODUCT (3 documents)
2026-03-19T14:52:52.800+0530	done dumping INVOICE.CUSTOMER (2 documents)




 4. Write a MongoDB query to create an index for the collection customer using the field customer_name.
test> use INVOICE
switched to db INVOICE
INVOICE> db.CUSTOMER.createIndex({ name: 1 })
name_1
INVOICE> 




INVOICE> db.CUSTOMER.getIndexes()
[
  { v: 2, key: { _id: 1 }, name: '_id_' },
  { v: 2, key: { name: 1 }, name: 'name_1' }
]
INVOICE> 



INVOICE> use INVOICE
already on db INVOICE
INVOICE> db.dropDatabase()
{ ok: 1, dropped: 'INVOICE' }




➜  ~ mongorestore --db INVOICE dump/INVOICE
2026-03-19T15:21:25.441+0530	The --db and --collection flags are deprecated for this use-case; please use --nsInclude instead, i.e. with --nsInclude=${DATABASE}.${COLLECTION}
2026-03-19T15:21:25.441+0530	building a list of collections to restore from dump/INVOICE dir
2026-03-19T15:21:25.441+0530	don't know what to do with file "dump/INVOICE/prelude.json", skipping...
2026-03-19T15:21:25.441+0530	reading metadata for INVOICE.PRODUCT from dump/INVOICE/PRODUCT.metadata.json
2026-03-19T15:21:25.441+0530	reading metadata for INVOICE.CUSTOMER from dump/INVOICE/CUSTOMER.metadata.json
2026-03-19T15:21:25.465+0530	restoring INVOICE.CUSTOMER from dump/INVOICE/CUSTOMER.bson
2026-03-19T15:21:25.471+0530	restoring INVOICE.PRODUCT from dump/INVOICE/PRODUCT.bson
2026-03-19T15:21:25.476+0530	finished restoring INVOICE.CUSTOMER (2 documents, 0 failures)
2026-03-19T15:21:25.482+0530	finished restoring INVOICE.PRODUCT (3 documents, 0 failures)
2026-03-19T15:21:25.482+0530	no indexes to restore for collection INVOICE.PRODUCT
2026-03-19T15:21:25.482+0530	no indexes to restore for collection INVOICE.CUSTOMER
2026-03-19T15:21:25.482+0530	5 document(s) restored successfully. 0 document(s) failed to restore.
➜  ~ 



