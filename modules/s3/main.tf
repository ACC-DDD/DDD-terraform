resource "aws_s3_bucket" "frontend" {
  bucket = "${var.s3_bucket_name}-frontend-bucket"
}

# resource "aws_s3_bucket_policy" "frontend_policy" {
#   bucket = aws_s3_bucket.frontend.id
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Sid    = "AllowCloudFrontAccess"
#         Effect = "Allow"
#         Principal = {
#           Service = "cloudfront.amazonaws.com"
#         }
#         Action   = "s3:GetObject"
#         Resource = "${aws_s3_bucket.frontend.arn}/*"
#         Condition = {
#           StringEquals = {
#             # "AWS:SourceArn" = module.cloudfront.cloudfront_distribution_arn
#             # "AWS:SourceArn" = var.cloudfront_distribution_arn
#             "AWS:SourceArn" = aws_cloudfront_distribution.this.arn

#           }
#         }
#       }
#     ]
#   })
# }

resource "aws_s3_bucket_policy" "frontend_policy" {
  bucket = aws_s3_bucket.frontend.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontAccess"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.frontend.arn}/*"
      }
    ]
  })
}


resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
