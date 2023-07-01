CREATE TABLE [dbo].[movement_documents]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [date] DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, 
    [article] NCHAR(20) NOT NULL, 
    [quantity] INT NOT NULL, 
    [cost_price] FLOAT NOT NULL, 
    [total_price] FLOAT NOT NULL, 
    [manager_name] VARCHAR(50) NOT NULL, 
    [manager_surname] VARCHAR(50) NOT NULL, 
    [manager_patronymic] VARCHAR(50) NOT NULL, 
    [retail_outlet_id] INT NOT NULL, 
    CONSTRAINT [FK_movement_documents_retail_outlets] FOREIGN KEY ([retail_outlet_id]) REFERENCES [retail_outlets]([id]), 
    CONSTRAINT [FK_movement_documents_inventory_items] FOREIGN KEY ([article]) REFERENCES [inventory_items]([article])
)
