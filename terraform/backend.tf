
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-niteshlock-table"  # Name of the table
  billing_mode   = "PAY_PER_REQUEST"       # Use on-demand mode (no need to specify read/write capacity)
  hash_key       = "LockID"                # Hash key for the table
  attribute {
    name = "LockID"
    type = "S"                            # 'S' stands for String
  }

  tags = {
    Name        = "TerraformStateLock"
    Environment = "Dev"
  }
}
terraform {
  backend "s3" {
    bucket         = "terraform-backend-niteshstatefile"
    key            = "static-website/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}

