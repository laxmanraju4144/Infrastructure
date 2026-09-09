variable "project" {
  type        = string
  description = "Project name used for resource tags"
  default     = "microservices-v2"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}


