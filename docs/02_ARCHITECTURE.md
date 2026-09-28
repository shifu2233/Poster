# 02 — Architecture

## Logical architecture
Internet -> CDN/WAF -> Load Balancer -> 2+ App instances -> PostgreSQL / Redis
Product media -> S3 -> CDN -> Browser

## Application structure
Modular monolith with independent modules inside the NestJS API.

Required modules:
Auth, Users, Staff, Products, Variants, Categories, Collections, Search, Cart, Checkout, Orders, Payments, Shipping, Customizations, Reviews, Coupons, Analytics, Admin, Audit Logs.

## Why this architecture
- 100–500 concurrent users does not justify microservices.
- CDN handles most image/static traffic.
- Stateless app nodes can scale horizontally.
- PostgreSQL remains source of truth.
- Redis handles cache/rate limits/temp state.

## Monorepo
```
canvas-commerce/
  apps/
    storefront/
    admin/
    api/
  packages/
    database/
    ui/
    validation/
    types/
    config/
  infra/
  docker/
  scripts/
  docs/
```

## Domain separation
- `www.example.com` -> storefront
- `admin.example.com` -> admin
- `api.example.com` -> API

Use environment variables so domains remain configurable.
