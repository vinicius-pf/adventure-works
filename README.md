# Adventure Works DW and BI

In this repository, it is documented the process of creating a E-L-T pipeline and dashboard creation for Adventure Works, a fictional bike shop. 

This project was develop a part of the final challenge to be awarded the Analytics Engineer Certification by Indicium.

## About the company

Before the project, the company shared some information about the company climate and its current context. In the meeting they also explained about its database structure and defined some objetives for his project. 

### Current context



### Database information

Its a PostgreSQL server.



### BI needs


- Qual o número de pedidos, quantidade comprada, valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?
- Quais os produtos com maior ticket médio por mês, ano, cidade, estado e país?
- Quais os 10 melhores clientes por valor total negociado filtrado por produto, tipo de cartão, motivo de venda, data de venda, status, cidade, estado e país?
- Quais as 5 melhores cidades em valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?
- Qual o número de pedidos, quantidade comprada, valor total negociado por mês e ano (dica: gráfico de série de tempo)?
- Qual produto tem a maior quantidade comprada para o motivo “Promotion”?
## E-L Pipeline

This project will follow a Extract, Load, Transform(ELT) pipeline. It is the current modern data stack pipeline and it is better to work with Google Cloud solutions.

### Airbyte

To extract the data from the company's database source, Airbyte was used locally. It was installed in a Docker container and both the source and destination were configured. After that, the connection was made and the data was copied to a Big Query instance.

add images

### Google BigQuery

The google big query instance
## T
To tranform the data and create the dimensions and fact tables, 

### Dimensions and Facts

### DBT

## BI

### Connecting to the database

### Dashboard

## Next steps

## Sources

