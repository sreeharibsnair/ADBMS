mysql> USE INVOICE;
Database changed
mysql> -- 1. List the product name and quantity of invoice items.
mysql> SELECT p.pname, i.quantity 
    -> FROM Product p 
    -> JOIN Invoice_item i ON p.pid = i.pid;
+----------+----------+
| pname    | quantity |
+----------+----------+
| Notebook |        2 |
| Notebook |        3 |
| Keyboard |        5 |
+----------+----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Product;
+-----+----------+----------+
| pid | pname    | price    |
+-----+----------+----------+
| 101 | Pen      |    10.20 |
| 102 | Notebook |    20.40 |
| 103 | Mouse    |   612.00 |
| 104 | Keyboard |   765.00 |
| 105 | Laptop   | 56100.00 |
| 106 | Pencil   |     5.10 |
| 107 | Bag      |   816.00 |
+-----+----------+----------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM Invoice_item;
+--------+------+----------+
| inv_id | pid  | quantity |
+--------+------+----------+
|   1004 |  102 |        2 |
|   1007 |  102 |        3 |
|   1004 |  104 |        5 |
+--------+------+----------+
3 rows in set (0.00 sec)

mysql> -- 2. Display the customer name, product name, invoice date of purchased item ‘pen’.


mysql> INSERT INTO Invoice_item VALUES (1004, 101, 2); 
Query OK, 1 row affected (0.01 sec)

mysql> SELECT c.name, p.pname, m.inv_date 
    -> FROM Customer c 
    -> JOIN Invoice_master m ON c.id = m.cust_id 
    -> JOIN Invoice_item i ON m.inv_id = i.inv_id 
    -> JOIN Product p ON i.pid = p.pid 
    -> WHERE p.pname = 'Pen';
+-------+-------+------------+
| name  | pname | inv_date   |
+-------+-------+------------+
| Meera | Pen   | 2025-04-05 |
+-------+-------+------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM Customer;
+----+-------+---------------+----------+------------+
| id | name  | address       | city     | ph_no      |
+----+-------+---------------+----------+------------+
|  1 | Anu   | Rose Villa    | TVM      | 9876543210 |
|  3 | Meera | New Blue Nest | TVM      | 9999999999 |
|  5 | Sita  | Hill Top      | Thrissur | 9123456789 |
|  6 | Rahul | City Tower    | Kochi    | 9876501234 |
|  7 | Neha  | Ocean View    | Kollam   | 9000012345 |
+----+-------+---------------+----------+------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Invoice_master;
+--------+---------+------------+
| inv_id | cust_id | inv_date   |
+--------+---------+------------+
|   1001 |       1 | 2025-01-10 |
|   1002 |       1 | 2025-03-15 |
|   1004 |       3 | 2025-04-05 |
|   1005 |       3 | 2025-06-18 |
|   1007 |       5 | 2025-09-10 |
|   1008 |       6 | 2025-10-12 |
|   1009 |       7 | 2025-11-05 |
+--------+---------+------------+
7 rows in set (0.00 sec)

mysql> -- 3. Display all customer details and invoice details must include customer has not purchased items. 
mysql> SELECT c.*, m.inv_id, m.inv_date 
    -> FROM Customer c 
    -> LEFT JOIN Invoice_master m ON c.id = m.cust_id; 
+----+-------+---------------+----------+------------+--------+------------+
| id | name  | address       | city     | ph_no      | inv_id | inv_date   |
+----+-------+---------------+----------+------------+--------+------------+
|  1 | Anu   | Rose Villa    | TVM      | 9876543210 |   1001 | 2025-01-10 |
|  1 | Anu   | Rose Villa    | TVM      | 9876543210 |   1002 | 2025-03-15 |
|  3 | Meera | New Blue Nest | TVM      | 9999999999 |   1004 | 2025-04-05 |
|  3 | Meera | New Blue Nest | TVM      | 9999999999 |   1005 | 2025-06-18 |
|  5 | Sita  | Hill Top      | Thrissur | 9123456789 |   1007 | 2025-09-10 |
|  6 | Rahul | City Tower    | Kochi    | 9876501234 |   1008 | 2025-10-12 |
|  7 | Neha  | Ocean View    | Kollam   | 9000012345 |   1009 | 2025-11-05 |
+----+-------+---------------+----------+------------+--------+------------+
7 rows in set (0.00 sec)

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
+----+-------+---------------+----------+------------+
5 rows in set (0.00 sec)

mysql> 


