resource "aws_s3_account_public_access_block" "s3_block" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_account_alternate_contact" "security" {
  alternate_contact_type = "SECURITY"
  name                   = "Security Team"
  title                  = "Security Team"
  email_address          = var.security_email
  phone_number           = "(800) 555-0100"
}

resource "aws_account_alternate_contact" "operations" {
  alternate_contact_type = "OPERATIONS"
  name                   = "Operations Team"
  title                  = "Operations Team"
  email_address          = var.operations_email
  phone_number           = "(800) 555-0101"
}