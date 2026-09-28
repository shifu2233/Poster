# 00 — Executive Summary

## Business goal
Build a professional independent ecommerce site for canvas wall art and posters, inspired by Amazon's efficient search/purchase flow but visually optimized for art/home decor.

## Capacity target
- Normal target: ~100–500 concurrent online users.
- Horizontal scaling path: 2 application nodes initially, scalable to 6+.
- Static product imagery served through object storage + CDN, reducing application server load.

## Custom-order model
No customer image uploads. Personalized orders are assisted by customer service through WS. The site generates a Customization ID and tracks workflow metadata only.

## V1 priorities
1. Fast catalog/search/filter experience.
2. Clear size/frame variant selection.
3. Reliable cart/checkout/payment/order flow.
4. Custom Canvas -> Customization ID -> customer-service WS workflow.
5. Efficient admin for products, bulk import, orders and custom-order workflow.
6. Mobile-first UX.

## Explicit non-goals for V1
- Marketplace / multi-seller.
- Customer photo upload or editor.
- AI recommendation/search.
- Native mobile apps.
- Kubernetes.
- Complex loyalty/subscription systems.
