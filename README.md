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
