mysql> USE INVOICE;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> 
mysql> -- 1. Create a view for customers who have purchased products.
mysql> CREATE VIEW view_purchased_customers AS 
    -> SELECT DISTINCT c.id, c.name, c.address, c.city, c.ph_no 
    -> FROM Customer c 
    -> JOIN Invoice_master m ON c.id = m.cust_id;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> 
mysql> SELECT * FROM view_purchased_customers;
+----+-------+---------------+----------+------------+
| id | name  | address       | city     | ph_no      |
+----+-------+---------------+----------+------------+
|  1 | Anu   | Rose Villa    | TVM      | 9876543210 |
|  3 | Meera | New Blue Nest | TVM      | 9999999999 |
|  5 | Sita  | Hill Top      | Thrissur | 9123456789 |
|  6 | Rahul | City Tower    | Kochi    | 9876501234 |
|  7 | Neha  | Ocean View    | Kollam   | 9000012345 |
+----+-------+---------------+----------+------------+
5 rows in set (0.01 sec)

mysql> 
mysql> -- 2. Create a view for invoice products[cname, inv_id, product_id, quantity]
mysql> CREATE VIEW view_invoice_products AS 
    -> SELECT c.name AS cname, m.inv_id, i.pid AS product_id, i.quantity  
    -> FROM Customer c 
    -> JOIN Invoice_master m ON c.id = m.cust_id 
    -> JOIN Invoice_item i ON m.inv_id = i.inv_id;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql>
mysql> SELECT * FROM view_invoice_products;
+-------+--------+------------+----------+
| cname | inv_id | product_id | quantity |
+-------+--------+------------+----------+
| Meera |   1004 |        102 |        2 |
| Sita  |   1007 |        102 |        3 |
| Meera |   1004 |        104 |        5 |
| Meera |   1004 |        101 |        2 |
+-------+--------+------------+----------+
4 rows in set (0.01 sec)

mysql> 
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


