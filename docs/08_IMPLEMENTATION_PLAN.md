# 08 — Implementation Plan

Codex must execute phases in order and keep `PROGRESS.md` updated.

## Phase 0 — Repository & local platform
Deliver:
- pnpm + Turborepo monorepo
- storefront/admin/api apps
- shared packages
- Docker Compose for PostgreSQL + Redis
- lint/typecheck/test tooling
- `.env.example`
- CI skeleton
Exit criteria: all apps boot locally; lint/typecheck pass.

## Phase 1 — Database & auth foundations
Deliver:
- Prisma schema and migrations for core V1 entities
- seeds: roles, sizes, frame types, sample categories/products
- customer auth/register/login/password reset architecture
- staff auth/RBAC foundation
- audit-log utility
Exit criteria: migration from empty DB succeeds; seeds succeed; auth/RBAC core tests pass.

## Phase 2 — Catalog & discovery
Deliver:
- Products/variants/images/categories/collections APIs
- Search/filter/sort/pagination
- storefront Home/Search/Category/Collection/Product pages
- responsive product cards, galleries, filters
Exit criteria: seeded catalog can be browsed/searched/filter/sorted on desktop/mobile.

## Phase 3 — Cart & Custom Canvas
Deliver:
- guest/user cart and cart merge
- Custom Canvas wizard
- unique Customization ID generation
- configurable WS link + copyable summary
- admin custom-order list/detail/status workflow
Hard test: system rejects any attempted image-upload field/endpoint because none should exist.

## Phase 4 — Checkout, payments & orders
Deliver:
- authoritative quote calculation
- guest checkout
- pending order creation with order-item snapshots
- Stripe/PayPal provider interfaces and sandbox integration
- webhook verification/state transitions
- order success and guest tracking
- user order history/detail
Exit criteria: sandbox happy path + failed payment + duplicate webhook/idempotency tests.

## Phase 5 — Admin operations
Deliver:
- product CRUD
- CSV/XLSX import pipeline with validation preview/error report
- bulk product actions
- order detail/refund/shipment
- customers/reviews/coupons/staff/settings/audit pages
- Custom Orders Kanban/workbench
Exit criteria: role permissions verified and audit logging proven.

## Phase 6 — Media/CDN & performance
Deliver:
- product media abstraction to S3-compatible storage
- image metadata/types and responsive usage
- lazy-loading strategy
- caching and Redis integration where justified
- load-test scripts/scenarios
Exit criteria: 500-concurrent-user target scenario measured in staging/local approximation; no critical errors.

## Phase 7 — AWS IaC & staging
Deliver:
- Terraform modules/stack plan for VPC, ALB, ASG/EC2, RDS, Redis, S3, CloudFront, WAF, IAM, logging/monitoring
- staging deployment workflow
- backup/restore runbook
- alerts/dashboards
Do not create billable resources without explicit user authorization.

## Phase 8 — Production readiness
Deliver:
- security review checklist
- payment webhook recovery procedures
- DB backup/restore test
- smoke/e2e test suite
- production deployment runbook and rollback
- operational documentation

## Deferred V2
AI recommendations, visual search, customer upload/editor, native app, advanced loyalty, marketplace/multi-seller, complex warehouse routing.
