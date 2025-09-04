resource "aws_cloudfront_distribution" "this" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name = var.s3_bucket_website_endpoint
    origin_id   = "s3-frontend"
  }

  origin {
    domain_name = var.api_gateway_endpoint
    origin_id   = "api-gateway"
  }

  default_cache_behavior {
    target_origin_id       = "s3-frontend"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  ordered_cache_behavior {
    path_pattern           = "/api/*"
    target_origin_id       = "api-gateway"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "POST", "PUT", "DELETE", "HEAD", "OPTIONS", "PATCH"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}