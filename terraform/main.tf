resource "aws_s3_bucket" "mybucket" {
  bucket = "terraform-backend-niteshstatefile"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
