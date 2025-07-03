variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "juliet-static-site-2025"
}

variable "domain_name" {
  description = "Custom domain name for the site"
  type        = string
  default     = "example.juliet.dev"
}

variable "hosted_zone_id" {
  description = "Route 53 Hosted Zone ID"
  type        = string
  default     = "Z123456ABCDEF"  # optional, if applicable
}

