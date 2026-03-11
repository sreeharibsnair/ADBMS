mysql> USE INVOICE;
Database changed
mysql> 
mysql> INSERT INTO Customer VALUES (8, 'Binu', 'Palm Grove', 'Calicut', NULL);
Query OK, 1 row affected (0.01 sec)

mysql> 
 1. Display customer details who doesn’t have phone number and lives in ‘Calicut’ city (use logical operators)
mysql> SELECT * FROM Customer 
    -> WHERE ph_no IS NULL AND city = 'Calicut';
+----+------+------------+---------+-------+
| id | name | address    | city    | ph_no |
+----+------+------------+---------+-------+
|  8 | Binu | Palm Grove | Calicut | NULL  |
+----+------+------------+---------+-------+
1 row in set (0.00 sec)

mysql> 
  2. List the product names if it finds any records in the invoice items table has quantity = 3 (use special operators)
mysql>
mysql> SELECT pname 
    -> FROM Product p 
    -> WHERE EXISTS (
    ->     SELECT * FROM Invoice_item i 
    ->     WHERE i.pid = p.pid AND i.quantity = 3
    -> );
+----------+
| pname    |
+----------+
| Notebook |
+----------+
1 row in set (0.00 sec)

mysql> 

mysql> SELECT * FROM Customer;
+----+-------+---------------+----------+------------+
| id | name  | address       | city     | ph_no      |
+----+-------+---------------+----------+------------+
|  1 | Anu   | Rose Villa    | TVM      | 9876543210 |
|  3 | Meera | New Blue Nest | TVM      | 9999999999 |
|  5 | Sita  | Hill Top      | Thrissur | 9123456789 |
|  6 | Rahul | City Tower    | Kochi    | 9876501234 |
|  7 | Neha  | Ocean View    | Kollam   | 9000012345 |
|  8 | Binu  | Palm Grove    | Calicut  | NULL       |
+----+-------+---------------+----------+------------+
6 rows in set (0.00 sec)

mysql> 


