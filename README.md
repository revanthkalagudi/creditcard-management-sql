# Credit Card Management System Database Schema

This project aims to develop a comprehensive database management system for a financial organization. The system provides efficient storage, retrieval, and management of data related to branches, users, credit cards, credit limits, and applications within the organization. It ensures data integrity, enforces relationships between entities, and facilitates seamless operations and analysis.

This code represents the creation of a database schema using SQL statements. The schema consists of several tables that are interconnected using foreign key constraints. Below is a description of each table and its columns:

## Table: BRANCH
This table stores information about different branches of an organization.

Columns:

- **branch_id:** An integer representing the unique identifier of the branch.
- **branch_name:** A character field (up to 20 characters) representing the name of the branch.
- **branch_address:** A character field (up to 25 characters) representing the address of the branch.
- **branch_manager:** A character field (up to 25 characters) representing the name of the branch manager.

## Table: USER1
This table stores information about users of the system.

Columns:

- **user_id:** An integer representing the unique identifier of the user.
- **user_name:** A character field (up to 25 characters) representing the name of the user.
- **user_mob:** An integer representing the mobile number of the user.
- **user_mail:** A varchar field (up to 30 characters) representing the email address of the user.
- **user_address:** A varchar field (up to 50 characters) representing the address of the user.
- **user_branch_id:** An integer representing the branch to which the user belongs.


Foreign Key Constraint:

- The **user_branch_id** column references the **branch_id** column of the **BRANCH** table, enforcing a relationship between users and branches.
- The constraint ensures that the **user_branch_id** value must exist in the **branch_id** column of the **BRANCH** table.
- The **ON DELETE CASCADE** and **ON UPDATE CASCADE** specify that if a branch is deleted or updated, the corresponding users will be deleted or updated accordingly.

## Table: CREDIT_CARD
This table stores information about credit cards.

Columns:

- **crc_name:** A varchar field (up to 25 characters) representing the name of the credit card.
- **crc_id:** An integer representing the unique identifier of the credit card.
- **crc_bal:** An integer representing the balance of the credit card.
- **crc_type:** A varchar field (up to 15 characters) representing the type of the credit card.
- **crc_user_id:** An integer representing the user associated with the credit card.

Foreign Key Constraint:

- The **crc_user_id** column references the **user_id** column of the **USER1** table, establishing a relationship between credit cards and users.
- The constraint ensures that the **crc_user_id** value must exist in the **user_id** column of the **USER1** table.
- The **ON DELETE CASCADE** and **ON UPDATE CASCADE** specify that if a user is deleted or updated, the corresponding credit cards will be deleted or updated accordingly.
## Table: LIMITS
This table stores information about credit limits for users.

Columns:

- **limit_user_id:** An integer representing the user for whom the limit applies.
- **limit_bal:** An integer representing the credit limit for the user.
- **limit_crc_id:** An integer representing the credit card associated with the limit.

Foreign Key Constraint:

- The **limit_crc_id** column references the **crc_id** column of the **CREDIT_CARD** table, establishing a relationship between limits and credit cards.
- The constraint ensures that the **limit_crc_id** value must exist in the **crc_id** column of the **CREDIT_CARD** table.
- The **ON DELETE CASCADE** and **ON UPDATE CASCADE** specify that if a credit card is deleted or updated, the corresponding limits will be deleted or updated accordingly.

## Table: APPLICATIONS
This table stores information about applications made by users.
Columns:

- **app_num:** An integer representing the unique identifier of the application.
- **app_user_id:** An integer representing the user who submitted the application.
- **app_type:** A varchar field (up to 20 characters) representing the type of the application.

Foreign Key Constraint:

- The **app_user_id** column references the **user_id** column of the **USER1** table, establishing a relationship between applications and users.
- The constraint ensures that the **app_user_id** value must exist in the **user_id** column of the **USER1** table.
- The **ON DELETE CASCADE** and **ON UPDATE CASCADE** specify that if a user is deleted or updated, the corresponding applications will be deleted or updated accordingly.

## Purpose
This database schema is designed to manage information related to branches, users, credit cards, credit limits, and applications within an organization. The tables are structured to maintain data integrity and enforce relationships between entities through the use of primary keys and foreign key constraints.

The schema allows for the tracking of branch details, user information, credit card details, credit limits, and applications submitted by users. By linking tables through foreign key relationships, it ensures referential integrity and facilitates efficient data retrieval and management.

## Usage
To use this database schema, you can execute the provided SQL statements using a compatible database management system (DBMS) or query tool. The schema creation process involves executing each **CREATE TABLE** statement in the specified order to create the necessary tables and define the columns and constraints.

Once the schema is created, you can start populating the tables with relevant data by executing appropriate **INSERT INTO** statements.

To query the data, you can use SQL statements like **SELECT, INSERT, UPDATE,** and **DELETE** to perform operations on the tables and retrieve the desired information.

It is important to ensure that the necessary database privileges are granted to the user executing the SQL statements to avoid any permission-related issues.

## Database Relationships
The database schema establishes the following relationships between tables:

- The **USER1** table has a foreign key constraint referencing the **BRANCH** table, indicating that each user belongs to a specific branch.
- The **CREDIT_CARD** table has a foreign key constraint referencing the **USER1** table, indicating that each credit card is associated with a specific user.
- The **LIMITS** table has a foreign key constraint referencing the **CREDIT_CARD** table, indicating that each credit limit is associated with a specific credit card.
- The **APPLICATIONS** table has a foreign key constraint referencing the **USER1** table, indicating that each application is submitted by a specific user.

These relationships help maintain data consistency and enable data retrieval across related entities.

## Notes
- It is recommended to review and customize the data types and field lengths of the columns according to the specific requirements of your application.
- The provided schema assumes the usage of a DBMS that supports the specified SQL syntax. Compatibility should be verified with the targeted DBMS before execution.
- It is important to handle data validation, error handling, and security measures appropriately in the application layer when interacting with this database schema.
