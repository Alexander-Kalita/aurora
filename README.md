# Aurora – Automated Cloud Data Pipeline

## Project description
Aurora is an automated cloud data pipeline designed to transform raw data into meaningful insights.

The name "Aurora" is inspired by the Roman goddess of dawn. Just as dawn transforms darkness into light, this pipeline transforms raw data into clear insights. Data that initially exists in a “dark” state (stored locally and unprocessed) is automatically moved, structured, and prepared for analysis in a scalable cloud data platform.
The pipeline eliminates the need for manual infrastructure setup and data migration, which can take significant time. Instead, it automates the entire process using Terraform, AWS, GitHub Actions, and Snowflake, enabling users to start analyzing data within minutes.

Aurora is designed to be reusable with minimal configuration, allowing it to process different structured datasets efficiently. The solution is also cost-effective, as it relies on low-cost AWS S3 storage and Snowflake’s consumption-based pricing model, making it suitable for small to medium datasets.

## Project workflow

Aurora is designed as a simple and lightweight pipeline using core cloud data engineering components. The workflow consists of four main steps:

1. **Infrastructure (Terraform → AWS)**  
Terraform is used as Infrastructure-as-Code (IaC) to provision AWS resources such as the S3 bucket and IAM roles. This eliminates manual setup in the AWS console, reduces human error, and ensures repeatable deployments.

2. **Ingestion (Local → GitHub Actions → S3)**  
The dataset (CSV format) is stored locally and versioned in the repository. GitHub Actions automates the ingestion process by uploading the dataset to an AWS S3 bucket for cloud-based storage.

3. **Storage (AWS S3 → Snowflake RAW layer)**  
The data is stored in Amazon S3 and then loaded into Snowflake using external stages and storage integration into the `RAW` schema, establishing the data foundation for further processing.

4. **Processing (Snowflake RAW → CURATED layer + Validation)**  
The raw data is transformed into a structured and typed format in the `CURATED` schema. Automated validation checks (row count and uniqueness of business keys) are executed within the pipeline to ensure data correctness and integrity.





