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