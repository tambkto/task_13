##Deploy Nginx on AWS ECS Fargate using Terraform
This project provisions an Nginx server running on Amazon ECS Fargate using Terraform. It includes setting up a custom VPC, ECS cluster, Fargate service, task definition, IAM roles, and networking components with minimal configuration.
#Features
● Custom VPC with public subnets
● Security group to allow HTTP (port 80) traffic
● ECS Fargate cluster setup with a minimal Nginx task definition
● ECS service running Nginx container
● Required IAM roles and policies
● Nginx service is deployed and accessible publicly

#Initialize Terraform
terraform init

#Plan the infrastructure
terraform plan

#Apply the configuration
terraform apply

Access Nginx
Open the Container public IP in your browser to verify Nginx is running.

