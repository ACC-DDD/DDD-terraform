# variable "s3_bucket_website_endpoint" {
#   type = string
# }

# variable "api_gateway_endpoint" {
#   type = string
# }
variable "s3_bucket_regional_domain_name" {
  type        = string
  description = "The regional domain name of the S3 bucket (for CloudFront origin)"
}

variable "s3_bucket_arn" {
  type        = string
  description = "The ARN of the S3 bucket (for bucket policy with OAC)"
}

variable "api_gateway_endpoint" {
  type        = string
  description = "API Gateway endpoint URL"
}

variable "s3_bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}
