#
# RDS
#
# Andrii Zilnyk
# --------------------------------------------------

provider "aws" {
    region = "ca-central-1"
}

resource "random_string" "rds_password" {
    length = 12
    special = true
    override_special = "!#$&"
}

resource "aws_ssm_parameter" "rds_password" {
    name = "/prod/mysql"
    type = "SecureString"
    value = random_string.rds_password.result
    description = "Master Password for RDS MySQL"
}

data "aws_ssm_parameter" "my_rds_password" {
    name = "/prod/mysql"

    depends_on = [aws_ssm_parameter.rds_password]
}

resource "aws_db_instance" "default2" {
    identifier = "prod-rds2"
    allocated_storage    = 20
    storage_type         = "gp2"
    engine               = "mysql"
    engine_version       = "5.7"
    instance_class       = "db.t2.micro"
    name                 = "prod"
    username             = "administrator"
    password             = aws_ssm_parameter.rds_password.value
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot = true
    apply_immediately = true
    depends_on = [aws_ssm_parameter.rds_password]
}

output "rds_password" {
    value = data.aws_ssm_parameter.my_rds_password.value
}
