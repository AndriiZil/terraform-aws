# --------------------------------------------------
# My Terraform
#
# Global Variables
#
# Made by Andrii Zilnyk
# --------------------------------------------------

provider "aws" {
    region = "eu-central-1"
}

terraform {
    backend "s3" {
        bucket = "andrii-zilyk-project-terraform-state"
        key = "globalvars/terraform.tfstate"
        region = "eu-central-1"
    }
}

# ==================================================

output "company_name" {
    value = "ANDESA Soft International"
}

output "owner" {
    value = "Andrii Zilnyk"
}

output "tags" {
    value = {
        Project = "Assembly-2020"
        CostCenter = "R&D"
        Country = "Ukraine"
    }
}
