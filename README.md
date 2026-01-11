# AWS Static Website with Terraform

## Overview

This project demonstrates a Terraform-managed static website hosted on AWS, built as the foundation of a larger cloud architecture portfolio.

The goal is not just to host a website, but to showcase:

- Infrastructure as Code (IaC)
- AWS fundamentals implemented correctly
- Security and access control realities
- Repeatable, version-controlled cloud deployments

The architecture evolved from a simple public S3 bucket to a production-grade setup with CloudFront, HTTPS, and private S3 origin.

## Architecture

**Current architecture (Phase 4):**

- Amazon S3 as private origin (all public access blocked)
- CloudFront distribution for CDN and HTTPS
- Origin Access Control (OAC) for secure S3 access
- Versioning enabled on the S3 bucket
- HTML assets (index.html, error.html) managed via Terraform

**Architecture diagram:**

```
User Request (HTTPS)
        │
        ▼
┌─────────────────────┐
│    CloudFront CDN   │
│  (HTTPS, caching)   │
└─────────────────────┘
        │
        ▼ (OAC - signed requests)
┌─────────────────────┐
│   S3 Bucket         │
│   (private)         │
│   - index.html      │
│   - error.html      │
└─────────────────────┘
```

## AWS Services Used

| Service | Purpose |
|---------|---------|
| **Amazon S3** | Private origin bucket, versioning, bucket policies |
| **CloudFront** | CDN, HTTPS termination, caching, Origin Access Control |
| **IAM** | Access control, bucket policies, OAC permissions |
| **AWS STS** | Identity verification during deployment |
| **Terraform** | Infrastructure as Code, local state management |

## Infrastructure as Code

All infrastructure is defined and managed using Terraform.

**Key characteristics:**

- No manual configuration in the AWS console
- Declarative resource definitions
- Tagged resources for portfolio, project, and environment tracking
- Deterministic deployments using Terraform state

### Tagging Strategy

Resources are tagged to support multiple projects within a single AWS account:

| Tag | Value |
|-----|-------|
| Portfolio | CloudPortfolio |
| Project | StaticWebsite |
| Environment | Dev |
| Owner | Will |
| ManagedBy | Terraform |

## Deployment Instructions

### Prerequisites

- AWS account
- IAM user with sufficient permissions
- AWS CLI configured
- Terraform installed

### Steps

```bash
terraform init
terraform plan
terraform apply
```

After apply completes, Terraform outputs the CloudFront domain name.

## Live Site

The site is served via CloudFront with HTTPS:

```
https://<distribution-id>.cloudfront.net
```

*(The exact URL is provided by Terraform outputs.)*

The S3 bucket is private and returns 403 if accessed directly — this is intentional.

## Lessons Learned

This project surfaced several real-world cloud considerations:

- S3 static website hosting requires explicit public access (Phase 3)
- CloudFront + OAC is the secure alternative to public S3 buckets (Phase 4)
- Account-level and bucket-level S3 public access controls are separate
- Terraform state is critical and must be protected
- AWS credential management is a common operational failure point
- Small infrastructure changes can have security implications

These are the same issues encountered in real production environments.

## Roadmap

Planned next steps for this project:

- [x] Add CloudFront distribution
- [x] Enable HTTPS (via CloudFront default certificate)
- [x] Restrict S3 bucket to private access
- [ ] Add custom domain with ACM certificate
- [ ] Implement security headers
- [ ] Add CI/CD for automated deployments
- [ ] Separate environments (dev/prod)

## Author

**Will** — AWS Solutions Architect Associate

Cloud portfolio focused on security, compliance, and migration use cases.
