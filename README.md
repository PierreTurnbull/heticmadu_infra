# heticmedu_infra

The infrastructure deployment code for a school project.

## TL;DR

_If you don't have time._

```bash
# replace with real values
export AWS_ACCESS_KEY_ID=<id>
export AWS_SECRET_ACCESS_KEY=<secret>
export TF_VAR_db_username=<username>
export TF_VAR_db_password=<password>
export SSH_KEY_PATH=<path>

# don't bother reading
export BOTO_USE_ENDPOINT_HEURISTICS=true
pip install boto ansible
cd terraform
terraform init
terraform apply --auto-approve
cd ../ansible
ansible-galaxy role install -r requirements.yml
ansible-playbook ./main.yml --user ubuntu --key $SSH_KEY_PATH -i ./inventory/ec2.py
```

## How it works

This repository is meant to create and configure the infrastructure. Application deployment is done on application repositories ([api](https://github.com/PierreTurnbull/heticmadu_api) and [client](https://github.com/ikonx/heticmadu_client)). First, deploy the infrastructure from this repository. Then you can deploy the applications on the newly created infrastructure, by pushing your changes on branch master or preprod of the application.

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

Boto enables accessing AWS resources. You may use a region that is not supported by Boto, such as eu-west-3. To prevent such a problem, enable automatic region finding:

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
