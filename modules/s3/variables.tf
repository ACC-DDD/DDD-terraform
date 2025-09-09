variable "s3_bucket_name" {
  description = "S3 bucket for Next.js frontend"
  type        = string
}

variable "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution allowed to access this S3 bucket"
  type        = string
}
