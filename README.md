# AWS Static Website with Terraform

## Overview

This project demonstrates a Terraform-managed static website hosted on AWS S3, built as the foundation of a larger cloud architecture portfolio.

The goal is not just to host a website, but to showcase:

- Infrastructure as Code (IaC)
- AWS fundamentals implemented correctly
- Security and access control realities
- Repeatable, version-controlled cloud deployments

The architecture intentionally starts simple and is designed to evolve into a production-grade setup with CloudFront, HTTPS, and tighter security controls.

## Architecture

**Current architecture (Phase 3):**

- Amazon S3 for static website hosting
- Terraform for infrastructure provisioning and state management
- Public S3 bucket policy (required for S3 website endpoints)
- Versioning enabled on the S3 bucket
- HTML assets (index.html, error.html) managed via Terraform

**Planned evolution:**

- CloudFront distribution
- HTTPS via AWS Certificate Manager
- Private S3 bucket with origin access control
- Security headers and caching strategy
- CI/CD for automated updates

## AWS Services Used

| Service | Purpose |
|---------|---------|
| **Amazon S3** | Static website hosting, bucket versioning, bucket policies and public access configuration |
| **IAM** | Access control and permissions |
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

After apply completes, Terraform outputs the S3 website endpoint.

## Live Site

The site is served directly from the S3 website endpoint:

```
http://<bucket-name>.s3-website-<region>.amazonaws.com
```

*(The exact URL is provided by Terraform outputs.)*

## Lessons Learned

This project surfaced several real-world cloud considerations:

- S3 static website hosting requires explicit public access
- Account-level and bucket-level S3 public access controls are separate
- Terraform state is critical and must be protected
- AWS credential management is a common operational failure point
- Small infrastructure changes can have security implications

These are the same issues encountered in real production environments.

## Roadmap

Planned next steps for this project:

- [ ] Add CloudFront distribution
- [ ] Enable HTTPS with ACM
- [ ] Restrict S3 bucket to private access
- [ ] Implement security headers
- [ ] Add CI/CD for automated deployments
- [ ] Separate environments (dev/prod)

## Author

**Will** — AWS Solutions Architect Associate

Cloud portfolio focused on security, compliance, and migration use cases.
