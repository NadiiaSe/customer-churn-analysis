# Customer Churn Analysis

**SQL · Excel**

## Business Question

Which customer behaviors and subscription patterns are associated with higher churn?

## What I Analyzed

I analyzed customer usage, subscription plans, payment activity, login behavior, and support interactions to understand which patterns are associated with customer churn.

I also looked at combinations of these factors to identify customers with higher churn risk.

## Key Findings

- **57.3%** overall churn rate
- **73.5%** churn among low-usage customers
- Customers with **2+ payment failures** showed higher churn
- Customers with longer periods since their last login showed higher churn
- The identified high-risk segment had an **84.0%** churn rate

## Business Takeaways

The analysis shows that low customer usage, payment problems, and reduced customer activity are associated with higher churn.

These signals can be used to identify customers who may benefit from proactive retention actions.

> The analysis identifies associations between customer characteristics and churn; it does not establish causal relationships.

---

## SQL Analysis

I structured the analysis as a series of questions, starting with the overall churn rate and gradually moving toward customer segmentation.

### 1. Overall Churn Rate
`01_overall_churn.sql`

**Question:** What is the overall churn rate?

**Analysis:** I calculated the total number of customers, the number of churned customers, and the overall churn rate to establish a baseline for the analysis.

---

### 2. Churn by Subscription Plan
`02_plan_analysis.sql`

**Question:** Does churn differ between subscription plans?

**Analysis:** I compared the number of customers, churned customers, and churn rate across subscription plans.

---

### 3. Payment Failures
`03_payment_failures.sql`

**Question:** Is payment activity associated with customer churn?

**Analysis:** I compared churn rates across different numbers of payment failures.

---

### 4. Customer Usage and Churn
`04_usage_analysis.sql`

**Question:** Is lower customer usage associated with higher churn?

**Analysis:** I grouped customers by average weekly usage into Low, Medium, and High Usage segments and compared their churn rates.

**Result:** Low-usage customers had a **73.5% churn rate**.

---

### 5. Last Login and Churn
`05_last_login_analysis.sql`

**Question:** Is customer inactivity associated with higher churn?

**Analysis:** I grouped customers by the number of days since their last login and compared churn rates across the groups.

---

### 6. Support Tickets and Churn
`06_support_tickets.sql`

**Question:** Is the number of support tickets associated with customer churn?

**Analysis:** I compared churn rates across different levels of support activity.

---

### 7. Grouping Payment Failures
`07_payment_failures_groups.sql`

**Question:** Does a simpler payment-risk grouping make the relationship with churn clearer?

**Analysis:** I grouped customers into two categories: 0–1 payment failures and 2+ payment failures, then compared their churn rates.

---

### 8. Churn by Subscription Plan Using a CTE
`08_plan_analysis_CTE.sql`

**Question:** Can the subscription-plan analysis be structured more clearly using a CTE?

**Analysis:** I used a Common Table Expression to separate the calculation of customer and churned-customer counts from the final churn-rate calculation.

---

### 9. Identifying High-Risk Customers
`09_high_risk_customers.sql`

**Question:** Can customers with multiple risk signals be identified?

**Analysis:** I defined a high-risk group using two signals: low weekly usage and at least two payment failures.

---

### 10. Ranking High-Risk Customers
`10_RANK_high_risk_customers.sql`

**Question:** Which high-risk customers show stronger risk signals?

**Analysis:** I used `RANK()` to rank customers based on payment failures and days since their last login.

---

### 11. Customer Risk Segmentation
`11_risk_segment.sql`

**Question:** Can customers be divided into meaningful risk segments?

**Analysis:** I combined usage and payment behavior to classify customers into High Risk, Medium Risk, and Low Risk segments and compared churn across the groups.

---

## Tools

**SQL:** joins, aggregations, CTEs, window functions, conditional logic, customer segmentation

**Excel:** supporting analysis, calculations, pivot tables, and validation

## Project Files

The repository includes the SQL queries used for the analysis and the Excel workbook containing the supporting analysis.
