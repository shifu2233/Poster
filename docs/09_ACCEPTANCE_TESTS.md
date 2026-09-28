# 09 — Acceptance Tests

## Global commands
Agent should define scripts equivalent to:
- `pnpm lint`
- `pnpm typecheck`
- `pnpm test`
- `pnpm test:e2e`
- `pnpm build`

## Catalog
- Product variants return correct size/frame/price.
- Filters combine correctly.
- Pagination stable.
- Mobile 2-column product grid works.
- Product titles truncate to max 2 visual lines.

## Cart
- Anonymous user can add/update/remove.
- Login merges guest cart without duplication.
- Price is recalculated server-side before checkout.

## Custom Canvas
- User can select size/frame and generate code.
- Generated code is unique.
- WS link is configured by environment/settings, not hardcoded.
- Summary contains code/size/frame.
- Database contains no photo blob/url fields for customization.
- No public customer-image upload endpoint exists.

## Checkout/payment
- Guest checkout works.
- Successful sandbox payment changes order only via verified webhook.
- Duplicate webhook does not double-charge/double-transition.
- Failed payment remains unpaid.
- Order item values remain unchanged after product title/price later changes.

## RBAC
- Customer service can edit customization but cannot change payment settings.
- Designer cannot refund.
- Warehouse can update shipment but cannot manage staff.
- Admin privileged action creates audit log.

## Security
- Rate limiting applied to sensitive endpoints.
- Invalid DTOs rejected.
- Secrets absent from repository.
- Admin endpoints require staff authorization.

## Performance target
Create load-test scenario representing browsing/search/product/cart mix with up to 500 concurrent virtual users. Target guidance:
- normal API P95 < 500ms where feasible
- search P95 < 800ms where feasible
- 5xx < 0.1%
Treat these as tuning goals, not claims until measured.
