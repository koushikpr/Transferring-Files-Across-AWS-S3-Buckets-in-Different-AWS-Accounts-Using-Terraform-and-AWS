provider "aws"  {
    region = "us-east-1"
    access_key = var.access_key1
    secret_key = var.secret_key1

}

resource "aws_s3_bucket" "kprbucket1" {

    bucket = "kprbucket1"
    
  
}

resource "aws_s3_bucket_public_access_block" "bucket1" {
    bucket = aws_s3_bucket.kprbucket1.id

    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false

}

resource "aws_s3_bucket_policy" "transferpolicy" {
    bucket = aws_s3_bucket.kprbucket1.id
    policy = jsonencode({
   "Version": "2012-10-17",
   "Statement": [
         {
            "Sid": "AllowCopy",
            "Effect": "Allow",
            "Principal": {
                 "AWS": "arn:aws:iam::805450598777:root"
              },
              "Action": [
                   "s3:ListBucket",
                   "s3:GetObject"
              ],
              "Resource": [
                   "arn:aws:s3:::kprbucket1/*",
                   "arn:aws:s3:::kprbucket1"
              ]
         }
   ]
})
  
}

resource "aws_s3_bucket_object" "largefile" {
    bucket = aws_s3_bucket.kprbucket1.id

    key = "Movie"

    source = "C:/Users/Koushik P R/Downloads/Now.You.See.Me.2.2016.1080p.BluRay.6CH.ShAaNiG.mkv"

    etag = filemd5("C:/Users/Koushik P R/Downloads/Now.You.See.Me.2.2016.1080p.BluRay.6CH.ShAaNiG.mkv")

  
}