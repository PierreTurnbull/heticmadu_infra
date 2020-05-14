# heticmedu_infra

The infrastructure deployment code for a school project.

## How it works

Terraform deploys an AWS EC2 instance, a key-pair and a security group in the default VPC.

## Deployment instructions

### Create the infrastructure with Terraform

First, export the AWS credentials of the user [(create one)](https://console.aws.amazon.com/iam/home?region=eu-west-3#/users) who will deploy the infrastructure

```
cd terraform
```

```
export AWS_ACCESS_KEY_ID=<id> AWS_SECRET_ACCESS_KEY=<secret>
```

If you are deploying this project for the first time, [install Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) and run

```
terraform init
```

To deploy the infrastructure, run

```
terraform apply [--auto-approve]
```

### Configure the resources created with Ansible

// todo : ansible instructions

## TODO

// todo : ansible description brève des rôles

// todo : ansible exemple de commande pour lancer les ressources et variables à remplacer

// todo : put all instructions in 1 script for easier deployment

// todo : aws kms for encryption