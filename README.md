# TelerikBlazorGrid-Dapper

Demonstrates a Telerik Grid in Blazor, using the OnRead event along with Dapper and Dapper.SqlBuilder, to generate your SQL queries on the fly supporting most aspects of Telerik Grid.
Telerik Grid works nicely with Entity Framework, you can use `.ToDataSourceResultAsync()` and everything for sorting etc happens on the database. If you are using Dapper you can use that, however as Dapper doesn't return an IQueryable, you will be fetching the entire dataset and then filtering, paging and sorting in code, rather than on your database.

## Features
- [x] Paging
- [x] Sorting
- [x] Filtering
- [ ] Grouping
- [ ] Aggregate Information

## Setup
Once you clone the repo, you will need to publish the example database project provided. It has a post deploy script to fill it with sample data ready to go. Once you have published this, save the connection string as the Default Connection in user secrets or in `AppSettings.Development.json`
This was originally built on the trial version of Telerik Blazor. If you are not on the trial then you should also change the required references over to non trial (nuget packages, references in `_Host.cshtml`)
After that, everything should run fine.

## The Magic
If you are looking for where the majority of the code that performs this is held, take a look at `TelerikBlazorGrid_Dapper.DataAccess.Extensions.SqlBuilderExtensions`. We build up 2 sql templates, one for the query to get our data, and another to query the total count.
By default, you should only need to provide this method the table (or view) name you wish to query. However there are instances where you wish to query a different table or view for both the data selection and the count - For example where you have a view containing a join as the count will become inaccurate, counting all the duplicate rows.
You may also specify a different default sort field and direction.

## The Result
This picture shows the end result. A table with full sort, filter and paging functionality - Using OnRead through dapper, and passing the handling of all the Grid functionalities over to the database.
![image](https://user-images.githubusercontent.com/11229848/138615157-93105680-3114-4ad3-9c05-168749a58f62.png)
