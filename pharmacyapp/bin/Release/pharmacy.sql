/*
Скрипт развертывания для pharmacy

Этот код был создан программным средством.
Изменения, внесенные в этот файл, могут привести к неверному выполнению кода и будут потеряны
в случае его повторного формирования.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "pharmacy"
:setvar DefaultFilePrefix "pharmacy"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Проверьте режим SQLCMD и отключите выполнение скрипта, если режим SQLCMD не поддерживается.
Чтобы повторно включить скрипт после включения режима SQLCMD выполните следующую инструкцию:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Для успешного выполнения этого скрипта должен быть включен режим SQLCMD.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Идет удаление Ограничение по умолчанию ограничение без названия для [dbo].[document_types]…';


GO
ALTER TABLE [dbo].[document_types] DROP CONSTRAINT [DF__document___enter__14270015];


GO
PRINT N'Идет удаление Ограничение по умолчанию ограничение без названия для [dbo].[movement_documents]…';


GO
ALTER TABLE [dbo].[movement_documents] DROP CONSTRAINT [DF__movement_d__date__151B244E];


GO
PRINT N'Идет создание Ограничение по умолчанию ограничение без названия для [dbo].[document_types]…';


GO
ALTER TABLE [dbo].[document_types]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [entered];


GO
PRINT N'Идет создание Ограничение по умолчанию ограничение без названия для [dbo].[movement_documents]…';


GO
ALTER TABLE [dbo].[movement_documents]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [date];


GO
/*
Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут добавлены в скрипт построения.		
 Используйте синтаксис SQLCMD для включения файла в скрипт после развертывания.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте после развертывания.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

insert into regions values ('Омск');
insert into regions values ('Новосибирск');

insert into products_groups values ('БАД');
insert into products_groups values ('Лекарства');
insert into products_groups values ('Витамины');

insert into inventory_items
values ('A00-000000-00000-001', 'Аспирин', 'Лекарства');
insert into inventory_items
values ('B00-000000-00000-002', 'Корвалол', 'Лекарства');
insert into inventory_items
values ('C00-000000-00000-003', 'Омега-3', 'Витамины');
insert into inventory_items
values ('D00-000000-00000-004', 'Витамин В12', 'БАД');
insert into inventory_items
values ('E00-000000-00000-005', 'Витамины consumed', 'БАД');

insert into retail_outlets (name, region, admin_name, admin_surname, admin_patronymic)
values ('Точка#1 Омск', 'Омск', 'Иванов', 'Иван', 'Иванович');
insert into retail_outlets (name, region, admin_name, admin_surname, admin_patronymic)
values ('Точка#1 Новосибирск', 'Новосибирск', 'Петров', 'Иван', 'Иванович');

insert into document_types (item_article, quantity, receipt, retail_outlet_id)
values ('A00-000000-00000-001', 3, 500, 1);
insert into document_types (item_article, quantity, receipt, retail_outlet_id)
values ('A00-000000-00000-001', 4, 750, 2);
insert into document_types (item_article, quantity, receipt, retail_outlet_id)
values ('B00-000000-00000-002', 10, 300, 1);
insert into document_types (item_article, quantity, receipt, retail_outlet_id)
values ('B00-000000-00000-002', 25, 750, 1);
insert into document_types (item_article, quantity, receipt, retail_outlet_id)
values ('C00-000000-00000-003', 25, 750, 1);
insert into document_types (item_article, quantity, receipt, retail_outlet_id)
values ('C00-000000-00000-003', 25, 750, 1);
insert into document_types (item_article, quantity, receipt, retail_outlet_id)
values ('D00-000000-00000-004', 25, 750, 1);
insert into document_types (item_article, quantity, receipt, retail_outlet_id)
values ('D00-000000-00000-004', 25, 750, 1);
insert into document_types (item_article, quantity, receipt, retail_outlet_id)
values ('E00-000000-00000-005', 3, 450, 1);
insert into document_types (item_article, quantity, receipt, retail_outlet_id)
values ('E00-000000-00000-005', 6, 900, 1);

insert into movement_documents (
    article, 
    quantity, 
    retail_outlet_id, 
    cost_price, 
    total_price, 
    manager_name, 
    manager_surname, 
    manager_patronymic)
values ('A00-000000-00000-001', 1, 1, 130, 130, 'Иван', 'Иванов', 'Иванович');
insert into movement_documents (
    article, 
    quantity, 
    retail_outlet_id, 
    cost_price, 
    total_price, 
    manager_name, 
    manager_surname, 
    manager_patronymic)
values ('B00-000000-00000-002', 2, 1, 30, 60, 'Иван', 'Иванов', 'Иванович');
insert into movement_documents (
    article, 
    quantity, 
    retail_outlet_id, 
    cost_price, 
    total_price, 
    manager_name, 
    manager_surname, 
    manager_patronymic)
values ('A00-000000-00000-001', 1, 2, 130, 130, 'Иван', 'Иванов', 'Иванович');
insert into movement_documents (
    article, 
    quantity, 
    retail_outlet_id, 
    cost_price, 
    total_price, 
    manager_name, 
    manager_surname, 
    manager_patronymic)
values ('B00-000000-00000-002', 2, 2, 30, 60, 'Иван', 'Иванов', 'Иванович');
GO

GO
PRINT N'Обновление завершено.';


GO
