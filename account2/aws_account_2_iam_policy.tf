resource "aws_iam_policy" "mypolicy" {
    name = "Transfer_policy"
    description = "To transfer btw 2 users"

    policy = jsonencode({
  "Version": "2012-10-17",
           "Statement": [
     {
              "Effect": "Allow",
              "Action": [
                   "s3:ListBucket",
                   "s3:GetObject"
              ],
              "Resource": [
                 "arn:aws:s3:::kprbucket1",
                 "arn:aws:s3:::kprbucket1/*"
              ]
     },
     {
              "Effect": "Allow",
              "Action": [
                   "s3:ListBucket",
                   "s3:PutObject",
                   "s3:PutObjectAcl"
                 ],
                "Resource": [
                 "arn:aws:s3:::kprbucket2",
                 "arn:aws:s3:::kprbucket2/*"
                ]
           }
       ]
   })
  
}

resource "aws_iam_user" "koushikpr" {
    name = "koushikpr"

}

resource "aws_iam_user_policy" "myuser" {
    name = "myuser"
    user = aws_iam_user.koushikpr.name
    policy = aws_iam_policy.mypolicy.policy

  
}

resource "aws_iam_access_key" "koushikpr" {
    user = aws_iam_user.koushikpr.id
  
}

