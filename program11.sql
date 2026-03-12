mysql> USE INVOICE;
Database changed
mysql> 

mysql> DROP FUNCTION IF EXISTS PRICEIND;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> 
1. Create a function to calculate price_range(low, medium, high) of each product.
mysql> DELIMITER //
mysql> CREATE FUNCTION PRICEIND(PRICE INT) RETURNS VARCHAR(20)
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE PRICE_IND VARCHAR(20);
    ->     IF PRICE <= 5 THEN SET PRICE_IND = 'LOW';
    ->     ELSEIF (PRICE > 5 AND PRICE <= 50) THEN SET PRICE_IND = 'MEDIUM';
    ->     ELSEIF PRICE > 50 THEN SET PRICE_IND = 'HIGH';
    ->     END IF;
    ->     RETURN(PRICE_IND);
    -> END //
Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER ;
mysql> 

mysql> SELECT pid, pname, price, PRICEIND(price) AS price_range FROM Product;
+-----+----------+----------+-------------+
| pid | pname    | price    | price_range |
+-----+----------+----------+-------------+
| 101 | Pen      |    10.20 | MEDIUM      |
| 102 | Notebook |    20.40 | MEDIUM      |
| 103 | Mouse    |   612.00 | HIGH        |
| 104 | Keyboard |   765.00 | HIGH        |
| 105 | Laptop   | 56100.00 | HIGH        |
| 106 | Pencil   |     5.10 | LOW         |
| 107 | Bag      |   816.00 | HIGH        |
+-----+----------+----------+-------------+
7 rows in set (0.00 sec)

mysql> 


