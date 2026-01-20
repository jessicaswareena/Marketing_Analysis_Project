/* =========================================================
   PROJECT: Marketing Conversion Funnel & Optimization
   FILE: 01_build_session_fact.sql
   PURPOSE:
   - Build session-level funnel table
   - Attribute completed orders to sessions
   - Apply time-based attribution
   - Calculate conversion & time-to-conversion

   BUSINESS CONTEXT:
   - The EVENTS table is event-level (many rows per session).
   - No user_id is available for reliable user-level tracking.
   - Therefore, analysis must be done at the SESSION level.
   - Orders are not directly linked to sessions, so attribution
     must be time-based.
   ========================================================= */
USE Project1_MarketingAnalysis;
GO

TRUNCATE TABLE [dbo].[E-COMMERCE_Marketing_Analysis];
GO

/* =========================================================
   STEP 1: BUILD SESSION-LEVEL DATA FROM EVENTS
   WHY:
   - Raw events contain multiple rows per session
   - Marketing analysis is done at SESSION level
   - Events timestamps contain 'UTC' which SQL Server
     cannot parse directly
   ========================================================= */
;WITH SESSIONS AS (
    SELECT 
        SESSION_ID,
        MIN(TRY_CONVERT(datetime2, REPLACE(created_at, ' UTC', ''))) AS SESSION_START,  -- Session start = first event time in session
        MAX(TRY_CONVERT(datetime2, REPLACE(created_at, ' UTC', ''))) AS SESSION_END,   -- Session end = last event time in session
        MIN(traffic_source) AS TRAFFIC_SOURCE, -- Traffic source associated with the session
        COUNT(*) AS TOTAL_EVENTS,
          /* Funnel behavior flags */
        MAX(CASE WHEN event_type = 'home' THEN 1 ELSE 0 END)       AS VISITED_HOME,
        MAX(CASE WHEN event_type = 'department' THEN 1 ELSE 0 END) AS VIEWED_DEPARTMENT,
        MAX(CASE WHEN event_type = 'product' THEN 1 ELSE 0 END)    AS VIEWED_PRODUCT,
        MAX(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END)       AS ADDED_TO_CART,
        MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END)   AS PURCHASE_EVENT,
        MAX(CASE WHEN event_type = 'cancel' THEN 1 ELSE 0 END)     AS CANCEL_EVENT
    FROM [dbo].[EVENTS]
    WHERE TRY_CONVERT(datetime2, REPLACE(created_at, ' UTC', '')) IS NOT NULL
    GROUP BY SESSION_ID
    HAVING
        MIN(TRY_CONVERT(datetime2, REPLACE(created_at, ' UTC', ''))) IS NOT NULL
        AND MAX(TRY_CONVERT(datetime2, REPLACE(created_at, ' UTC', ''))) IS NOT NULL
),
/* =========================================================
   STEP 2: CLEAN ORDERS DATA
   WHY:
   - Only COMPLETED orders represent real conversions
   - Ensure order timestamps are valid datetimes
   ========================================================= */
ORDERS_CLEAN AS ( 
    SELECT 
        ORDER_ID,
        TRY_CONVERT(datetime2, created_at) AS ORDER_TIME
    FROM [dbo].[ORDERS]
    WHERE STATUS = 'COMPLETE'
      AND TRY_CONVERT(datetime2, created_at) IS NOT NULL
),
/* =========================================================
   STEP 3: ATTRIBUTE ORDERS TO SESSIONS (LAST-TOUCH)
   BUSINESS RULE:
   - An order is attributed to the most recent session
     that occurred BEFORE the order
   WHY:
   - Dataset does not contain user_id
   - Attribution must be time-based at session level
   ========================================================= */
