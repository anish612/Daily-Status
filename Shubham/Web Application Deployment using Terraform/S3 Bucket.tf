resource "aws_s3_bucket" "shubham" {
  acl    = "public-read"
  bucket = "s3bucket"  
  tags = {
    Name        = "s3 bucket"
  }  
}
resource "aws_s3_bucket_acl" "b_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "staging" {
  bucket = aws_s3_bucket.bucket.bucket

   index_document {
    suffix = "index.html"
  }

  error_document {
    key = "/index.html"
  }
}
