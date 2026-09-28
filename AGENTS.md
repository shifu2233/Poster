# AGENTS.md — Canvas Commerce

## Mission
Build a production-ready V1 ecommerce platform for canvas wall art and posters, optimized for US customers and ~100–500 concurrent online users.

## Non-negotiable business rules
1. DO NOT implement customer image upload for customization.
2. DO NOT store customer customization images in the website/database/S3.
3. Custom buyers choose product/size/frame, receive a `Customization ID`, then contact customer service through a configurable WS URL and send images there.
4. The website stores only customization metadata/status/notes, not the image itself.
5. V1 is single-merchant ecommerce, not a marketplace.
6. Use modular monolith architecture. Do not introduce Kubernetes or microservices unless explicitly requested later.
7. Guest checkout is required.
8. Prices shown by clients are never trusted; server recalculates prices from authoritative database state.
9. Payment success is finalized by provider webhook, not browser redirect.
10. Order items must store snapshots of title/SKU/variant/price/image/customization ID.

## Required stack
- Monorepo: pnpm + Turborepo
- `apps/storefront`: Next.js, React, TypeScript
- `apps/admin`: Next.js, React, TypeScript
- `apps/api`: NestJS, TypeScript
- PostgreSQL
- Redis
- Prisma ORM (preferred unless a blocking reason is documented)
- Docker for local and production images
- Stripe + PayPal provider abstraction
- AWS-targeted production architecture

## Required application modules
Auth, Users, Staff, Products, Variants, Categories, Collections, Search, Cart, Checkout, Orders, Payments, Shipping, Customizations, Reviews, Coupons, Analytics, Admin, Audit Logs.

## Required V1 frontend pages
Home, Search, Category, Collection, Product Detail, Custom Canvas, Cart, Checkout, Order Success, Login, Register, Password Reset, Account, Orders, Order Detail, Order Tracking, Wishlist, Contact, FAQ, About, Privacy, Terms, Shipping/Returns.

## Required Admin pages
Dashboard, Products, Product Import, Categories, Collections, Orders, Custom Orders, Customers, Reviews, Coupons, Staff, Settings, Audit Logs.

## Customization workflow
Statuses:
`NEW -> CONTACTED -> PHOTO_RECEIVED -> DESIGNING -> WAITING_CUSTOMER -> CONFIRMED -> ORDERED -> PRODUCTION -> SHIPPED -> COMPLETED`
plus `CANCELLED`.

Customization record fields include:
- id
- customization_code
- user_id nullable
- product_id
- variant_id nullable
- size
- frame
- orientation nullable
- customer_service_user_id nullable
- status
- customer_contacted
- photo_received
- preview_created
- customer_confirmed
- order_id nullable
- customer_note nullable
- staff_note nullable
- timestamps

## Standard canvas sizes
Support configurable global options; initial seeded sizes:
- 08x12
- 12x18
- 16x24
- 20x30
- 24x36
- 28x40

Frame types seed:
- UNFRAMED
- BLACK
- WHITE
- NATURAL

## UI principles
- Clean premium art-first visual design.
- Amazon-like shopping/search efficiency, not Amazon visual cloning.
- Mobile-first responsive behavior.
- Product cards max 2 title lines.
- Desktop 4–5 product grid columns; mobile 2.
- Product page: large gallery + sticky purchase panel on desktop; sticky add-to-cart on mobile.
- Custom Canvas page clearly states photo is sent to customer service through WS.

## Security rules
- RBAC for staff.
- Admin 2FA-ready design.
- Rate limiting on auth/search/checkout/payment endpoints.
- No secrets in source control.
- Validate all server inputs.
- Use secure HTTP-only cookies where appropriate.
- Audit log privileged admin actions, especially refunds, price/order changes, staff changes and settings changes.

## Development method
Follow phases in `docs/08_IMPLEMENTATION_PLAN.md` in order.
At the end of each phase:
1. run lint
2. run typecheck
3. run unit tests
4. run integration/e2e tests applicable to phase
5. document completed items and remaining gaps in `PROGRESS.md`

Do not mark a phase complete if tests fail.

## Definition of done
A feature is done only when:
- implementation exists
- tests exist for core behavior
- errors are handled
- permissions are enforced
- mobile behavior is usable where relevant
- docs/env examples are updated
- acceptance criteria pass

## Production safety
Do not create live AWS resources or chargeable third-party production resources without explicit user authorization and credentials. Infrastructure code may be generated and validated locally first.
