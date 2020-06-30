# heticmedu_infra

The infrastructure deployment code for a school project.

## How it works

Terraform deploys an AWS EC2 instance, a key-pair and a security group in the default VPC.

## Deployment instructions

### Prerequisites

First, export the AWS credentials of the user [(create one)](https://console.aws.amazon.com/iam/home?region=eu-west-3#/users) who will deploy the infrastructure

```bash
export AWS_ACCESS_KEY_ID=<id>
export AWS_SECRET_ACCESS_KEY=<secret>
```

Install Python dependencies

```bash
pip install boto ansible
```

Optionally, enable to find regions that are not referenced in Boto, such as eu-west-3

```bash
export BOTO_USE_ENDPOINT_HEURISTICS=true
```

### Create the infrastructure with Terraform

If you are deploying this project for the first time, [install Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) and run

```bash
cd terraform
terraform init
```

Prepare credentials for the database:

```
export TF_VAR_db_username=<username>
export TF_VAR_db_password=<password>
```

To deploy the infrastructure, run

```bash
terraform apply [--auto-approve]
```

### Configure the resources created with Ansible

```bash
cd ../ansible
```

Install roles

```bash
ansible-galaxy role install -r requirements.yml
```

Run Ansible Playbooks

```bash
ansible-playbook ./main.yml --user ubuntu --key <ssh/public/key/path> -i ./inventory/ec2.py
```

## TODO

// todo : put all instructions in 1 script for easier deployment

// todo : aws kms for encryption