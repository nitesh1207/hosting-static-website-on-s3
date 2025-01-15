# terraform {
#   backend "s3" {
#     bucket         = "my-terraform-state-bucket"
#     key            = "static-website/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-lock-table"
#   }
# }
