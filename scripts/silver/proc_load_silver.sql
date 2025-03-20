

EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME;
    
    BEGIN TRY
        PRINT '==========================================================================';
        PRINT '                          Loading the Bronze Layer                         ';
        PRINT '==========================================================================';

        -- CRM Tables
        PRINT '---------------------------------------------------------------------------';
        PRINT '                          Loading CRM Tables                               ';
        PRINT '---------------------------------------------------------------------------';

        -- CRM Customer Info
        PRINT '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> Inserting Data Into: bronze.crm_cust_info';
        SET @start_time = GETDATE();
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\hp\Desktop\My_Projects\SQL_Warehouse\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '---------------------------------------------------------------------------';

        -- CRM Product Info
        PRINT '>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> Inserting Data Into: bronze.crm_prd_info';
        SET @start_time = GETDATE();
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\hp\Desktop\My_Projects\SQL_Warehouse\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '---------------------------------------------------------------------------';

        -- CRM Sales Details
        PRINT '>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> Inserting Data Into: bronze.crm_sales_details';
        SET @start_time = GETDATE();
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\hp\Desktop\My_Projects\SQL_Warehouse\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '---------------------------------------------------------------------------';

        -- ERP Tables
        PRINT '---------------------------------------------------------------------------';
        PRINT '                          Loading ERP Tables                               ';
        PRINT '---------------------------------------------------------------------------';

        -- ERP Location A101
        PRINT '>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
        SET @start_time = GETDATE();
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\hp\Desktop\My_Projects\SQL_Warehouse\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '---------------------------------------------------------------------------';

        -- ERP Customer AZ12
        PRINT '>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
        SET @start_time = GETDATE();
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\hp\Desktop\My_Projects\SQL_Warehouse\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '---------------------------------------------------------------------------';

        -- ERP PX Category G1V2
        PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
        SET @start_time = GETDATE();
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\hp\Desktop\My_Projects\SQL_Warehouse\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '---------------------------------------------------------------------------';

    END TRY
    BEGIN CATCH
        PRINT '========================================================================';
        PRINT '                ERROR OCCURRED DURING LOADING BRONZE LAYER               ';
        PRINT '========================================================================';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '========================================================================';
    END CATCH
END;
