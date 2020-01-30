# heticmedu_infra

The infrastructure deployment code for a school project.

## How it works

When pushing on master, Travis uses Terraform to deploy an AWS EC2 instance, key-pair, security group, using a user whose credentials are stored in Travis and his default VPC.

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

## How to use it in in development

Simply push your changes on master (either directly or with a pull request).