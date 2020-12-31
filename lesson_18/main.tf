# --------------------------------------------------
# My Terraform
#
# Loop
#
# Andrii Zilnyk
# --------------------------------------------------

provider "aws" {
  region = "eu-central-1"
}

variable "aws_users" {
  description = "List of IAM Users to create"
  default = ["vasya", "petya", "kolya", "masha", "misha", "vova", "donald"]
}

resource "aws_iam_user" "user1" {
  name = "pushkin"
}

resource "aws_iam_user" "users" {
  count = length(var.aws_users)
  name = element(var.aws_users, count.index)
}

# -------------------------------------------------

resource "aws_instance" "servers" {
  count = 3
  ami = "ami-0502e817a62226e03"
  instance_type = "t3.micro"

  tags = {
    Name = "Server Number ${count.index + 1}"
  }
}

output "created_iam_users_all" {
  value = aws_iam_user.users
}

output "created_ian_users_ids" {
  value = aws_iam_user.users[*].id
}

variable "name_counts" {
  type = map(number)
  default = {
    "foo" = 2
    "bar" = 4
  }
}

locals {
  expanded_names = {
      for name, count in var.name_counts : name => [
        for i in range(count) : format("%s%02d", name, i)
      ]
    }
}

output "expanded_names" {
  value = local.expanded_names
}
