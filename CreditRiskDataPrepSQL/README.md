# Credit Risk Data Preparation in SQL

## Project Objective
This folder contains the data extraction and preparation phase for a Probability of Default (PD) model, using Lending Club loan data. The goal is to clean the raw dataset, analyze class distribution, and engineer the analytical base table required for downstream Machine Learning predictive models.

## Technical Skills Demonstrated
* **Exploratory Data Analysis (EDA):** Utilizing `GROUP BY`, aggregation functions, and subqueries to map category distributions.
* **Feature Engineering:** Constructing the target variable (0/1) using logical `CASE WHEN` statements.
* **Data Cleansing:** Filtering and preparing the final dataset for predictive modeling.

## Business Logic & Target Definition
In credit risk modeling, it is crucial to avoid survival bias. The logic applied in this data preparation is:
* **Default (1):** Loans explicitly labeled as 'Charged Off', 'Default', or with severe delays (31-120 days).
* **Performing (0):** Loans successfully 'Fully Paid'.
* **Exclusions (Bias Mitigation):** Indeterminate and ongoing loans ('Current', 'In Grace Period', short-term delays) were strictly excluded (`WHERE ... NOT IN`) as their final status is unknown, preventing bias in the predictive model's training phase.
## Data Source
The dataset used for this project is the public Lending Club Loan Data.
Due to file size limits, the raw dataset is not hosted in this repository. You can download the original data directly from [Kaggle - Lending Club Loan Data CSV](https://www.kaggle.com/datasets/adarshsng/lending-club-loan-data-csv).

