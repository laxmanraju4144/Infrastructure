# terraform {
#   backend "s3" {
#     bucket         = "laxmanraju-statefile-logs"
#     key            = "laxmanraju/2-eks/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "laxmanraju-statefile-DB-lock"
#     use_lockfile  = true   # replaces dynamodb_table
#     encrypt        = true
#   }
# }

terraform {
  backend "s3" {
    bucket       = "laxmanraju-statefile-logs"
    key          = "laxmanraju/2-eks/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true # native S3 locking (Terraform >= 1.10) - replaces dynamodb_table
    encrypt      = true
  }
}