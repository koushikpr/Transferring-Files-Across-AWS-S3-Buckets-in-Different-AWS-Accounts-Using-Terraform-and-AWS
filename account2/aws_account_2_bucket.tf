
resource "aws_s3_bucket" "kprbucket2" {

    bucket = "kprbucket2"
    
  
}

resource "aws_s3_bucket_public_access_block" "kprbucket2" {
    bucket = aws_s3_bucket.kprbucket2.id

    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false

}
