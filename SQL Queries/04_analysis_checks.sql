/* =========================================================
   PROJECT: Marketing Conversion Funnel & Optimization
   FILE: 04_analysis_checks.sql
   PURPOSE:
   Perform final analytical validation on the session-level
   marketing fact table before Power BI reporting.

   BUSINESS CONTEXT:
   - Ensures executive KPIs are mathematically and logically correct
   - Confirms revenue and conversion alignment
   - Prevents misleading dashboard metrics
   ========================================================= */
USE Project1_MarketingAnalysis;
GO
SELECT
    COUNT(*) AS total_sessions, -- Total number of sessions captured in the dataset
    /* -----------------------------------------------
       Total converted sessions
       - CONVERTED_FLAG is stored as BIT
       - Cast to INT for aggregation
       ----------------------------------------------- */
    SUM(CAST(CONVERTED_FLAG AS INT)) AS converted_sessions,
    /* -----------------------------------------------
       Total revenue generated from completed orders
       - Revenue exists only for converted sessions
       ----------------------------------------------- */
    SUM(TOTAL_ORDER_REVENUE) AS total_revenue,
    /* -----------------------------------------------
       Revenue per session
       - Measures monetization efficiency of traffic
       - Helps evaluate traffic quality
       ----------------------------------------------- */
    SUM(TOTAL_ORDER_REVENUE) * 1.0 / COUNT(*) AS revenue_per_session,
    /* -----------------------------------------------
       Average Order Value (AOV)
       - Revenue divided by converted sessions
       - NULLIF prevents division-by-zero errors
       ----------------------------------------------- */
    SUM(TOTAL_ORDER_REVENUE) * 1.0 /
        NULLIF(SUM(CAST(CONVERTED_FLAG AS INT)), 0) AS average_order_value
FROM [E-COMMERCE_Marketing_Analysis];

