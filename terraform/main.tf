resource "aws_s3_bucket" "terraform_state" {
  bucket = "your-terraform-state-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "DevOps"
  }
}

