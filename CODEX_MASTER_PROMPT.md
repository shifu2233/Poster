# Codex Master Prompt

You are the implementation agent for **Canvas Commerce**, a US-facing ecommerce site for canvas wall art, posters and customer-service-assisted personalized canvas orders.

Read, in order:
1. `AGENTS.md`
2. `README.md`
3. all files under `docs/`
4. `infra/README.md`

Then execute the project phase-by-phase using `docs/08_IMPLEMENTATION_PLAN.md`.

## Primary objective
Deliver a maintainable V1 that supports approximately 100–500 concurrent online users and is architecturally ready to scale horizontally.

## Hard constraint: customer customization images
The site MUST NOT accept customer photo uploads. The customization flow is:
- user opens Custom Canvas page
- selects size/frame (and orientation if applicable)
- site creates a unique Customization ID
- site displays/copies details and opens configurable customer-service WS link
- customer sends photo in WS outside the site
- staff updates customization workflow in Admin
- customer completes order or staff links the order to the customization

No customer photo bytes, URLs or image metadata are stored by this system.

## Engineering approach
- Modular monolith, not microservices.
- pnpm + Turborepo monorepo.
- Next.js storefront and admin.
- NestJS API.
- PostgreSQL + Prisma.
- Redis for cache/session/rate limits/temporary state; never as source of truth for orders.
- Dockerized development and deployment.
- AWS target: CloudFront/WAF/ALB/EC2 ASG/RDS/Redis/S3.

## Execution requirements
For every phase:
- implement small coherent commits
- update `PROGRESS.md`
- keep `.env.example` current
- provide seed data for local verification
- do not hardcode domain names, WS numbers, prices or cloud credentials
- include migration and rollback notes when schema changes
- prefer boring, well-supported libraries over novelty

## First action
Initialize the monorepo skeleton and local Docker dependencies only after checking that the repository is empty or safe to modify. Then complete Phase 0 and Phase 1 acceptance criteria before moving on.

## Stop conditions
Stop and report instead of guessing when an action would:
- create billable production infrastructure
- require missing Stripe/PayPal/AWS production credentials
- destroy existing user data
- overwrite an existing codebase in a way not clearly allowed

Otherwise proceed autonomously and make reasonable V1 choices consistent with the documentation.
