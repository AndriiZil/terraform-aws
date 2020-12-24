#-------------------------------------------------
# My Terraform
#
# Build WebServer during Bootstrap
#
# Made by Andrii Zilnyk
#-------------------------------------------------

provider "aws" {
    region = "eu-central-1"
}

resource "aws_eip" "my_static_ip" {
    instance = aws_instance.my_webserver.id
}

resource "aws_instance" "my_webserver" {
    ami = "ami-03c3a7e4263fd998c" # Amazon Linux AMI
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.my_webserver.id]
    user_data = templatefile("user_data.sh.tpl", {
        f_name = "Andrii",
        l_name = "Zilnyk",
        names = ["Andrii", "Oleg", "Petya", "John", "Donald", "Masha", "Katya"]
    })

    tags = {
        Name = "Web Server Build by Terraform"
        Owner = "Andrii Zilnyk"
    }

//    lifecycle {
//        prevent_destroy = true // # User Data changing
//        ignore_changes = ["ami", "user_data"]
//    }
    lifecycle {
        create_before_destroy = true // # Create server before destroy
    }

}

resource "aws_security_group" "my_webserver" {
    name        = "WebServer security group"
    description = "My first security group"

    # Incoming traffic
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Outcoming traffic
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Web Server Security Group"
        Owner = "Andrii Zilnyk"
    }
}

output "webserver_instance_id" {
    value = aws_instance.my_webserver.id
}

output "webserver_public_address" {
    value = aws_eip.my_static_ip.public_ip
}
