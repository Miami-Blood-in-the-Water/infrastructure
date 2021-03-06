resource "aws_db_instance" "miami" {
  identifier           = "miami"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "11.5"
  instance_class       = "db.t3.micro"
  name                 = "postgres"
  username             = "postgres"
  password             = "postgres"
  parameter_group_name = "default.postgres11"
  skip_final_snapshot  = true

  lifecycle {
    ignore_changes = [password]
  }
}
