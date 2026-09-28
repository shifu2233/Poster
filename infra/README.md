# Infrastructure Agent Notes

Target Terraform structure:
```
infra/terraform/
  modules/
    vpc/
    alb/
    compute/
    rds/
    redis/
    s3/
    cloudfront/
    waf/
    iam/
    observability/
  environments/
    staging/
    production/
```

Rules:
- Generate IaC before applying anything.
- Never apply production without explicit user approval.
- Private subnets for database/redis/application where architecture permits; public ALB only.
- RDS backups/PITR/encryption.
- S3 versioning for product assets where appropriate.
- CloudWatch logs/metrics/alarms.
- Secrets Manager/SSM references, never plaintext Terraform variables in committed files.
