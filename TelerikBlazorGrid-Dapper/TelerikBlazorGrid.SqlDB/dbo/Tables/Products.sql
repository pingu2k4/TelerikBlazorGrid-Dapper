﻿CREATE TABLE [dbo].[Products]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL,
	[Quantity] INT NOT NULL,
	[OnSale] BIT NOT NULL,
	[Category] INT NOT NULL,
	[Created] DATETIME2 NOT NULL,
)