ORDER_SESSION_ATTRIBUTION AS (
    SELECT
        O.ORDER_ID,
        S.SESSION_ID,
        S.SESSION_START,
        O.ORDER_TIME,
        ROW_NUMBER() OVER (PARTITION BY O.ORDER_ID ORDER BY S.SESSION_START DESC) AS RN -- Rank sessions per order (most recent = 1)
    FROM ORDERS_CLEAN O
    INNER JOIN SESSIONS S
        ON O.ORDER_TIME >= S.SESSION_START
       AND O.ORDER_TIME <= DATEADD(MINUTE, 60, S.SESSION_END)

),
/* =========================================================
   STEP 4: KEEP ONLY THE BEST SESSION PER ORDER
   WHY:
   - One order should be attributed to only ONE session
   ========================================================= */

ATTRIBUTED_ORDERS AS (
    SELECT
        SESSION_ID,
        MIN(ORDER_TIME) AS FIRST_ORDER_TIME,
        MIN(ORDER_ID)   AS FIRST_ORDER_ID,
        COUNT(DISTINCT ORDER_ID) AS ORDERS_IN_SESSION
    FROM ORDER_SESSION_ATTRIBUTION
    WHERE RN = 1
    GROUP BY SESSION_ID
)


-- Insert into your table
INSERT INTO [dbo].[E-COMMERCE_Marketing_Analysis]
(
    SESSION_ID,
    SESSION_START,
    SESSION_END,
    TRAFFIC_SOURCE,
    TOTAL_EVENTS,
    VISITED_HOME,
    VIEWED_DEPARTMENT,
    VIEWED_PRODUCT,
    ADDED_TO_CART,
    PURCHASE_EVENT,
    CANCEL_EVENT,
    SESSION_DURATION_SECONDS,
    CONVERTED_FLAG,
    ORDER_ID,
    TIME_TO_CONVERSION_MINUTES
)
/* =========================================================
   STEP 5: FINAL SESSION-LEVEL ANALYTICAL TABLE
   OUTPUT:
   - One row per session
   - Conversion flag (1 = converted, 0 = not converted)
   - Time-to-conversion (for converted sessions only)
   ========================================================= */

SELECT
    S.SESSION_ID,
    S.SESSION_START,
    S.SESSION_END,
    S.TRAFFIC_SOURCE,
    S.TOTAL_EVENTS,
      /* Funnel flags */
    S.VISITED_HOME,
    S.VIEWED_DEPARTMENT,
    S.VIEWED_PRODUCT,
    S.ADDED_TO_CART,
    S.PURCHASE_EVENT,
    S.CANCEL_EVENT,
    -- Session duration (engagement metric)
    DATEDIFF(SECOND, S.SESSION_START, S.SESSION_END) AS SESSION_DURATION_SECONDS,

    CASE 
    WHEN AO.ORDERS_IN_SESSION >= 1 
         AND S.PURCHASE_EVENT = 1
    THEN 1
    ELSE 0
END AS CONVERTED_FLAG,


    AO.FIRST_ORDER_ID AS ORDER_ID,
     /* -----------------------------------------------
      TIME TO CONVERSION 
      - Measures how long it takes a session to convert
      - Only populated for converted sessions
     - Helps identify fast vs slow decision journeys
      ----------------------------------------------- */
    CASE 
        WHEN AO.ORDERS_IN_SESSION >= 1
        AND S.PURCHASE_EVENT = 1
        THEN DATEDIFF(MINUTE, S.SESSION_START, AO.FIRST_ORDER_TIME)
        ELSE NULL
    END AS TIME_TO_CONVERSION_MINUTES

FROM SESSIONS S
LEFT JOIN ATTRIBUTED_ORDERS AO
    ON S.SESSION_ID = AO.SESSION_ID;
    /*========================================================= 
       IMPORTANT NOTES:
   - created_at includes 'UTC' text; it must be removed for
     SQL Server datetime parsing.
   - Funnel "purchase_event" indicates intent, not conversion.
     Conversion is defined only by a completed order.
     ========================================================= */