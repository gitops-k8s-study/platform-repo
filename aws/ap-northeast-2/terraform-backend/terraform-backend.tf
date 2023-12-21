resource "aws_s3_bucket" "test-s3-tf-state" {

  bucket = "testfork8serin-s3-tf-state"

  tags = {
    "Name" = "testfork8serin-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "test-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.testfork8serin-s3-tf-state]

  name         = "testfork8serin-ddb-tf-lock"

  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "test-ddb-tf-lock"
  }

}
