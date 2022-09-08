resource "aws_s3_bucket" "state" {
  bucket = "dhanapal_eks_storage"
  acl    = "private"
}

