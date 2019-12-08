resource "aws_secretsmanager_secret" "example" {
  name                    = "rds_admin"
  description             = "RDS Admin password"
  recovery_window_in_days = 14
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id     = "${aws_secretsmanager_secret.example.id}"
  secret_string = random_password.password.result
}
