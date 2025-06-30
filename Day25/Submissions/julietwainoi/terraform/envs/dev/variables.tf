variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
variable "domain_name" {
  type = string
}

variable "hosted_zone_id" {
  type = string
}
