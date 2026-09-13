# Chilean Insurance Market Analysis | CMF

> 📊 **End-to-end Data Analytics project focused on the Chilean insurance market using using a synthetic dataset inspired by concepts, indicators, and reporting practices from the Chilean insurance market and CMF regulatory context.**

[Spanish version](README.md)
---
## 🧭 Quick Navigation

| Resource | Description |
|---|---|
| 📌 [Project Definition](definicion_proyecto.md) | Business scenario, stakeholders, objectives, questions, and hypotheses |
| 🗃️ [Raw Dataset](datos/raw/mercado_asegurador_vida_chile_sintetico.csv) | Original synthetic insurance dataset |
| 🔎 [Data Quality Audit](documentacion/auditoria_calidad_datos.md) | Data-quality assessment and validation process |
| 📖 [Data Dictionary](documentacion/diccionario_datos.md) | Dataset variables and definitions |
| 🗄️ [SQL Methodology](documentacion/metodologia_sql.md) | SQL analysis methodology and validated results |
| 💻 [SQL Scripts](sql/) | Database creation, validation, analysis, and KPI queries |
| 📐 [KPI Dictionary](documentacion/diccionario_kpis.md) | Business definitions, formulas, units, and aggregation rules |
| 🔧 [Power Query](power_query/mercado_asegurador_vida_raw.pq) | Data preparation query |
| 📊 [Power BI Files](Power%20BI/) | Semantic model, DAX documentation, dashboard documentation, and PBIX files |
| 🧮 [DAX Documentation](Power%20BI/medidas_dax.md) | Measures and calculation methodology |
| 🎨 [Dashboard Design](Power%20BI/diseño_dashboard_ejecutivo.md) | Dashboard structure and design decisions |
| 💡 [Findings & Recommendations](documentacion/hallazgos_y_recomendaciones.md) | Complete analytical findings and executive recommendations |
| 🇨🇱 [Spanish README](README.md) | Original Spanish edition of the project |

---
## 📌 Project Overview

This project analyzes the **evolution, competitive structure, and performance of the Chilean insurance market** using official regulatory data published by the **Comisión para el Mercado Financiero (CMF)**.

The main objective was to transform raw regulatory information into a structured analytical solution capable of answering relevant business questions related to:

- 📈 Market growth and evolution over time
- 🏢 Competitive positioning among insurance companies
- 💰 Premium distribution and market concentration
- 🔍 Performance differences across insurance segments
- 📊 Changes in market participation between reporting periods

Rather than focusing only on visualization, the project covers the **complete analytical workflow**, from data preparation and validation to SQL analysis, KPI development, data modeling, and business-oriented visualization.

The final result is an interactive **Power BI dashboard** designed to communicate market information clearly and support data-driven interpretation.

---

## 🎯 Project Objective

The project was developed to simulate a realistic Data Analyst workflow within a regulated financial industry.

Its purpose is to demonstrate the ability to:

- Transform raw regulatory data into analysis-ready datasets
- Detect and validate potential data-quality issues
- Use SQL to explore, validate, and analyze market information
- Define business-oriented KPIs
- Build a structured analytical data model
- Develop interactive dashboards for non-technical stakeholders
- Translate analytical results into clear business insights

---

## ❓ Business Questions

The analysis was designed around questions such as:

- Which insurance companies hold the largest share of the Chilean market?
- How has premium volume evolved across reporting periods?
- How concentrated is the market among the leading insurers?
- Which insurance segments show the strongest market participation?
- How does competitive positioning change over time?
- Which companies gain or lose market share between periods?

These questions guided the analytical process from the SQL layer to the final dashboard.

---

## 🛠️ Tech Stack

| Tool | Application |
|---|---|
| 📗 **Microsoft Excel** | Initial data inspection, preparation, and validation |
| 🗄️ **MySQL / SQL** | Data-quality validation, market analysis, and KPI verification |
| 📊 **Power BI** | Data modeling, DAX measures, visualization, and interactive dashboard development |
| 🧮 **DAX** | KPI calculations, time intelligence, and analytical measures |
| 🐙 **GitHub** | Version control, documentation, and project presentation |

