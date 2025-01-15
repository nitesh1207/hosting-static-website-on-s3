resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_website.id

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.static_website.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
}
