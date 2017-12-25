# terraform-azuredbformysql
Create Azure DB for MySQL with Terraform

# Usage

Copy terraform.tfvars.sample to terraform.tfvars

```
$ cp terraform.tfvars.sample terraform.tfvars
```

Enter configuration information in terraform.tfvars

```
subscription_id = "00000000-0000-0000-0000-000000000000"

client_id = "00000000-0000-0000-0000-000000000000"

client_secret = "00000000-0000-0000-0000-000000000000"

tenant_id = "00000000-0000-0000-0000-000000000000"

location = "East US"

username = "mysql admin user"
password = "your strong password"

allowed_ip_start = "your ip address"
allowed_ip_end = "your ip address"
```

Execute command

```
$ terraform init
$ terraform plan
$ terraform apply
```