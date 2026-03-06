resource "aws_route53_cidr_collection" "main" {
  name = "${var.aws_account_name}-collection"
}

resource "aws_route53_cidr_location" "office_cidrs" {
  cidr_collection_id = aws_route53_cidr_collection.main.id
  name               = "office"
  cidr_blocks        = ["200.5.3.0/24", "200.6.3.0/24"]
}