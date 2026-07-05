## Total customers
  SELECT
  COUNT(*) Total_customers
  FROM Customers_churn;

## Churned Customers
  SELECT
  SUM(CASE WHEN Churn_label = 'Yes' THEN 1 ELSE 0 END) Churned_customers
  FROM Customers_churn;

## Churn rate
   SELECT
  COUNT(*) Total_customers,
  SUM(CASE WHEN Churn_label = 'Yes' THEN 1 ELSE 0 END) Churned_customers,
  ROUND(
  SUM(CASE WHEN Churn_label = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 4) Churn_rate
  FROM Customers_churn;

  
## High risk customers
  SELECT
  Contract_type,
  Internet_service,
  Tech_support,
  COUNT(*) Total_customers,
  SUM(CASE WHEN Churn_label = 'Yes' THEN 1 ELSE 0 END) Churned_customers,
  ROUND(
  SUM(CASE WHEN Churn_label = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) Churn_rate
  FROM Customers_churn
  WHERE Contract_type = 'Month-to-month'
  AND Internet_service = 'Fiber optic'
  AND Tech_support = 'No'
  GROUP BY Contract_type, Internet_service, Tech_support;


## Average tenure by churn_status
  SELECT
  churn_label,
  ROUND(AVG(tenure), 2) avg_tenure
  FROM Customers_churn
  GROUP BY churn_label;


## Average monthly charges by churn status
  SELECT
  churn_label,
  AVG(tenure),
  ROUND(AVG(Monthly_charges), 2) avg_monthly_charges_by_churn_status
  FROM Customers_churn
  GROUP BY churn_label;


## Churn by contract type
  SELECT
  Contract_type,
  ROUND(
  SUM(CASE WHEN Churn_label = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) Churn_by_contracttype
  FROM Customers_churn
  GROUP BY Contract_type
  ORDER BY Churn_by_contracttype DESC;

  







