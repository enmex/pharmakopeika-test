CREATE TABLE [dbo].[inventory_items]
(
	[article] NCHAR(20) NOT NULL PRIMARY KEY, 
    [name] VARCHAR(100) NOT NULL, 
    [type] VARCHAR(50) NOT NULL, 
    CONSTRAINT [FK_inventory_items_products_groups] FOREIGN KEY ([type]) REFERENCES [products_groups]([product_type])
)
