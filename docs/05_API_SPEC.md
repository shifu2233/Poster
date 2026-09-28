# 05 — API Specification

Base: `/api/v1`

## Public/catalog
- GET `/products`
- GET `/products/:slug`
- GET `/categories`
- GET `/categories/:slug`
- GET `/collections/:slug`
- GET `/search?q=...`

Search parameters may include category, style, color, room, orientation, size, frame, min_price, max_price, sort, page.

## Auth/account
- POST `/auth/register`
- POST `/auth/login`
- POST `/auth/logout`
- POST `/auth/password/forgot`
- POST `/auth/password/reset`
- GET `/account`
- GET `/account/orders`
- GET `/account/orders/:orderNumber`

## Cart
- GET `/cart`
- POST `/cart/items`
- PATCH `/cart/items/:id`
- DELETE `/cart/items/:id`

## Customization
- POST `/customizations`
- GET `/customizations/:code`

POST creates configuration metadata and a unique code. No image fields are accepted.

## Checkout
- POST `/checkout/quote` — server recalculates authoritative totals.
- POST `/checkout/order` — create pending order.
- POST `/payments/stripe/create`
- POST `/payments/paypal/create`
- POST `/webhooks/stripe`
- POST `/webhooks/paypal`

## Guest tracking
- POST `/orders/track` with order number + email.

## Admin
- GET/POST/PATCH `/admin/products...`
- POST `/admin/products/import`
- GET/PATCH `/admin/orders...`
- POST `/admin/orders/:id/refund`
- POST `/admin/orders/:id/shipment`
- GET `/admin/customizations`
- PATCH `/admin/customizations/:id`
- CRUD `/admin/categories`
- CRUD `/admin/collections`
- CRUD `/admin/coupons`
- CRUD `/admin/staff`
- GET `/admin/audit-logs`

## Rules
- Validate DTOs.
- Paginate list endpoints.
- Standardize error envelope.
- Use idempotency for checkout/order/payment creation where appropriate.
- Never trust client price/tax/shipping total.
