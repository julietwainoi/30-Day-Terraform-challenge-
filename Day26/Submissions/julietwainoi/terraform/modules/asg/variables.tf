# modules/asg/variables.tf

variable "ami_id" {
  description = "AMI ID to use for EC2"
  type        = string
}

variable "app_sg_id" {
  description = "App Security Group ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for ASG"
  type        = list(string)
}

variable "target_group_arn" {
  description = "Target group to register instances"
  type        = string
}
variable "min_size" {

  description = "Target group to register instances"
  type        = number
  default     = 1

}

variable "max_size" {

  description = "Target group to register instances"
  type        = number
  default     = 3

}