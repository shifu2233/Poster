# 04 — Database Schema

Use PostgreSQL. Prefer UUID primary keys. Use migrations.

## Core tables

### users
id, email(unique), password_hash, first_name, last_name, phone, status, email_verified, created_at, updated_at, last_login_at.

### addresses
id, user_id, first_name, last_name, company, phone, address_line1, address_line2, city, state, postal_code, country_code, is_default_shipping, is_default_billing, timestamps.

### products
id, slug(unique), title, subtitle, short_description, description, category_id nullable, brand nullable, product_type, status, seo_title, seo_description, featured, published_at, timestamps.
Statuses: DRAFT, ACTIVE, ARCHIVED.

### product_variants
id, product_id, sku(unique), size_width, size_height, size_unit, frame_type, orientation nullable, price, compare_at_price nullable, cost nullable, inventory_quantity, weight nullable, status, timestamps.

### product_images
id, product_id, url, image_type, position, alt_text, width, height, created_at.
Image types: MAIN, DETAIL, ROOM, SIZE_GUIDE, FRAME, LIFESTYLE.

### categories
id, parent_id nullable, name, slug(unique), description, image_url, position, status.

### collections
id, name, slug(unique), description, status, timestamps.

### collection_products
collection_id, product_id, position.

### carts
id, user_id nullable, session_id nullable, currency, expires_at, timestamps.

### cart_items
id, cart_id, variant_id, quantity, unit_price_snapshot(optional), customization_id nullable, timestamps.

### orders
id, order_number(unique), user_id nullable, email, phone, currency, subtotal, discount_total, shipping_total, tax_total, grand_total, payment_status, fulfillment_status, order_status, shipping_address_json, billing_address_json, customer_note, internal_note, created_at, updated_at, paid_at, shipped_at, completed_at.

### order_items
id, order_id, product_id nullable, variant_id nullable, sku, product_title, size, frame, quantity, unit_price, total_price, product_image, customization_id nullable, created_at.
This is a historical snapshot.

### customization_requests
id, customization_code(unique), user_id nullable, product_id, variant_id nullable, size, frame, orientation nullable, customer_service_user_id nullable, status, customer_contacted, photo_received, preview_created, customer_confirmed, order_id nullable, customer_note, staff_note, created_at, updated_at, confirmed_at nullable.
IMPORTANT: no customer photo URL/blob fields.

### staff_users
id, email(unique), password_hash, name, role, status, last_login_at, created_at.

### roles / permissions / role_permissions
Support RBAC beyond simple enum when practical.

### payments
id, order_id, provider, provider_payment_id, amount, currency, status, payment_method, created_at, updated_at, paid_at.

### shipments
id, order_id, carrier, service, tracking_number, tracking_url, status, shipped_at, delivered_at, timestamps.

### order_events
id, order_id, event_type, title, description, staff_id nullable, created_at.

### reviews
id, user_id nullable, product_id, order_item_id nullable, rating, title, body, verified_purchase, status, timestamps.

### coupons
id, code(unique), type, value, starts_at, ends_at, usage_limit, status, timestamps.

### audit_logs
id, staff_id, action, resource_type, resource_id, before_data jsonb, after_data jsonb, ip_address, created_at.

## Seed data
Seed standard sizes and frame types via settings/options tables or config seed, not hardcoded throughout application logic.
