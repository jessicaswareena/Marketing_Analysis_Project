/* =========================================================
   PROJECT: Marketing Conversion Funnel & Optimization
   FILE: 03_add_revenue.sql
   PURPOSE:
   Enrich session-level data with revenue information.

   BUSINESS CONTEXT:
   - Revenue exists at order-item level.
   - Dashboards operate at session level.
   - Revenue must be correctly attributed to sessions.

   WHAT THIS SCRIPT DOES:
   1. Aggregates order item prices to order-level revenue
   2. Joins revenue to session table using order_id
   3. Ensures only completed orders contribute revenue

    WHY THIS MATTERS:
   - Prevents double-counting revenue
   - Ensures revenue metrics align with conversion logic
   - Enables accurate revenue per session analysis

   OUTPUT:
   TOTAL_ORDER_REVENUE column in session fact table
   ========================================================= */
USE Project1_MarketingAnalysis;
GO

IF COL_LENGTH('dbo.[E-COMMERCE_Marketing_Analysis]', 'TOTAL_ORDER_REVENUE') IS NULL
BEGIN
    ALTER TABLE dbo.[E-COMMERCE_Marketing_Analysis]
    ADD TOTAL_ORDER_REVENUE DECIMAL(12,2);
END
GO

;WITH ORDER_REVENUE AS (
    SELECT
        OI.order_id,
        -- Aggregate revenue at the order level from order items
        -- Casting ensures numeric consistency
        SUM(TRY_CAST(OI.sale_price AS DECIMAL(12,2))) AS TOTAL_ORDER_REVENUE 
    FROM dbo.Order_items OI
    INNER JOIN dbo.Orders O
        ON OI.order_id = O.order_id
    WHERE O.status = 'Complete' -- Only completed orders should contribute to revenue
    GROUP BY OI.order_id
)
UPDATE S
SET S.TOTAL_ORDER_REVENUE = ORV.TOTAL_ORDER_REVENUE -- Update session table with revenue using order_id
FROM dbo.[E-COMMERCE_Marketing_Analysis] S
LEFT JOIN ORDER_REVENUE ORV -- Join is done on ORDER_ID to preserve session grain
    ON S.order_id = ORV.order_id;