---

## 🔄 Analytical Workflow

The project follows an end-to-end analytical process:

**Raw CMF Data**  
⬇️  
**Data Preparation & Validation**  
⬇️  
**SQL Analysis**  
⬇️  
**KPI Definition & Verification**  
⬇️  
**Data Modeling**  
⬇️  
**Power BI Dashboard**  
⬇️  
**Business Insights & Documentation**

---

## 📊 Dashboard Preview

The final Power BI report is structured into four analytical pages, each designed to answer a different set of business questions about the Chilean life insurance market.

### 🧭 1. Executive Summary

Provides a high-level view of the market through key indicators such as **Direct Premium, Insured Lives, Claims Ratio, Technical Margin, and Composite Solvency Ratio**.

It also summarizes premium trends, leading insurers, and the distribution of the product portfolio.

![Executive Summary](imagenes/ENG/dashboard_executive_summary_preview.png)

---

### 🏢 2. Market & Competition

Focuses on the competitive structure of the insurance market, including **market share, year-over-year growth, and concentration among the largest insurers**.

This page is designed to identify market leaders and changes in competitive positioning over time.

![Market and Competition](imagenes/ENG/dashboard_Market_Share_preview.png)

---

### ⚙️ 3. Technical Performance

Evaluates insurers through technical indicators including **Claims Ratio, Expense Ratio, Technical Result, Technical Margin, and Composite Solvency Ratio**.

The page helps compare operational performance and identify insurers with stronger technical results.

![Technical Performance](imagenes/ENG/dashboard_Technical_performance_preview.png)

---

### 📦 4. Products & Portfolio

Analyzes the composition of insurance premiums by product while tracking changes in **Insured Lives, In-force Policies, New Insured Lives, Cancellations, and Net Portfolio Change**.

This page provides a portfolio-level view of how the market evolves across different insurance products.

![Products and Portfolio](imagenes/ENG/dashboard_product_n_portfolio_preview.png)

---
---

## 🗃️ Data & Project Scope

This project uses a **100% synthetic dataset** created exclusively for educational and portfolio purposes.

The dataset is inspired by the structure, terminology, and analytical indicators commonly used in the Chilean life insurance market and its regulatory environment.

> ⚠️ **Important:** The companies and observations used in this project are fictitious and do not represent the actual performance of insurers operating in Chile.

### Dataset Overview

| Attribute | Description |
|---|---|
| 🏢 Insurance companies | 12 fictitious life insurers |
| 📅 Period analyzed | Q1 2023 – Q4 2025 |
| 📊 Quarterly observations | 144 |
| 🧾 Original variables | 39 |
| 📦 Product categories | 5 |
| 🗓️ Reporting frequency | Quarterly |

The dataset includes financial, commercial, operational, portfolio, and solvency-related variables used to simulate a realistic Business Intelligence case in the life insurance industry.

---

## 🏗️ Analytical Architecture

The project follows an end-to-end analytical workflow in which each layer serves a specific purpose.

```text
Synthetic Insurance Dataset
            │
            ▼
     Data Quality Audit
     Excel / Power Query
            │
            ▼
       MySQL Database
            │
            ▼
 SQL Analysis & Validation
            │
            ▼
      KPI Definition
     12 Core Indicators
            │
            ▼
   Power BI Data Model
      Star Schema
            │
            ▼
       DAX Measures
   Business Logic Layer
            │
            ▼
 Executive Power BI Dashboard
            │
            ▼
 Business Insights & Recommendations

``` 
---
## 🧱 Dimensional Model

The Power BI semantic model was designed using a **star schema**, separating descriptive dimensions from transactional and analytical fact tables.

The model contains:

