
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  description = "Base name used to construct resource names"
  type        = string
  default     = "aurora"
}

variable "github_org" {
  description = "GitHub username"
  type        = string
  default     = "Alexander-Kalita"
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
  default     = "aurora"
}




