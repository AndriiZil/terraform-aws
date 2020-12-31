#-------------------------------------------------
# My Terraform
#
# Build WebServer with Dynamic Security Group
#
# Made by Andrii Zilnyk
#-------------------------------------------------

provider "aws" {
    region = "eu-central-1"
}

resource "aws_security_group" "my_webserver" {
    name = "Dynamic security group"

    dynamic "ingress" {
        for_each = ["80", "443", "8080", "1541", "9092"]

        content {
            from_port   = ingress.value
            to_port     = ingress.value
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    # Incoming traffic
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["10.10.0.0/16"]
    }

    # Outcoming traffic
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Dynamic Security Group"
        Owner = "Andrii Zilnyk"
    }
}
