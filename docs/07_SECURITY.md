# 07 — Security and Operations

## Authentication
- Strong password hashing.
- Secure session/token handling.
- HTTP-only/Secure/SameSite cookies where applicable.
- Rate limit login, registration, password reset.

## Staff/admin
Roles: SUPER_ADMIN, ADMIN, CUSTOMER_SERVICE, DESIGNER, PRODUCTION, WAREHOUSE.
Use least privilege. Architect for TOTP 2FA.

Audit privileged actions:
- refunds
- order modifications
- price changes
- staff/permission changes
- payment/settings changes

## Payments
- Never store raw card details.
- Use Stripe/PayPal hosted/tokenized components.
- Verify webhook signatures.
- Payment webhook is source of truth for paid state.

## Web security
- Input validation and output escaping.
- CSRF protection where architecture requires it.
- CORS explicit allow-list.
- Rate limits on auth/search/checkout/payment.
- WAF-managed protections in production.
- Dependency scanning and lockfile discipline.

## Secrets
Never commit credentials. `.env.example` contains names only.
Production secrets live in AWS Secrets Manager/SSM or equivalent.

## Customization privacy
The application intentionally does not receive/store customer photos. Do not add photo fields later without explicit approval and a new privacy/security review.
