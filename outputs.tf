output "website_endpoint" {
  description = "S3 static website endpoint (legacy - will return 403)"
  value       = aws_s3_bucket_website_configuration.site.website_endpoint
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.cdn.domain_name
}
