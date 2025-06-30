provider "aws" {
  region = "us-west-2"
}

module "s3_static_site" {
  source      = "../../modules/s3-static-website"
  bucket_name = var.bucket_name
}

resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = module.s3_static_site.website_endpoint
    origin_id   = "s3Origin"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "s3Origin"
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

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.cdn.domain_name
  description = "The domain name of the CloudFront distribution"
}

