# --------------------------------------------------
# My Terraform
#
# Variables
#
# Andrii Zilnyk
# --------------------------------------------------

provider "aws" {
  region = "ca-central-1"
}

provider "aws" {
  region = "us-east-1"
  alias = "USA"
}

provider "aws" {
  region = "eu-central-1"
  alias = "GER"
}

# ==========================================

data "aws_ami" "default_latest_ubuntu" {
  owners = ["099720109477"]
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_ami" "usa_latest_ubuntu" {
  provider = aws.USA
  owners = ["099720109477"]
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_ami" "ger_latest_ubuntu" {
  provider = aws.GER
  owners = ["099720109477"]
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "my_default_server" {
  ami = data.aws_ami.default_latest_ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "Default Server"
  }
}

resource "aws_instance" "my_usa_server" {
  provider = aws.USA
  ami = data.aws_ami.usa_latest_ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "USA Server"
  }
}

resource "aws_instance" "my_ger_server" {
  provider = aws.GER
  ami = data.aws_ami.ger_latest_ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "Germany Server"
  }
}
