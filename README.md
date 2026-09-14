# DE_Project1
Hlumisa First Snowflake Project

Database, Schema and Table creation and Loading data

I was requested to establish a structured and reliable relational data model, a dedicated database and schema were initialized in Snowflake.
Data types were explicitly assigned based on the semantic properties of each field (such as DATETIME for timestamps and INT for quantities/prices) rather than using VARCHAR configurations for all columns.
This ensures optimized storage performance and strict data validation at the database layer.

Data Load Verification

After executing the data pipeline ingestion stages, record integrity constraints were verified using row-count aggregations.
The results match the expected manifest exactly, validating that no truncation or data corruption occurred:
SELECT COUNT(*) FROM DE_PROJECT1.DBO.customers; 50 Rows Confirmed; SELECT COUNT(*) FROM DE_PROJECT1.DBO.Products; 20 Rows Confirmed and SELECT COUNT(*) FROM DE_PROJECT1.DBO.ORDERS; 150 Rows Confirmed

PDF file has Screenshots of my Snowflake sidebar displaying the DE_PROJECT1 database, DBO schema, and the three tables created.
Also Screenshots  of successful data imports as well as a failed one due to missed columns which was later updated and loaded successfully.
