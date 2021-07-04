Access monitor: 
```
mysql -u [username] -p; (will prompt for password) / mysql -u root
```

Show all databases: 
```
show databases;
```

Access database: 
```
mysql -u [username] -p [database] (will prompt for password)
```

Create new database: 
```
create database [database_name];
```

Select database: 
```
use [database_name];
```

Determine what database is in use: 
```
select [database_name]();
```

Show all tables: 
```
show tables;
```

Show table structure: 
```
describe [table_name];
```

List all indexes on a table: 
```
show index from [table_name];
```

Create new table with columns: 
```
CREATE TABLE [table_name] ([column_name] VARCHAR(120), [another-column_name] DATETIME);
```

Adding a column: 
```
ALTER TABLE [table_name] ADD COLUMN [column_name] VARCHAR(120);
```

Adding a column with an unique, auto-incrementing ID: 
```
ALTER TABLE [table_name] ADD COLUMN [column_name] int NOT NULL AUTO_INCREMENT PRIMARY KEY;
```

Inserting a record:
```
INSERT INTO [table_name] ([column_name], [column_name]) VALUES ('[value]', [value]');
```

MySQL function for datetime input: 
```
NOW()
```

Selecting records: 
```
SELECT * FROM [table_name];
```

Explain records: 
```
EXPLAIN SELECT * FROM [table_name];
```

Selecting parts of records: 
```
SELECT [column_name], [another-column_name] FROM [table_name];
```

Counting records: 
```
SELECT COUNT([column_name]) FROM [table_name];
```

Counting and selecting grouped records: 
```
SELECT *, (SELECT COUNT([column_name]) FROM [table_name]) AS count FROM [table_name] GROUP BY [column_name];
```

Selecting specific records: 
```
SELECT * FROM [table_name] WHERE [column_name] = [value]; (Selectors: <, >, !=; combine multiple selectors with AND, OR)
```

Select records containing [value]: 
```
SELECT * FROM [table_name] WHERE [column_name] LIKE '%[value]%';
```

Select records starting with [value]: 
```
SELECT * FROM [table_name] WHERE [column_name] LIKE '[value]%';
```

Select records starting with val and ending with ue: 
```
SELECT * FROM [table_name] WHERE [column_name] LIKE '[val_ue]';
```

Select a range: 
```
SELECT * FROM [table_name] WHERE [column_name] BETWEEN [value1] and [value2];
```

Select with custom order and only limit: 
```
SELECT * FROM [table_name] WHERE [column_name] ORDER BY [column_name] ASC LIMIT [value]; (Order: DESC, ASC)
```

Updating records: 
```
UPDATE [table_name] SET [column_name] = '[updated-value]' WHERE [column_name] = [value];
```

Deleting records: 
```
DELETE FROM [table_name] WHERE [column_name] = [value];
```

Delete all records from a table (without dropping the table itself): 
```
DELETE FROM [table_name]; (This also resets the incrementing counter for auto generated columns like an id column.)
```

Delete all records in a table: 
```
truncate table [table_name];
```

Removing table columns: 
```
ALTER TABLE [table_name] DROP COLUMN [column_name];
```

Deleting tables
```
DROP TABLE [table_name];
```

Deleting databases
```
DROP DATABASE [database];
```

Custom column output names
```
SELECT [column_name] AS [custom-column] FROM [table_name];
```

Export a database dump
```
mysqldump -u [username] -p [database] > db_backup.sql
```

Import a database dump
```
mysql -u [username] -p -h localhost [database] < db_backup.sql
```

Logout
```
exit;
```

Aggregate functions

Select but without duplicates
```
SELECT distinct name, email, acception FROM owners WHERE acception = 1 AND date >= 2015-01-01 00:00:00
```

Calculate total number of records
```
SELECT SUM([column_name]) FROM [table_name];
```

Count total number of [column_name] and group by [category-column]
```
SELECT [category-column], SUM([column_name]) FROM [table_name] GROUP BY [category-column];
```

Get largest value in [column_name]
```
SELECT MAX([column_name]) FROM [table_name];
```

Get smallest value
```
SELECT MIN([column_name]) FROM [table_name];
```

Get average value
```
SELECT AVG([column_name]) FROM [table_name];
```

Get rounded average value and group by [category-column]
```
SELECT [category-column], ROUND(AVG([column_name]), 2) FROM [table_name] GROUP BY [category-column];
```

Multiple tables

Select from multiple tables
```
SELECT [table1].[column_name], [table1].[another-column_name], [table2].[column_name] FROM [table1], [table2];
```

Combine rows from different tables
```
SELECT * FROM [table1] INNER JOIN [table2] ON [table1].[column_name] = [table2].[column_name];
```

Combine rows from different tables but do not require the join condition
```
SELECT * FROM [table1] LEFT OUTER JOIN [table2] ON [table1].[column_name] = [table2].[column_name]; (The left table is the first table that appears in the statement.)
```

Rename column or table using an alias
```
SELECT [table1].[column_name] AS '[value]', [table2].[column_name] AS '[value]' FROM [table1], [table2];
```

Users functions

List all users
```
SELECT User,Host FROM mysql.user;
```

Create new user
```
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
```

Grant ALL access to user for * tables
```
GRANT ALL ON database.* TO 'user'@'localhost';
```

Find out the IP Address of the Mysql Host
```
SHOW VARIABLES WHERE Variable_name = 'hostname'; (source)
```
