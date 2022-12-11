# Adventure Works DW and BI

In this repository, it is documented the process of creating an ELT pipeline and dashboard development for Adventure Works, a fictional bike shop.

This project was developed as the final challenge to be awarded the Analytics Engineer Certification by Indicium.

## About the company

Before the project, the company shared some information about the company climate and its current context. In the meeting they also explained about its database structure and defined some objetives for his project.

### Current context

Adventure Works, a fast growing bike store, wants to use data to continue its growth and diferentiate itself from their competitors. The board of the company already has some questions to start the project in a quick way that can be answered by crossing the information that the company already has in its data center.

Despite the company's desire, the project isn't well accepted in the company. The main complaints are with the schedule of the project and its budget. There is also concern about the value this project can bring.

This concerns are mainly stated by Silvana Teixeira, the company's commercial director. She is concerned because other data driven projects didn't bring to life the promisses. With this backgorund, she believes that the investment in this project could have been better spent in adversiment that would result in immediate sales. In the first meetings, it will be important to show her how this project will be different than the previous projects in the company. It will also help to show other Indicium projects, so she can understand how the project will happen.

These concerns, however, aren't shared by Carlos Silveira, the company's CEO, and João Muller, the company's innovation director. They believe in this project and in its long term succes. To help to project they assigned Gabriel Santos, the current data base administrator. With Gabriel's help, it is possible to understand the database structure and its content.

### Database information

Currently the company has a PostgreSQL database with 6 different schemas.

Schema | Description
------ | -------
HR | It contains information about the company's employees, departments and shifts.
Sales | It contains information about the company's sales, such as orders, customers and special offers.
Person | It contains the data about the people the company does business, such as names, addresses and online contact.
Purchasing | It contains information about the company's suppliers and shipping partners.
Production | It contains information about the company's products, such as categories, documentation and reviews.

The access to this database was provided via an IP connection with a username and password shared by the company.

### BI needs

The company requested a dashboard containing the answers to some business questions:

- What's the total amount of orders, bought items and total sales value? They need to be filtered by product, card type, sales reason, order date, client, sale status, city, province or state, and country.
- What are the products with the biggest average ticket by month, year, city, province or state, and country?
- What are the 10 best clients, according to total sales value? This needs to be filtered by product, card type, sales reason, order date, status, city, province or state, and country.
- What are the 5 best cities, according to total sales value? This needs to be filtered by product, card type, sales reason, order date, client, status, city, province or state, and country.
- What's the total amount of orders, bought items and total sales value by month and year?
- Which product has the most sold quantity with the reason being 'Promotion'?

With these questions in mind, it is possible to start the ELT pipeline. Inicially, it will be created a dimensional diagram to discover which tables are going to be imported to a BigQuery instance using Stitch Data (EL). After that, DBT will be used to transform the tables into dimensions and facts tables (T), that will power the Power BI dashboard.

## ELT process

### Dimensional diagram

Using the questions that the company needs answers and studying the database information shared by the IT analyst, a dimensional diagram was created, showing what tables would be imported and how the dimensions of the data warehouse would be constructed. In this diagram there is also the definition of what table is the fact table for this project.

add image

With the dimensions and fact tables defined, it is possible to import only the need tables from the source. This will be achieved with Stitch Data.

### Stitch Data

In the first attempt to extract the data from the company's database source, airbyte was used locally. Although a good option, while trying to run Airbyte to extract and load the data in the BigQuery instance, some problems were discovered. After the first sucessful sync, the succeding syncronizations always failed. Because of that, Stitch Data was used as an alternative and better option.

For this project, Stitch was used during a free trial. However, the tool was effective and allowed some adjustments to be made.

add image Stitch

With Stitch Data configured, it synced the data between source and destination and it was possible to create the project and tranform the data using DBT.

### Google BigQuery

For this project, it was created a Google BigQuery instance to be the Data Warehouse. Although the tables were in different schemas in the source, they were all stored in the same schema in the data warehouse.

add Google big query schema

With the data warehouse configured, it is possible to transform the data using DBT. The raw data will be read from the data warehouse and the transformed data will be stored in its own schema.

### T

The tranform process was made with DBT. This data transformation tool allows the modeling and development of data warehouses with some importat features, such as version control and test creation.

Firstly, the source tables were imported in the staging area. This area is used to select the most important columns for the insights. In this stage there is also some data tranformations and columns renaming.

add image staging

After the staging step, the tables were joined following the diagram into dimensions. For this project, the intermediate layer was not used, so the tables were joined in the marts stage.

add image marts.

Each dimension and the fact table has a .yml file with the same name. In this file there are some information about each table and columns, in addition to tests created for some columns.

After the transformation of the data, the tables were stored in another BigQuery schema. This schema will be connected to the Power BI dashboard that will answer the company's main questions.

## Dashboard

To create insights and the requested visualizations, Microsoft Power BI was used. Although this can bring an additional cost to the project, it enables the quick insight this project needs. After this first dashboard, it is possible to discuss further with the company about other options, such as Metabase or Looker Studio.

This is a single page dashboard. It was created 3 measures to calculate the metrics requested by the company

Measure | Company's explanation | DAX Formula
------- | --------------------- | -----------
Number of orders | Distinct count of salesorderid | = DISTINCTCOUNT(fct_sales_header[sales_order_id])
Quantity sold | Sum of orderdty | = SUM(dim_order_details[order_qty])
Total value | Sum of unitprice | = SUM(dim_order_details[unit_price])
Average ticket | Average of unitprice | = AVERAGE(dim_order_details[unit_price])

At the start of the page, there are the filters requested by the company.

add filter image

After the filters, the big numbers are shown. These inform the total sales, quantity sold and total value of the sales. Shortly after, there is a line graph for each number that allows a analysis over time for them

add big numbers

add line graphs

After that, the top cities and customers are shown, followed by the best products by average ticket and the most products sold with the reason being 'Promotion'.

add bar graphs.

## Next steps

With this project done, it is possible to discuss the nexts steps in this partnership with Adventure Works. With the information currently on the database, it is possible to create dashboards containing analysis on the employees sales and state. With other data sources, it is also feasible to create analysis on the marketing department, which could find the best places to advertise the company.

## Sources

https://dataedo.com/download/AdventureWorks.pdf
