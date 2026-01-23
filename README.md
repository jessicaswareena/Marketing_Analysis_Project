<p align="center">
  <img src="https://github.com/jessicaswareena/Marketing-Analysis_FlexLife/blob/10b7433a4ee58b631073f550e52c3fedc40d8450/images/FlexLife-Logo.png" width="150">
</p>

# When Traffic Isn’t the Problem: Diagnosing Conversion Loss in an E-Commerce Funnel
A mid-sized e commerce brand in the **activewear and lifestyle accessories** space was struggling with **plateauing revenue despite healthy traffic** from Email, Adwords, Organic search, Facebook, and YouTube. Leadership wanted to know whether the problem was- weak traffic or an experience that failed users who were already ready to buy. 
As the **Data Analyst supporting Growth and Product**, the goal of this project was to turn session data into a clear, decision ready view of where the funnel leaks, which channels quietly carry the business, and what must be fixed before more money goes into acquisition.
<h2 align="center">  Project Overview</h2>

FlexLife serves roughly **40,000** customers through a digital first storefront focused on performance apparel, athleisure, and related accessories. Traffic is driven primarily by **Email campaigns, paid search (Adwords), Organic search, and social media** placements on Facebook and YouTube. Despite solid visit volumes, revenue growth has been uneven and conversion rates underwhelming, prompting concerns about both traffic quality and onsite experience.

This analysis is designed for stakeholders who need to quickly understand:

•	How efficiently traffic turns into purchases.

•	Where users disengage between discovery and checkout.

•	Which channels are under  or over performing relative to their potential.

•	What specific actions can unlock more revenue without raising acquisition spend.

<h2 align="center"> Key Insights & Analysis Focus area </h2>
The work is organized around four core questions that shaped the metrics, visuals, and recommendations:

•	Funnel health: How well do sessions move from visit → intent → purchase?

•	Drop off points: At which stage product view, cart, or checkout- is the largest loss of potential revenue?

•	Channel quality: Are some traffic sources fundamentally weaker, or is performance broadly consistent across channels?

•	Revenue efficiency: How much revenue does each session generate, and where is monetization potential being left on the table?

All subsequent sections connect directly back to these questions.

<h2 align="center">  Data Structure</h2>
FlexLife's datastructure as seen below consists of four tables:Events,Users,Order_items,Orders with a total row count of 82,382 records.

