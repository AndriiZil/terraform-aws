# Auto Fill parameters for DEV
# file can be names as:

# dev.auto.tfvars
# prod.auto.tfvars
# dev.auto.tfvars

region = "ca-central-1"
instance_type = "t2.micro"
enabled_detailed_monitoring = false

allowed_ports = ["80", "22", "8080"]

common_tags = {
    Owner = "Andrii Zilnyk"
    Project = "Phoenix"
    CostCenter = "12345"
    Environment = "dev"
}
