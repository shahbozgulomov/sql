lesson1
Easy
--Define the following terms: data, database, relational database, and table.
--Data: Raw facts and figures that are collected, stored, and processed by a computer. Data can be in the form of numbers, text, images, audio, or video.
--Database: A structured collection of data that is stored and managed in a way that allows for easy access, retrieval, and manipulation. Databases can be used to store and manage large amounts of data in an organized manner.
--Relational Database: A type of database that stores data in tables with rows and columns. Each table represents a different entity or subject, and the relationships between the tables are defined by keys. Relational databases use a structured query language (SQL) to manage and manipulate the data.
--Table: A collection of data organized into rows and columns. Each row represents a single record, and each column represents a specific attribute or field of the record. Tables are used to store and organize data in a relational database.

--List five key features of SQL Server.
--High Availability and Disaster Recovery (HADR): 
--Security;
--Performance Tuning
--Data Integration and Business Intelligence: 
--Scalabity and Flexibility

--Open SSMS and connect to a SQL Server instance. Take a screenshot of the interface.

create database schoolDB

create table students 
insert into students values(StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT))

--SQL Server is the database management system, SSMS is the tool used to manage SQL Server, and SQL is the language used to interact with the database. They work together to provide a comprehensive solution for data storage, management, and retrieval.


--Data Query Language (DQL):DQL is used to retrieve data from the database.(select)
--DML is used to manipulate data in the database (insert, update, delete, and retrieve data)
--DDL is used to define and modify the database structure (create, alter, drop tables and other database objects).
--DCL is used to control access to data in the database (grant, revoke permissions).
--TCL is used to manage transactions in the database (commit, rollback, savepoint).


insert into students values (4,'haydar',17)

BACKUP DATABASE SchoolDB
TO DISK = 'C:\Backup\SchoolDB_Backup.bak'
WITH FORMAT;
RESTORE DATABASE SchoolDB
FROM DISK = 'C:\Backup\SchoolDB_Backup.bak'
WITH REPLACE;
