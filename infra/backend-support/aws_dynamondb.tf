resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "news4321-terraform-locks"
  # up to 25 per account is free
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
     Name = "Terraform Lock Table"
     createdBy = "infra-news4321/backend-support"
  }
}