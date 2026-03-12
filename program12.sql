mysql> USE INVOICE;
Database changed
mysql> 

mysql> DROP TRIGGER IF EXISTS TRIG_RELATION;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> 
1. Create a trigger to handle inserts to the product relation
mysql> DELIMITER //
mysql> CREATE TRIGGER TRIG_RELATION
    -> BEFORE INSERT ON Product
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.price < 5 THEN
    ->         SET NEW.price = 10;
    ->     END IF;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER ;
mysql> 

mysql> INSERT INTO Product VALUES (108, 'Eraser', 3);
Query OK, 1 row affected (0.01 sec)

mysql> 

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
| 108 | Eraser   |    10.00 |
+-----+----------+----------+
8 rows in set (0.00 sec)

mysql> 