- `D_Fecha` — calendar dimension covering the complete analytical period. (Power BI, DAX)
- `D_Compania` — dimension containing the 12 fictitious life insurance companies included in the analysis. (Power BI)
- `D_Producto` — dimension containing the five insurance product categories. (Power BI)
- `H_Mercado_Trimestral` — quarterly fact table containing market, financial, portfolio, claims, expense, and solvency indicators by insurer. (Power BI)
- `H_Primas_Producto` — fact table containing premium distribution by insurer, quarter, and insurance product. (Power BI)

The product-level premium table was intentionally separated from the main quarterly fact table to avoid duplicating non-additive measures such as claims, expenses, capital, equity, and insured lives. (Power BI)

The model uses active **one-to-many relationships**, with single-direction filtering from dimensions toward fact tables, providing a simple and controlled structure for analytical reporting. (Power BI)

---
## 🗄️ SQL Analysis & KPI Validation

After the initial data preparation and quality review, the analytical dataset was loaded into **MySQL Workbench 8.0 CE** for structured exploration and independent validation. (SQL)

The SQL stage included:

- Database and table creation with defined data types and composite primary keys. (SQL)
- Validation of row counts, duplicate records, null values, and logical consistency. (SQL)
- Analysis of quarterly premium evolution and insurance-market performance. (SQL)
- Calculation of **Quarter-over-Quarter (QoQ)** and **Year-over-Year (YoY)** growth. (SQL)
- Company rankings and market-share analysis. (SQL)
- Validation of technical and portfolio KPIs before their implementation in Power BI. (SQL)
- Business-rule checks used to identify inconsistencies between related insurance variables. (SQL)

A catalog of **12 core KPIs** was established before dashboard development so that each indicator had a defined business meaning, calculation logic, aggregation method, and expected result. (SQL, Power BI)

This SQL layer served as an independent analytical control, allowing the final Power BI results to be compared against previously validated calculations. (SQL, Power BI)

---
## ✅ Cross-Validation Controls

Before publication, the principal Power BI indicators were reconciled against results previously validated through SQL. (SQL, Power BI)

For **Q4 2025**, the main validation controls included:

| KPI | Validated Result |
|---|---:|
| Direct Premium | 2,435,934 MM CLP |
| QoQ Growth | 4.77% |
| YoY Growth | 4.29% |
| Claims Ratio | 55.70% |
| Expense Ratio | 12.79% |
| Technical Result | 736,330 MM CLP |
| Technical Margin | 31.51% |
| Composite Solvency Ratio | 180.48% |
| Insured Lives | 9,134,304 |
| Insured Lives YoY Growth | -3.83% |
| New Insured Lives | 292,967 |
| Cancellations | 157,660 |
| Net Portfolio Change | 135,307 |

A separate reconciliation was performed between total **Direct Premium** and premiums allocated across insurance products. (SQL, Power BI)

| Validation Control | Result |
|---|---:|
| Direct Premium | 2,435,934 MM CLP |
| Premium by Product | 2,435,937 MM CLP |
| Difference | 3 MM CLP |

The **3 MM CLP difference** results from rounding in the synthetic product allocation and was documented as part of the project's validation process rather than artificially corrected. (SQL, Power BI)

These controls ensure that the dashboard does not rely exclusively on visual-layer calculations and that its principal business indicators remain consistent with the validated analytical layer. (SQL, Power BI)

---
## 🔎 Key Findings

The analysis of the synthetic Chilean life insurance market highlights several relevant patterns for the latest reporting period.

### 📈 1. Premium volume continues to grow

Direct Premium reached **2,435,934 MM CLP in Q4 2025**, representing **4.77% Quarter-over-Quarter growth** and **4.29% Year-over-Year growth**.

This indicates continued expansion in premium volume at the market level.

### 🏢 2. The market shows meaningful concentration

The **Top 5 insurers account for 62.15% of total Direct Premium**, showing that a relatively small group of companies represents a substantial portion of the simulated market.

