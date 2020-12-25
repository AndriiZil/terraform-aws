variable "region" {
    description = "Please Enter AWS Region to Deploy Server"
    type = string
    default = "eu-central-1"
}

variable "instance_type" {
    description = "Enter Instance Type"
    type = string
    default = "t3.micro"
}

variable "allowed_ports" {
    description = "List of Ports to open for server"
    type = list(string)
    default = ["80", "443", "22", "80"]
}

variable "enabled_detailed_monitoring" {
    description = "Enabled Monitoring"
    type = bool
    default = false
}

variable "common_tags" {
    description = "Common tags to apply to all resources"
    type = map(string)
    default = {
        Owner = "Andrii Zilnyk"
        Project = "Phoenix"
        CostCenter = "12345"
        Environment = "development"
    }
}
