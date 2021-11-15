resource "random_password" "password" {
  length  = 16
  special = true
}

resource "aws_db_instance" "default" {
  identifier              = "my-database"
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mariadb"
  engine_version          = "10.4.21"
  instance_class          = "db.t3.micro"
  username                = "Admin"
  password                = random_password.password.result
  parameter_group_name    = "default.mariadb10.4"
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false
  storage_encrypted       = true
  backup_retention_period = 7

  tags = {
    Name = var.default_tag
  }
}
