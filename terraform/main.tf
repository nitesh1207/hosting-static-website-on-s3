resource "aws_s3_bucket" "example" {
  bucket = "terraform-backend-statefile"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
