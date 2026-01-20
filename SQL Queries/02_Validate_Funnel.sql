/* =========================================================
   PROJECT: Marketing Conversion Funnel & Optimization
   FILE: 02_FUNNEL VALIDATION: converted_flag vs purchase_event
   PURPOSE: Validate conversion and funnel logic.
   BUSINESS CONTEXT:
   - Conversion metrics must be trusted before visualization.
   - Misaligned purchase events or orders can inflate KPIs.
   - This script ensures analytical integrity.

   WHAT THIS SCRIPT CHECKS:
   1. Converted sessions vs purchase events
   2. Sessions marked converted without a purchase event
   3. Purchase events without a converted flag
   4. Funnel consistency across stages

   WHY THIS MATTERS:
   - Prevents inflated conversion rates
   - Ensures executive KPIs reflect real business outcomes
   - Builds confidence in dashboard insights

   OUTPUT:
   Validation counts for QA and debugging
   ========================================================= */

SELECT
COUNT(*) AS total_sessions,-- Count total sessions in the dataset

SUM(CAST(CONVERTED_FLAG AS INT)) AS converted_sessions, -- Count sessions marked as converted (order completed)
SUM(CAST(PURCHASE_EVENT AS INT)) AS sessions_with_purchase_event,

-- Converted sessions with no purchase event
SUM(
    CASE 
        WHEN CONVERTED_FLAG = 1 AND PURCHASE_EVENT = 0 
        THEN 1 ELSE 0 
    END
) AS converted_without_purchase_event,

-- Sessions that have purchase events but are not marked converted
SUM(
    CASE 
        WHEN CONVERTED_FLAG = 0 AND PURCHASE_EVENT = 1 
        THEN 1 ELSE 0 
    END
) AS purchase_event_without_conversion

FROM [PROJECT1_MarketingAnalysis].[dbo].[E-COMMERCE_Marketing_Analysis];


