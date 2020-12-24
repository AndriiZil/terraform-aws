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

data "aws_ami" "latest_ubuntu" {
    owners = ["099720109477"]
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
}

data "aws_ami" "latest_amazon_linux" {
    owners = ["amazon"]
    most_recent = true

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

data "aws_ami" "latest_windows_2019" {
    owners = ["amazon"]
    most_recent = true

    filter {
        name = "name"
        values = ["Windows_Server-2019-English-Full-Base-*"]
    }
}

output "latest_ubuntu_ami_name" {
    value = data.aws_ami.latest_ubuntu.name
}

output "latest_ubuntu_ami_id" {
    value = data.aws_ami.latest_ubuntu.id
}

output "latest_amazon_linux_ami_id" {
    value = data.aws_ami.latest_amazon_linux.id
}

output "latest_amazon_linux_ami_name" {
    value = data.aws_ami.latest_amazon_linux.name
}

output "latest_windows_2019_ami_id" {
    value = data.aws_ami.latest_windows_2019.id
}

output "latest_windows_2019_ami_name" {
    value = data.aws_ami.latest_windows_2019.name
}
