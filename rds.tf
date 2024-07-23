resource "random_password" "password" {
  length  = 16
  special = true
}

resource "aws_db_subnet_group" "example" {
  name       = "example"
  subnet_ids = var.subnets

  tags = {
    Name = var.default_tag
  }
}

resource "aws_db_instance" "default" {
  identifier              = "my-database"
  allocated_storage       = 20
  storage_type            = "gp3"
  engine                  = "mariadb"
  engine_version          = "10.11.8"
  instance_class          = "db.t4g.small"
  username                = "Admin"
  password                = random_password.password.result
  parameter_group_name    = "default.mariadb10.11"
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false
  storage_encrypted       = true
  backup_retention_period = 7

  tags = {
    Name = var.default_tag
  }
}


resource "aws_db_proxy" "example" {
  name           = "my-database-proxy"
  debug_logging  = false
  engine_family  = "MYSQL"
  role_arn       = aws_iam_role.example.arn
  vpc_subnet_ids = aws_db_subnet_group.example.subnet_ids

  auth {
    auth_scheme               = "SECRETS"
    client_password_auth_type = "MYSQL_NATIVE_PASSWORD"
    description               = "example"
    iam_auth                  = "DISABLED"
    secret_arn                = aws_secretsmanager_secret.proxy.arn
  }

  tags = {
    Name = var.default_tag
  }
}

resource "aws_db_proxy_default_target_group" "example" {
  db_proxy_name = aws_db_proxy.example.name

  connection_pool_config {
    connection_borrow_timeout    = 120
    init_query                   = "SET x=1, y=2"
    max_connections_percent      = 100
    max_idle_connections_percent = 50
    session_pinning_filters      = ["EXCLUDE_VARIABLE_SETS"]
  }
}

resource "aws_db_proxy_target" "example" {
  db_instance_identifier = aws_db_instance.default.identifier
  db_proxy_name          = aws_db_proxy.example.name
  target_group_name      = aws_db_proxy_default_target_group.example.name
}
