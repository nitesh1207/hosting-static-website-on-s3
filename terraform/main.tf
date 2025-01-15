resource "aws_s3_bucket" "example" {
  bucket = "terraform-backend-niteshstatefile"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
