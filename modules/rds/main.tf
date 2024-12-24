resource "aws_db_subnet_group" "mysql" {
  name        = "mysql-subnet-group-${var.environment}"
  subnet_ids  = var.subnet_ids

  tags = {
    Name        = "DBSubnetGroup-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_db_instance" "mysql" {
  identifier        = "mysql-${var.environment}"
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  engine            = "mysql"
  engine_version    = var.engine_version
  username          = var.username
  password          = var.password
  db_subnet_group_name = aws_db_subnet_group.mysql.name
  vpc_security_group_ids = var.security_group_ids

  multi_az               = var.multi_az
  storage_encrypted      = true
  delete_automation_retention_period = var.de
