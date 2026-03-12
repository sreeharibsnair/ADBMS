mysql> USE INVOICE;
Database changed
mysql> 

mysql> DROP PROCEDURE IF EXISTS FindGreatest;
Query OK, 0 rows affected (0.00 sec)

mysql> DROP PROCEDURE IF EXISTS GetCustomerInvoice;
Query OK, 0 rows affected (0.01 sec)

mysql> 
 1. Create a procedure to find greatest of 3 numbers.
mysql> DELIMITER //
mysql> CREATE PROCEDURE FindGreatest(IN num1 INT, IN num2 INT, IN num3 INT, OUT greatest INT)
    -> BEGIN
    ->     IF num1 >= num2 AND num1 >= num3 THEN 
    ->         SET greatest = num1;
    ->     ELSEIF num2 >= num1 AND num2 >= num3 THEN 
    ->         SET greatest = num2;
    ->     ELSE 
    ->         SET greatest = num3;
    ->     END IF;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER ;
mysql> 

mysql> CALL FindGreatest(10, 25, 15, @result);
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT @result AS Greatest_Number;
+-----------------+
| Greatest_Number |
+-----------------+
|              25 |
+-----------------+
1 row in set (0.00 sec)

mysql> 
mysql> 
2. Create a procedure to display invoice details of a particular customer.
mysql> DELIMITER //
mysql> CREATE PROCEDURE GetCustomerInvoice(IN cust_id_in INT)
    -> BEGIN
    ->     SELECT c.name AS Customer_Name, m.inv_id AS Invoice_ID, m.inv_date AS Date, p.pname AS Product, i.quantity AS Quantity
    ->     FROM Customer c
    ->     JOIN Invoice_master m ON c.id = m.cust_id
    ->     JOIN Invoice_item i ON m.inv_id = i.inv_id
    ->     JOIN Product p ON i.pid = p.pid
    ->     WHERE c.id = cust_id_in;
    -> END //
Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER ;
mysql> 

mysql> CALL GetCustomerInvoice(3);
+---------------+------------+------------+----------+----------+
| Customer_Name | Invoice_ID | Date       | Product  | Quantity |
+---------------+------------+------------+----------+----------+
| Meera         |       1004 | 2025-04-05 | Notebook |        2 |
| Meera         |       1004 | 2025-04-05 | Keyboard |        5 |
| Meera         |       1004 | 2025-04-05 | Pen      |        2 |
+---------------+------------+------------+----------+----------+
3 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

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


