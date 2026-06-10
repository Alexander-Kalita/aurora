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

![Aurora Architecture](docs/aurora_architecture.png)

## Pipeline validation
After the initial infrastructure setup in Terraform and Snowflake, the pipeline execution is fully managed through GitHub Actions.

The workflow can be triggered manually via the GitHub Actions interface. Once started, the pipeline executes all defined steps automatically, including data ingestion, loading, transformation, and validation. In this project, the complete workflow executes in 44 seconds.

The pipeline runs sequentially, and each step can be observed in the GitHub Actions interface. The validation step executes SQL queries directly within the pipeline to verify data correctness. These validation results are displayed in the GitHub Actions logs, providing immediate confirmation that the data pipeline executed successfully and produced consistent results. Below are examples of the pipeline execution, steps and validation output.

## Project structure
The project follows a modular and structured repository design aligned with data engineering best practices. It consists of four main components, each responsible for a specific part of the pipeline:

- **terraform/**
Contains Infrastructure-as-Code (IaC) configuration used to provision AWS resources such as the S3 bucket and IAM roles.

- **.github/workflows/**
Defines the GitHub Actions pipeline used for orchestrating data ingestion, loading, transformation, and validation steps.

- **snowflake/**
Includes SQL scripts for:
  - Infrastructure setup (`setup.sql`)  
  - Data ingestion into the `RAW` schema (`load.sql`)  
  - Data transformation into the `CURATED` schema (`transform.sql`)
 
- **data/**
Stores the source dataset (`superstore.csv`) used in this pipeline.

```
aurora/
├─ README.md
├─ .gitignore
├─ terraform/
│  ├─ providers.tf
│  ├─ variables.tf
│  ├─ main.tf
│  ├─ outputs.tf
│  └─ versions.tf
├─ data/
│  └─ superstore.csv
├─ snowflake/
│  ├─ setup.sql
│  ├─ load.sql
│  └─ transform.sql
└─ .github/
   └─ workflows/
      ├─ terraform.yml
      └─ ingest.yml
```

## Pipeline reusability
Aurora is designed as a reusable data pipeline that can be deployed and executed in any local environment with minimal configuration.

The pipeline is modular and cloud-based, allowing users to process different structured datasets by adjusting configuration variables and input data files. Infrastructure provisioning, data ingestion, transformation, and validation are fully automated, making the solution easily reproducible.

### Prerequisites
To run this project locally, the following tools and services are required:
- **Visual Studio Code** – [VS Code Download](https://code.visualstudio.com/download)  
- **AWS account (Free Tier)** – [AWS Free Tier](https://aws.amazon.com/free/)  
- **AWS CLI** – [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)  
- **Terraform CLI** – [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)  
- **Snowflake account** – [Snowflake Trial](https://docs.snowflake.com/en/user-guide/admin-trial-account)  
- **GitHub account** – [GitHub Account Creation](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github)  

### Setup Overview
The pipeline can be adapted to new datasets by replacing the source CSV file and updating schema definitions in the SQL scripts. To use the pipeline:
1. Clone this repository  
2. Configure required credentials (AWS, Snowflake, GitHub Secrets)  
3. Deploy infrastructure using Terraform  
4. Execute Snowflake setup script (`setup.sql`)  
5. Trigger the GitHub Actions workflow  

### References
The following resources were used as supporting documentation for this project:
- Terraform AWS Guide – https://developer.hashicorp.com/terraform/tutorials/aws-get-started
- Terraform GitHub Actions Integration – https://developer.hashicorp.com/terraform/tutorials/automation/github-actions
- Snowflake GitHub Actions (Snowflake CLI) – https://docs.snowflake.com/en/developer-guide/snowflake-cli/cicd/github-action


