### Init terraform files
```
    terraform init
```
### What we should do
```
    terraform plan
```
### Create resource
```
    terraform apply
```
### Check json file
```
    less terraform.tfstate
```
### terraform.tfstate, terraform.tfstate.backup responsible for created instances
### Change instance_type to 
```
    instance_type = "t3.small"
```
### For destroying instances cut or comment code OR type
```
    terraform destroy
```
### For securing running script type in terminal
```
    export AWS_ACCESS_KEY_ID=***
    export AWS_SECRET_ACCESS_KEY=***
    export AWS_DEFAULT_REGION=eu-central-1
```
### Check instances with AWS CLI
```
    sudo apt install awscli
    aws ec2 describe-instances
```
### Go terraform console
```
    terraform console
```
### In the console type to check user_data.sh.tpl
```
    file("user_data.sh.tpl")
```

### To inspect template type
```
    templatefile("user_data.sh.tpl", {f_name = "Andrii", l_name = "Zilnyk", names = ["Andrii", "Oleg", "Petya", "John", "Donald", "Masha"]})
```
### Reassign variable
```
    terraform plan -var="region=us-east-1"
    
    or
        
    terraform apply -var="region=us-east-1"
```
### Reassign two variables
```
    terrafform apply -var="region=us-east-1" -var="instance_type=t2.micro"
```
### Another way
```
    export TF_VAR_region=us-west-2
    echo $TF_VAR_region
    
    export TF_VAR_instance_type=t2.small
    
    terraform apply
```
### Variables from deference files
```
    terraform apply -var-file="prod.auto.tfvars"
```