![image alt](https://github.com/jessicaswareena/Marketing-Analysis_FlexLife/blob/10b7433a4ee58b631073f550e52c3fedc40d8450/ER%20Diagram.jpeg)
<h2 align="center">  Executive Summary </h2>

![image alt](https://github.com/jessicaswareena/Marketing-Analysis_FlexLife/blob/10b7433a4ee58b631073f550e52c3fedc40d8450/ExecutiveOverview.png)
### Overview of Findings

At the highest level, the analysis shows a business with **enough traffic but insufficient conversion efficiency.**

•	Out of every **100** sessions, around **4** take a clear step toward buying (add to cart or begin checkout).

•	Only **1–2** of those sessions end with a completed purchase, meaning about **three quarters of high intent sessions are lost** before revenue is captured.

•	Traffic volume is not the primary constraint; the friction appears after users have already expressed strong intent.

This immediately points the organization away from “buy more traffic” and toward improving how existing visitors are handled.

The entire interactive dashboard can be downloaded [here.](https://app.powerbi.com/reportEmbed?reportId=a3ef3576-0b10-4fa9-b204-86aae5564972&autoAuth=true&ctid=750d3a3f-1f46-4da2-8a64-7605e75ea2f9)

<h2 align="center"> Insights Deep Dive </h2>

### Funnel Drop-Off & Checkout Friction

![image alt](https://github.com/jessicaswareena/Marketing-Analysis_FlexLife/blob/10b7433a4ee58b631073f550e52c3fedc40d8450/images/FunnelAnalysis.png)
Understanding where potential customers fall out of the funnel requires tracking movement through three key stages:

     1.	Product view
     
     2.	Add to cart
     
     3.	Completed purchase
     
Critical drop off metrics:

     •	Product → cart drop: 15.92%- This reflects typical browsing behavior as users explore options.

     •	Cart → purchase drop: 94.51% abandonment- Only 5.49%of cart sessions result in an order.

### Patterns:

•	Users are willing to discover products and add them to cart, indicating effective merchandising and reasonable product interest.

•	The overwhelming loss occurs after items are already in the cart, pointing to issues at checkout rather than at discovery or selection.

•	This extreme drop off is relatively consistent across traffic sources, suggesting a system wide checkout problem rather than one isolated to a single channel.

Likely drivers include complex forms, unexpected fees, confusing shipping options, limited payment methods, or insufficient trust and reassurance at the payment step.
<h2 align="center">  Channel Performance & Traffic Quality </h2>

![image alt](https://github.com/jessicaswareena/Marketing-Analysis_FlexLife/blob/10b7433a4ee58b631073f550e52c3fedc40d8450/ChannelOptimization.png)
The next part of the analysis evaluates whether some channels are fundamentally weaker or if the problem is uniform.

### Key findings:

•	**Conversion rates by channel** cluster in a narrow range around **1.4%–1.6%**, including Organic, Adwords, Email, Facebook, and YouTube.

•	The **gap between purchase intent and completed conversions** is about **2.61 percentage points** and appears consistently across channels.

•	**Time to conversion** differs:

      » Adwords and Email sessions convert more slowly (around 62–63 minutes) but bring higher order values.
      
      » Organic sessions convert faster (around 23 minutes) but with slightly lower average revenue per order.
      
### Implications:

•	No major channel shows signs of fundamentally poor traffic quality.

•	The main problems arise **after acquisition**, when users have already decided to engage seriously with the product.

•	Paid channels are not failing; they are being undermined by issues later in the funnel when visitors attempt to complete their purchase.

This shifts focus from channel by channel blame to fixing shared downstream issues.
<h2 align="center"> Revenue Efficiency & Channel Monetization </h2>
Beyond conversion percentages, the analysis examines how each channel contributes to revenue and where upside remains.

### Highlights:

•	**Revenue concentration:**

     » Email contributes roughly $3,161.
    
     » Adwords contributes about $2,002.
    
     » Facebook, YouTube, and Organic together generate a significantly smaller share of total revenue.
    
•	**Revenue per session:**

     » Organic leads at around $0.18 per visit, even though it is not the top revenue driver by volume.
    
     » Site wide, the average is approximately $0.15 per visit.
    
### Conclusions:

•	The business relies heavily on **Email** and **Adwords** for revenue.

•	Channels like **Organic** and **YouTube** present under used opportunities, with decent intent and conversion but relatively low monetization.

•	Faster converting sessions (especially Organic) are strong candidates for **bundles, upsells, and cross sells** that increase order value without increasing acquisition cost.

This framing helps Growth and Product teams see where incremental design and merchandising work could grow revenue.
<h2 align="center">  Key Insights </h2>

Across the funnel and channel analysis, several core insights emerge:

•	**Traffic is sufficient; conversion is the constraint.**

•	**Intent far exceeds actual purchases: 4.14%** of sessions show strong intent, yet only 1.54% convert.

•	**Checkout is the primary leak:** over **94%** of cart sessions fail to become orders, with a cart conversion rate of only **5.49%.**

•	**Traffic quality is generally healthy:** channels sit in a narrow band of **1.4–1.6%** conversion and share a similar intent–conversion gap.

•	**Revenue is unevenly distributed:** Email and Adwords carry most revenue, while faster converting Organic traffic is not fully monetized.

These insights form the backbone of the project and guide the recommended actions.
<h2 align="center">  Recommendations </h2>
The following actions are prioritized by potential revenue impact and practicality.

### 1. Focus on checkout experience

Reasoning: The **94.51%** cart to purchase drop makes checkout the single largest revenue lever.

Suggested initiatives:

•	Reduce steps and fields in the checkout flow to minimize friction.

•	Provide clear **pricing transparency** for shipping, taxes, and fees early in the process.

•	Strengthen **trust signals** through visible security badges, reviews, and straightforward return policies.

•	Allow **guest checkout** and support modern payment methods (wallets, saved cards) to reduce effort for new and returning users.

Even a modest increase in cart conversion yields a meaningful lift in revenue given current traffic.

### 2. Hold acquisition budgets steady while fixing conversion

Reasoning: Scaling traffic into a highly lossy checkout compounds wasted marketing spend.

Actions:

•	Maintain current acquisition levels while UX and Product focus on improving completion rates.

•	Use the existing volume to run **targeted experiments** rather than increasing spend.

•	Report improvements in conversion and revenue per visit to inform when it becomes efficient to scale traffic again.

### 3. Enhance experiences for Email and Adwords traffic

Reasoning: These channels already generate most revenue, so improvements here deliver amplified returns.

Ideas:

•	Align landing experiences tightly with ad and email promises to reduce confusion and hesitation.

•	Provide explicit reassurance and social proof on high intent landing pages used by paid traffic.

•	Implement structured **cart abandonment sequences** (email or retargeting) with tailored incentives based on cart value or product category.

### 4. Increase monetization of Organic traffic

Reasoning: Organic visitors convert quickly and show strong revenue per session but have unrealized order value potential.

Ideas:

•	Introduce curated **bundles** and “complete the look” modules on key product and category pages.

•	Implement context aware **cross sell** recommendations in cart and during browse.

•	Test **promotion placement and timing** for Organic visitors to find the balance between relevance and distraction.

### 5.	Use AI Driven Personalization at Checkout

Reasoning: Purchase intent is high but cart to purchase abandonment remains extreme, so the biggest gains come from reducing friction and doubt in the final steps of the funnel.

Ideas:

•	Use generative models to spot common cart patterns and predict what hesitant customers are likely missing (e.g., size, style, or price reassurance).

•	Surface dynamic “complete the look” or bundle suggestions directly in the cart to increase value without sending users back to browse.

•	Generate context aware checkout messages (sizing tips, return policy highlights, social proof) tailored to what’s in the cart.

•	Adjust recommendations and tone by traffic source so Organic, Email, and Paid users each get guidance that matches how they typically decide.

<h2 align="center">  What I'do next with more data </h2>
Several additional analyses become possible with more complete tracking and marketing data:

•	**User level journey evaluation**

     •	Distinguish new from returning customers and understand how behavior and conversion 
        change over time.
        
     •	Estimate how many sessions typical customers require before first purchase and between 
        repeat purchases.
        
•	**Marketing cost and profitability analysis**

    •	Combine funnel metrics with channel spend to compute ROAS and CPA.
    
    •	Recommend budget shifts toward channels with the best profit contribution, not just top 
      line revenue.
      
•	**Checkout step diagnostics**

    •	Track granular events such as shipping selection, payment attempt, and error messages.
    
    •	Pinpoint the specific steps with the highest combination of drop off and revenue 
      potential.
      
•	**Experiment design and uplift measurement**

    •	Run A/B tests on form design, payment options, messaging, and offers.
    
    •	Quantify conversion uplift and translate improvements into projected revenue impact.
    
**•	Scenario based revenue forecasting**

    •	Model outcomes such as reducing cart to purchase drop from 94.51% to 90% or increasing 
      overall conversion from 1.54% to 2.0%.
      
    •	Communicate these scenarios to leadership as part of planning and resource allocation.
<h2 align="center">  Data foundation & assumptions </h2>   
Important assumptions and caveats:

    • The analysis uses session level web analytics data over a defined time period due to 
      missing user identifiers.

    •	No reliable cross session user identifiers, so behavior is evaluated at the session 
      level rather than per customer.
      
    •	Channel attribution follows a time based last touch approach, which may under value 
      earlier discovery interactions.
      
    •	Revenue is tied only to completed orders; sessions with purchase events but missing 
      order records are excluded from revenue metrics.
      
    •	Findings reflect the analyzed period; the same framework can be rerun as campaigns and 
      UX evolve.
      
These constraints are documented so that decisions are made with a realistic understanding of what the data can and cannot say.


