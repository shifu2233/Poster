# 06 — AWS Production Deployment Target

## Target topology
DNS -> CloudFront -> WAF -> Application Load Balancer -> EC2 Auto Scaling Group -> App containers
RDS PostgreSQL in private subnets
Redis/ElastiCache in private subnets
S3 for product images

## Initial compute target
Application nodes:
- Minimum: 2
- Desired: 2
- Maximum: 6
- Target size class: approximately 4 vCPU / 8 GB RAM each

Database:
- Preferred production starting target: approximately 4 vCPU / 16 GB RAM
- 100–200 GB SSD class storage to start
- Automated backups, point-in-time recovery, encryption
- Multi-AZ preferred for production resilience

Redis:
- approximately 2 vCPU / 2–4 GB class starting target

These are planning targets, not guaranteed exact instance SKUs. Final instance family should be selected based on current AWS offerings/cost at deployment time.

## Availability
Use at least 2 Availability Zones for production app subnets/load balancing.

## Auto scaling
Scale out based on ALB request count and/or CPU threshold after load test tuning. Never scale below 2 app nodes in production.

## S3/CDN
S3 stores product images/static media, not custom customer photos. CloudFront serves images. Restrict direct bucket access where possible.

## Deployment environments
- local
- staging
- production

Never deploy directly by SSH + git pull. Build immutable Docker images and deploy tagged versions.
