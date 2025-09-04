# output "website_endpoint" {
#   value = aws_s3_bucket.frontend.website_endpoint
# }

output "s3_bucket_name" {
  value = aws_s3_bucket.frontend.bucket
}

output "s3_bucket_id" {
  value = aws_s3_bucket.frontend.id
}

output "s3_bucket_website_endpoint" {
  value = aws_s3_bucket_website_configuration.frontend.website_endpoint
}