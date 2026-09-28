# 01 — Product Requirements Document

## Personas
- Shopper: searches/browses wall art and purchases standard products.
- Custom shopper: chooses canvas configuration then contacts customer service via WS.
- Customer service: manages custom inquiries/status and links confirmed work to orders.
- Designer/production/warehouse: views relevant workflow stages with least-privilege access.
- Admin: manages catalog, pricing, staff, orders, refunds, settings.

## Catalog
Product types: Canvas Wall Art, Posters, Custom Canvas.
Products have categories, collections, search attributes, product images and variants.

### Initial sizes
08x12, 12x18, 16x24, 20x30, 24x36, 28x40 inches.

### Initial frame types
UNFRAMED, BLACK, WHITE, NATURAL.

## Discovery
- Keyword search.
- Category and collection pages.
- Filters: category, style, color, room, orientation, size, frame, price.
- Sort: best selling, newest, price asc/desc, relevance.

## Product detail
- 6–8 image types supported: MAIN, DETAIL, ROOM, SIZE_GUIDE, FRAME, LIFESTYLE.
- Size buttons, not dropdown.
- Frame options with visual thumbnails where available.
- Quantity selector.
- Add to Cart.
- Reviews and recommendations.

## Custom Canvas
- Select size/frame.
- Generate Customization ID.
- Display selected configuration and configurable customer service WS action.
- Copyable summary message.
- Store workflow metadata only.
- No photo upload.

## Checkout
- Guest checkout required.
- Contact, shipping address, shipping method, payment, order summary.
- Server-authoritative pricing.
- Stripe and PayPal abstraction.
- Payment finalization via webhook.

## Account
- Orders, order detail, addresses, wishlist, profile.
- Guest order tracking via order number + email.

## Admin
- Product CRUD and bulk import CSV/XLSX pipeline.
- Category/collection management.
- Orders, refunds, fulfillment/tracking.
- Custom orders workflow including Kanban-style status board.
- Customer list.
- Reviews/coupons.
- Staff/RBAC/settings/audit log.

## Analytics V1
Dashboard should expose: today's revenue, today's orders, pending orders, custom orders needing attention, orders waiting shipment, recent orders.
