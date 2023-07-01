CREATE TABLE [dbo].[document_types]
(
	[item_article] NCHAR(20) NOT NULL , 
    [quantity] INT NOT NULL, 
    [entered] DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, 
    [receipt] FLOAT NOT NULL, 
    [retail_outlet_id] INT NOT NULL, 
    [id] INT IDENTITY(1,1) NOT NULL, 
    CONSTRAINT [FK_document_types_inventory_items] FOREIGN KEY ([item_article]) REFERENCES [inventory_items]([article]), 
    CONSTRAINT [FK_document_types_retail_outlets] FOREIGN KEY ([retail_outlet_id]) REFERENCES [retail_outlets]([id]), 
    PRIMARY KEY ([id])
)
