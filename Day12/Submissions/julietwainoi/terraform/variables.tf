variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "ami_id" {}
variable "active_env" {
  type = string
  description = "The environment to route traffic to (blue or green)"
}
