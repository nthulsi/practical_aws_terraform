resource "aws_s3_bucket" "bucket" {
  bucket = "awsb22.xyz"
   tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket" "bucket-1" {
  bucket = "www.awsb22.xyz"
   tags = {
    Name        = "My bucket-1"
    Environment = "Dev-1"
  }
}
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}
resource "aws_s3_bucket_acl" "acl-1" {
  bucket = aws_s3_bucket.bucket-1.id
  acl    = "private"
}



