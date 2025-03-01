/*
=============================================================
Database Creation and Schema Setup
=============================================================
Script Objective:
    This script initializes a new database named 'DataWarehouse' after verifying its existence.  
    If the database is already present, it will be dropped and recreated.  
    Additionally, it establishes three schemas: 'bronze', 'silver', and 'gold'.

Caution:
    Executing this script will delete the 'DataWarehouse' database if it exists.  
    All stored data will be permanently lost. Ensure proper backups are in place before proceeding.
*/

USE master;
GO

-- Remove existing 'DataWarehouse' database if it exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create a fresh 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Define Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

