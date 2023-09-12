# Nextcloud eks infrastructure

This project is designed to learn how to configure self-hosted eks cluster in
custom vpc with efs and alb-ingress support. This is beta version of tf scripts,
which will be more automate in near future. Deployment consist of:

- vpc/eks creation with iam policies for efs and alb
- creation of kubernetes resources

## Requirements

This infrastructure designed to deploy nextcloud on https, so that you should have
your ACM certificate in order to use ssl, or you can comment lines in **k8s/nextcloud.yaml.tpl**
file in ingress section. Another requirement is to create dns record for nextcloud 
trusted domain.

### VPC/EKS deployment

In order to deploy vpc for eks with all neccessary iam resources, you should fill 
variables in **variables.tf** file:

1. key_name = name of ssh key for worker nodes
2. environment = useless variable, that should describe env of aws resource. Will be replaced with terraform.workspace
3. region = aws region
4. database_password = password for nextcloud rds

After successful deployment of terraform scripts, it will create custom **.kube-config** file, which will be used
in **k8s/** directory, that designed to create kubernetes resources using terraform.

!!!Configure KUBECONFIG env variable with $PWD/.kube-config path of new generated eks config.

`Example: export KUBECONFIG=$PWD/.kube-config`

### K8s resources deployment

First and foremost, you need to cd to **k8s/** dir and configure variables in **variables.tf** and apply terraform:

1. region
2. first_subnet = private first subnet from terraform output VPC/EKS section
3. second_subnet = private second subnet from terraform output VPC/EKS section
4. database_endpoint = endpoint to rds database from terraform output VPC/EKS section
5. certificate_arn = arn of aws acm certificate
6. database_password = password of nextcloud rds database
7. admin_password = password for nextcloud admin account
8. trusted_domain = dns name for nextcloud

Then, apply **efs.yaml** and **nextcloud.yaml** files to deploy kubernetes resources

`Example: kubectl apply -f efs.yaml && kubectl apply -f nextcloud.yaml`

## Enjoy this project (^v^)
