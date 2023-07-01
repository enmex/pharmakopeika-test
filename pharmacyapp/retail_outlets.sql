CREATE TABLE [dbo].[retail_outlets]
(
	[id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [name] VARCHAR(100) NOT NULL, 
    [admin_name] VARCHAR(50) NOT NULL, 
    [admin_surname] VARCHAR(50) NOT NULL, 
    [admin_patronymic] VARCHAR(10) NOT NULL, 
    [region] VARCHAR(50) NOT NULL,
    CONSTRAINT [FK_retail_outlets_regions] FOREIGN KEY ([region]) REFERENCES [regions]([name])
)
