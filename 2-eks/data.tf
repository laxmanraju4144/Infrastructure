data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "quantamvector-infra-statefile-backup"
    key    = "quantamvector/1-network/terraform.tfstate"
    region = "us-east-1"
  }
}
