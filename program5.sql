mysql> USE invoice;
Database changed
mysql> SELECT * FROM product;
+-----+--------+-------+
| pid | pname  | price |
+-----+--------+-------+
| 301 | Pen    |    10 |
| 302 | Pencil |     5 |
+-----+--------+-------+
2 rows in set (0.00 sec)

mysql> SELECT MIN(price) AS Minimum_Price,MAX(price) AS Maximum_Price,AVG(price) AS Average_Price FROM product;
+---------------+---------------+---------------+
| Minimum_Price | Maximum_Price | Average_Price |
+---------------+---------------+---------------+
|             5 |            10 |        7.5000 |
+---------------+---------------+---------------+
1 row in set (0.01 sec)


mysql> SELECT * FROM customer;
+-----+-------+----------+
| cid | cname | city     |
+-----+-------+----------+
|   1 | Anu   | TVM      |
|   2 | Ravi  | TVM      |
|   3 | Meera | Kochi    |
|   4 | Arun  | Calicut  |
|   5 | Sita  | Thrissur |
|   6 | Rahul | Kochi    |
|   7 | Neha  | Kollam   |
+-----+-------+----------+
7 rows in set (0.00 sec)

mysql> SELECT city, COUNT(*) AS Number_of_Customers
    -> FROM customer
    -> GROUP BY city
    -> HAVING COUNT(*) >= 2;
+-------+---------------------+
| city  | Number_of_Customers |
+-------+---------------------+
| TVM   |                   2 |
| Kochi |                   2 |
+-------+---------------------+
2 rows in set (0.00 sec)

mysql> 


