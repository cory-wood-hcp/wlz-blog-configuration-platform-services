# Security group for data tier with common database ports
resource "aws_security_group" "data_tier" {
  name        = var.security_group_name
  description = "Security group for data tier with common database ports"
  vpc_id      = aws_vpc.main.id
  region      = var.region
  # MySQL/MariaDB
  ingress {
    description     = "MySQL/MariaDB from app tier"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_tier.id]
  }

  # PostgreSQL
  ingress {
    description     = "PostgreSQL from app tier"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app_tier.id]
  }

  # Microsoft SQL Server
  ingress {
    description     = "Microsoft SQL Server from app tier"
    from_port       = 1433
    to_port         = 1433
    protocol        = "tcp"
    security_groups = [aws_security_group.app_tier.id]
  }

  # Oracle Database
  ingress {
    description     = "Oracle Database from app tier"
    from_port       = 1521
    to_port         = 1521
    protocol        = "tcp"
    security_groups = [aws_security_group.app_tier.id]
  }

  # MongoDB
  ingress {
    description     = "MongoDB from app tier"
    from_port       = 27017
    to_port         = 27017
    protocol        = "tcp"
    security_groups = [aws_security_group.app_tier.id]
  }

  # Redis
  ingress {
    description     = "Redis from app tier"
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [aws_security_group.app_tier.id]
  }

  # Memcached
  ingress {
    description     = "Memcached from app tier"
    from_port       = 11211
    to_port         = 11211
    protocol        = "tcp"
    security_groups = [aws_security_group.app_tier.id]
  }

  # Elasticsearch
  ingress {
    description     = "Elasticsearch from app tier"
    from_port       = 9200
    to_port         = 9200
    protocol        = "tcp"
    security_groups = [aws_security_group.app_tier.id]
  }

  # Allow all outbound traffic
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name    = var.security_group_name
    Purpose = "data-tier"
  })
}

# Security group for application tier
resource "aws_security_group" "app_tier" {
  name        = var.app_tier_security_group_name
  description = "Security group for application tier that allows traffic from web tier security group"
  vpc_id      = aws_vpc.main.id
  region      = var.region
  # Allow all traffic from the web tier security group
  ingress {
    description     = "All traffic from web tier security group"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.web_tier.id]
  }

  # Allow all outbound traffic
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name    = var.app_tier_security_group_name
    Purpose = "app-tier"
  })
}

# Security group for web tier
resource "aws_security_group" "web_tier" {
  name        = var.web_tier_security_group_name
  description = "Security group for web tier that allows HTTP and HTTPS traffic"
  vpc_id      = aws_vpc.main.id
  region      = var.region
  # Allow HTTP traffic from anywhere
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS traffic from anywhere
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name    = var.web_tier_security_group_name
    Purpose = "web-tier"
  })
}