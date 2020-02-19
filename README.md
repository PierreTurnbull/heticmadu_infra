# heticmedu_infra

The infrastructure deployment code for a school project.

## How it works

When pushing on master, Travis uses Terraform to deploy an AWS EC2 instance, a key-pair and a security group in the default VPC, using a user whose credentials.

### Terraform

Ressources created for the infrastructure:
- a t2.micro instance named "heticmadu"
- a key pair named "heticmadu"
- a security group in the default VPC enabling traffic:
    - outside (egress): all connections
    - inside (ingress):
        - TCP on port 22 (SSH)
        - TCP on port 4000 (back-end)
        - TCP on port 3000 (front-end)

## How to use it locally

First, export the AWS credentials of the user [(create one)](https://console.aws.amazon.com/iam/home?region=eu-west-3#/users) who will deploy the infrastructure

```
export AWS_ACCESS_KEY_ID=<id> AWS_SECRET_ACCESS_KEY=<secret>
```

If you are deploying this project for the first time, [install Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) and run

```
terraform init
```

To deploy the infrastructure, run

```
terraform apply
```

## How to deploy in production

Simply push your changes on master (either directly or with a pull request).

## TODO

// todo : ansible description brève des rôles

// todo : ansible exemple de commande pour lancer les ressources et variables à remplacer
