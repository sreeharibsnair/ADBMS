mysql> CREATE DATABASE IF NOT EXISTS invoice;
Query OK, 1 row affected (0.00 sec)

mysql> USE invoice;
Database changed
mysql> 
mysql> CREATE TABLE student (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     city VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> CREATE TABLE product (
    ->     pid INT PRIMARY KEY,
    ->     pname VARCHAR(50),
    ->     price INT
    -> );
Query OK, 0 rows affected (0.03 sec)




a) TCL COMMANDS    //////////////////////////////        
mysql> 
mysql> SET AUTOCOMMIT = 0;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> INSERT INTO student VALUES (101,'Anu','Kochi');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM student;
+-----+------+-------+
| id  | name | city  |
+-----+------+-------+
| 101 | Anu  | Kochi |
+-----+------+-------+
1 row in set (0.00 sec)

mysql> 

 1. Commit   //////////////////////////
mysql> COMMIT;
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> DELETE FROM student WHERE id = 101;
Query OK, 1 row affected (0.00 sec)
 Create two users user1, user2 
mysql> SELECT * FROM student;
Empty set (0.00 sec)

mysql> 
 2. Rollback   //////////////////////////////////
mysql> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM student;
+-----+------+-------+
| id  | name | city  |
+-----+------+-------+
| 101 | Anu  | Kochi |
+-----+------+-------+
1 row in set (0.00 sec)

mysql> 
mysql> INSERT INTO product VALUES (301,'Pen',10);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO product VALUES (302,'Pencil',5);
Query OK, 1 row affected (0.00 sec)

mysql> 

 3. Savepoint   ////////////////////////////////////////////
mysql> SAVEPOINT sp1;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> UPDATE product SET price = 15 WHERE pid = 301;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> 
mysql> SAVEPOINT sp2;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> INSERT INTO product VALUES (303,'Notebook',40);
Query OK, 1 row affected (0.00 sec)

mysql> 
mysql> SAVEPOINT sp3;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> DELETE FROM product WHERE pid = 302;
Query OK, 1 row affected (0.00 sec)

mysql> 
mysql> ROLLBACK TO sp3;
Query OK, 0 rows affected (0.00 sec)

mysql> ROLLBACK TO sp1;
Query OK, 0 rows affected (0.00 sec)
//////////////////////////////////////////////
mysql> 
mysql> COMMIT;   
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> SELECT * FROM product;
+-----+--------+-------+
| pid | pname  | price |
+-----+--------+-------+
| 301 | Pen    |    10 |
| 302 | Pencil |     5 |
+-----+--------+-------+
2 rows in set (0.00 sec)

mysql> 
mysql> CREATE TABLE customer (
    ->     cid INT PRIMARY KEY,
    ->     cname VARCHAR(50),
    ->     city VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> DROP USER IF EXISTS 'user1'@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> DROP USER IF EXISTS 'user2'@'localhost';
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> 




 Create two users user1, user2   ///////////////////////////////
mysql> CREATE USER 'user1'@'localhost' IDENTIFIED BY 'Pass@1234';
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE USER 'user2'@'localhost' IDENTIFIED BY 'Pass@1234';
Query OK, 0 rows affected (0.00 sec)

mysql> 


 1. GRANT:   Give insert and select privilege to user 1 on customer table in the invoice database. /////////////////////////
mysql> GRANT INSERT, SELECT
    -> ON invoice.customer
    -> TO 'user1'@'localhost';
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> GRANT UPDATE, DELETE
    -> ON invoice.*
    -> TO 'user2'@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> 


Give update and delete privilege to user 2 on all tables in the invoice database. 
 2. REVOKE:   Remove delete privilege of user 2.///////////////////////////////////////
mysql> REVOKE DELETE
    -> ON invoice.*
    -> FROM 'user2'@'localhost';
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> SHOW GRANTS FOR 'user1'@'localhost';
+---------------------------------------------------------------------+
| Grants for user1@localhost                                          |
+---------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `user1`@`localhost`                           |
| GRANT SELECT, INSERT ON `invoice`.`customer` TO `user1`@`localhost` |
+---------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> SHOW GRANTS FOR 'user2'@'localhost';
+----------------------------------------------------+
| Grants for user2@localhost                         |
+----------------------------------------------------+
| GRANT USAGE ON *.* TO `user2`@`localhost`          |
| GRANT UPDATE ON `invoice`.* TO `user2`@`localhost` |
+----------------------------------------------------+
2 rows in set (0.00 sec)

mysql> 
mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)

