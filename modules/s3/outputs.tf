# output "website_endpoint" {
#   value = aws_s3_bucket.frontend.website_endpoint
# }

# output "s3_bucket_name" {
#   value = aws_s3_bucket.frontend.bucket
# }

# output "s3_bucket_id" {
#   value = aws_s3_bucket.frontend.id
# }

# output "s3_bucket_website_endpoint" {
#   value = aws_s3_bucket_website_configuration.frontend.website_endpoint
# }

output "bucket_name" {
  value       = aws_s3_bucket.frontend.bucket
  description = "The name of the S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.frontend.arn
  description = "The ARN of the S3 bucket"
}

output "bucket_regional_domain_name" {
  value       = aws_s3_bucket.frontend.bucket_regional_domain_name
  description = "The regional domain name of the S3 bucket (for CloudFront origin)"
}
