variable "default_tag" {
  type        = string
  description = "A default tag to add to everything"
  default     = "terraform_aws_rds_secrets_manager"
}

variable "subnets" {
  type        = list(string)
  description = "A list of subnets to use for the RDS instance"
}