This makes competitive positioning and changes in market share particularly relevant when evaluating insurer performance.

### ⚙️ 3. Technical performance remains positive

The market recorded a **Technical Result of 736,330 MM CLP** and a **Technical Margin of 31.51%**, alongside a **Claims Ratio of 55.70%** and an **Expense Ratio of 12.79%**.

Together, these indicators suggest positive technical performance in the latest reporting period within the assumptions of the synthetic dataset.

### 👥 4. Insured lives declined despite positive portfolio movement

The market closed Q4 2025 with **9,134,304 Insured Lives**, representing a **3.83% Year-over-Year decline**.

However, the latest period recorded **292,967 New Insured Lives** and **157,660 Cancellations**, producing a positive **Net Portfolio Change of 135,307**.

This suggests that short-term portfolio movement was positive even though the total insured population remained below the previous year's level.

### 🛡️ 5. Solvency remains an important comparative dimension

The market-level **Composite Solvency Ratio reached 180.48%** in Q4 2025.

Because solvency capacity differs across insurers, this indicator complements premium growth and technical profitability when comparing company performance.

---
## 💡 Executive Recommendations

Based on the patterns identified in the synthetic dataset, the following actions could be considered by an insurance management team.

### 📈 1. Evaluate the quality of premium growth

Direct Premium continues to increase, but growth should not be assessed through premium volume alone.

Management should monitor premium expansion together with **Claims Ratio, Expense Ratio, and Technical Margin** to determine whether additional business is translating into sustainable technical performance rather than simply higher written volume.

> **Recommended action:** Maintain a combined view of premium growth and technical KPIs by insurer and reporting period to identify cases where commercial expansion is accompanied by deteriorating profitability.

(SQL, Power BI)

### 🏢 2. Monitor competitive concentration and market-share movements

With the **Top 5 insurers representing 62.15% of Direct Premium**, changes among leading companies can have a meaningful effect on the simulated market structure.

Management should therefore evaluate not only current market share, but also how competitive positions change over time.

> **Recommended action:** Track market-share gains and losses by quarter and compare them with premium growth to distinguish overall market expansion from genuine competitive gains.

(SQL, Power BI)

### ⚙️ 3. Preserve technical discipline as the portfolio grows

The latest period shows positive technical results, supported by a **55.70% Claims Ratio**, **12.79% Expense Ratio**, and **31.51% Technical Margin**.

Future growth should therefore be evaluated against these indicators to identify whether claims or operating expenses begin to consume a larger portion of premium income.

> **Recommended action:** Establish periodic thresholds or internal monitoring ranges for claims, expenses, and technical margin so that deteriorating trends can be investigated before they materially affect technical performance.

(SQL, Power BI)

### 👥 4. Investigate the decline in insured lives

Although Q4 2025 recorded a positive **Net Portfolio Change of 135,307**, total Insured Lives remained **3.83% below the previous year**.

The available aggregated dataset does not provide enough information to determine the cause of this difference.

> **Recommended action:** Extend the analysis with policy-level or customer-level data to examine renewals, cancellations, acquisition cohorts, product migration, and retention behavior.

(SQL, Power BI, Applied Statistics)

### 🛡️ 5. Use solvency together with profitability and growth indicators

The **Composite Solvency Ratio of 180.48%** provides an additional dimension for comparing insurers, but it should not be interpreted in isolation.

An insurer showing strong premium growth or technical profitability may present a different risk profile when solvency indicators are incorporated into the analysis.

> **Recommended action:** Evaluate competitive performance through a balanced framework combining **growth, technical profitability, portfolio development, and solvency-related indicators** rather than ranking insurers through a single KPI.

(SQL, Power BI)

---
## 🧪 Project Methodology

<details>
<summary><strong>View the complete 8-phase analytical workflow</strong></summary>

<br>

### Phase 1 — Business Problem Definition

