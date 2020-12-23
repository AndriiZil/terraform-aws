provider "aws" {
//    access_key = "AKIARF7TPCBYGEMEF7HB"
//    secret_key = "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"
//    region = "eu-central-1"
}

//resource "aws_instance" "my_ubuntu" {
//    count = 2
//    ami = "ami-0502e817a62226e03"
//    instance_type = "t3.micro"
//
//    tags = {
//        Name = "My Ubuntu Server"
//        Owner = "Andrii Zilnyk"
//        Project = "Terraform Lessons"
//    }
//}

resource "aws_instance" "my_ubuntu" {
    ami = "ami-0502e817a62226e03"
    instance_type = "t3.micro"

    tags = {
        Name = "My Ubuntu Server"
        Owner = "Andrii Zilnyk"
        Project = "Terraform Lessons"
    }
}

resource "aws_instance" "my_Amazon" {
    ami = "ami-03c3a7e4263fd998c"
    instance_type = "t3.small"

    tags = {
        Name = "My Amazon Server"
        Owner = "Andrii Zilnyk"
        Project = "Terraform Lessons"
    }
}
