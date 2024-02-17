### Technical Report: Implementation of Transactions and Backup in a MySQL Database

#### Introduction:
In this report, we will discuss the implementation of transactions and backup in a MySQL database. The objective was to develop codes that allow performing secure and efficient transactions, as well as creating a backup mechanism to ensure data safety.

![photo](/ecommercedb-accesses-w-views-triggers.png)

#### Methods:
1. **Implementation of Transactions:**
   - Transactions were used to ensure data consistency during modification operations.
   - Two approaches were implemented: a direct transaction without using procedures, followed by a transaction encapsulated in a procedure.
   - In the first approach, autocommit was disabled, and statements like `START TRANSACTION`, `COMMIT`, and `ROLLBACK` were used.
   - In the second approach, a procedure named `TransacaoComProcedure` was created to handle the transaction and possible errors using an exception handler.

2. **Database Backup:**
   - The `mysqldump` utility was used to perform the database backup.
   - The backup file path was dynamically configured, allowing flexibility in choosing the storage location.
   - Dynamic SQL queries were created to obtain the backup file path from a configuration table.

#### Results:
- Transactions were successfully implemented, ensuring data consistency during modification operations.
- The backup mechanism allowed creating automated backups of the database, providing an additional layer of security.
- The developed codes were tested and did not encounter errors during execution.

#### Conclusion:
- The implementation of transactions and backup in a MySQL database is essential to ensure data integrity and security.
- Transactions enable the execution of complex operations safely and consistently.
- The backup mechanism provides an additional layer of security, preventing data loss or corruption in case of system failures.

### Case Study:
Let's consider an online store that uses the `ecommercedb` database to store information about customers, orders, products, and deliveries. When performing a critical operation, such as updating the status of an order, it is essential to ensure that the transaction is successfully completed to avoid issues like duplicate orders or inconsistent information.

Moreover, the store performs daily backups of the database to protect the data against loss or corruption. Using the `mysqldump` utility, automated backups of the database can be created and stored in a secure location. In case of system failure or human error, the data can be restored from the most recent backup, minimizing the impact on the store's operations.