The project began by defining the business scenario, stakeholders, analytical objectives, business questions, and initial hypotheses.

The objective was to simulate the type of market-analysis problem that could be addressed by a Business Intelligence or Analytics team within a life insurance company.

➡️ [View Project Definition](definicion_proyecto.md)

---

### Phase 2 — Data Quality & Preparation

The synthetic dataset was audited before any analytical work was performed.

The process included validation of:

- Row counts
- Missing values
- Duplicate records
- Data types
- Company and period naming
- Business-rule consistency
- Variable definitions

The final source contained **144 quarterly observations and 39 documented variables**. (Excel, Power Query)

➡️ [View Data Quality Audit](documentacion/auditoria_calidad_datos.md)

➡️ [View Data Dictionary](documentacion/diccionario_datos.md)

---

### Phase 3 — SQL Analysis

The validated dataset was loaded into **MySQL Workbench 8.0 CE**.

SQL was used to create the analytical database, validate the data load, calculate market indicators, analyze company performance, and establish independent reference values for later Power BI validation. (SQL)

➡️ [View SQL Methodology](documentacion/metodologia_sql.md)

➡️ [View SQL Scripts](sql/)

---

### Phase 4 — KPI Definition & Validation

A formal catalog of **12 core KPIs** was created before dashboard development.

Each KPI was documented according to:

- Business definition
- Formula
- Unit
- Aggregation behavior
- Analytical interpretation
- Reference value

The indicators were validated through SQL before being implemented in Power BI. (SQL, Power BI)

➡️ [View KPI Dictionary](documentacion/diccionario_kpis.md)

---

### Phase 5 — Dimensional Modeling

The analytical dataset was transformed into a star-schema model in Power BI.

The final model contains:

- 3 dimension tables
- 2 fact tables
- 5 active one-to-many relationships
- Single-direction filtering from dimensions to facts

The model was validated before development of the executive dashboard. (Power BI, DAX)

---

### Phase 6 — Power BI Dashboard

A four-page executive dashboard was developed using **29 explicit DAX measures**.

The reporting layer covers:

1. Executive Summary
2. Market & Competition
3. Technical Performance
4. Products & Portfolio

The principal Power BI results were reconciled against previously validated SQL controls. (Power BI, DAX, SQL)

➡️ [View DAX Documentation](Power%20BI/medidas_dax.md)

➡️ [View Dashboard Design](Power%20BI/diseño_dashboard_ejecutivo.md)

---

### Phase 7 — Findings & Recommendations

Validated KPIs were transformed into business-oriented findings and executive recommendations.

The analysis focused on market growth, competitive positioning, technical performance, portfolio development, product mix, and solvency-related indicators. (SQL, Power BI, DAX)

➡️ [View Complete Findings & Recommendations](documentacion/hallazgos_y_recomendaciones.md)

---

### Phase 8 — Documentation & Publication

The final phase consolidated the project into a portfolio-ready Business Intelligence case study.

The README was reorganized to prioritize:

**Business context → Dashboard → Findings → Recommendations → Architecture → Validation → Methodology**

This structure allows recruiters to understand the project's business value quickly while preserving the complete technical process for deeper review. (GitHub)

</details>

---
## 💼 What This Project Demonstrates

This project is not only an insurance-market dashboard.

It is also meant to demonstrate a broader set of transferable Data Analytics capabilities:

- 🧹 **Data preparation and quality control**
- 🗄️ **SQL-based analytical reasoning**
- 📐 **Data modeling**
- 📊 **Business Intelligence development**
- 📈 **KPI design and validation**
- 🧠 **Business-oriented interpretation**
- 📝 **Technical documentation**
- 🌎 **Communication of a local business case for an international audience**

---
> ⚠️ **Analytical Scope:** These recommendations are derived exclusively from the synthetic dataset developed for this portfolio project. They represent analytical scenarios and should not be interpreted as recommendations regarding actual insurers or the Chilean insurance market.
