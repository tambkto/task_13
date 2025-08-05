**DEPLOYMENT ON ECS VIA JENKINS** 

This project creates ECS Cluster and EC2 via Terraform. Jenkins is configured on EC2 by following the Master Slave architecture. Jenkins Pipeline is created which deploys the application automatically over ECS. 

**Provision Infrastructure:** 

The terraform code for provisioning the ECS Cluster and EC2 is provided in the GitHub. We will provision an ECS Cluster on which the nginx official container would be deployed. 

**Terraform init:** 

This command will initializes the repository for creating infrastructure. 
![alt text](<Screenshot from 2025-08-05 23-57-25.png>)
 
Terraform Plan:

This will give us overall plan of what resources will be provisioned when terraform will run. 

 

 

 

Terraform apply: 

This command will provision the infrastructure that we specified in our terraform code. 

 

Infrastructure Provisioned: 

The following infrastructure will be provisioned when terraform is applied. 

ECS Cluster: 

 

EC2 Instances: 

 

Access Jenkins: 

We will access Jenkins at the Public IP of ‘Jenkins-master' instance. 

 

Configure Jenkins: 

 

 

Configure Agent: 

We will configure Slave agent on which our Pipeline will run and build the application. It will be configured by navigating to Nodes under the System Configuration. 

 

Paste this command on Slave agent and our Slave node will be connected with Master Node. 

 

Our Agent is successfully connected with Master Node, and we can run out pipeline on these agents. 

 

Pipeline Triggered: 

We will trigger our pipeline and new version of application will be successfully deployed over ECS. 

 

Service Updated: 

Our service will be updated with the new deployment that is carried out via Jenkins Pipeline. 

 

Application: 

We can access the application at the Public IP of task.  

 

Terraform Destroy: 

We will destroy the infrastructure that we provisioned earlier via running the command. 

 

 

 

 

 

 

 

 

 