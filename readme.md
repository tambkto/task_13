**DEPLOYMENT ON ECS VIA JENKINS** 

This project creates ECS Cluster and EC2 via Terraform. Jenkins is configured on EC2 by following the Master Slave architecture. Jenkins Pipeline is created which deploys the application automatically over ECS. 

**Provision Infrastructure:** 

The terraform code for provisioning the ECS Cluster and EC2 is provided in the GitHub. We will provision an ECS Cluster on which the nginx official container would be deployed. 

**Terraform init:** 

This command will initializes the repository for creating infrastructure. 

![alt text](<Screenshot from 2025-08-05 23-57-25.png>)
 
**Terraform Plan:**

This will give us overall plan of what resources will be provisioned when terraform will run. 

![alt text](<Screenshot from 2025-08-05 23-58-44.png>)
 
**Terraform apply:** 

This command will provision the infrastructure that we specified in our terraform code. 

![alt text](<Screenshot from 2025-08-06 00-00-17.png>)

**Infrastructure Provisioned:**

The following infrastructure will be provisioned when terraform is applied. 

**ECS Cluster:** 

![alt text](<Screenshot from 2025-08-06 00-01-56.png>)
 

**EC2 Instances:** 

![alt text](<Screenshot from 2025-08-06 00-02-13.png>)
 

**Access Jenkins:** 

We will access Jenkins at the Public IP of ‘Jenkins-master' instance. 

![alt text](<Screenshot from 2025-08-06 00-03-13.png>)

**Configure Jenkins:**

![alt text](image-6.png)

![alt text](image-7.png)
 
**Configure Agent:** 

We will configure Slave agent on which our Pipeline will run and build the application. It will be configured by navigating to Nodes under the System Configuration. 

![alt text](<Screenshot from 2025-08-06 00-08-54.png>)

Paste this command on Slave agent and our Slave node will be connected with Master Node. 

![alt text](<Screenshot from 2025-08-06 00-11-41.png>)

Our Agent is successfully connected with Master Node, and we can run out pipeline on these agents. 

![alt text](<Screenshot from 2025-08-06 00-12-37.png>)
 

**Pipeline Triggered:**

We will trigger our pipeline and new version of application will be successfully deployed over ECS. 

![alt text](<Screenshot from 2025-08-06 00-16-15.png>)

**Service Updated:**

Our service will be updated with the new deployment that is carried out via Jenkins Pipeline. 

![alt text](<Screenshot from 2025-08-06 00-16-43.png>)

**Application:**

We can access the application at the Public IP of task.  

![alt text](<Screenshot from 2025-08-06 00-18-32.png>)
 

**Terraform Destroy:** 

We will destroy the infrastructure that we provisioned earlier via running the command. 

![alt text](<Screenshot from 2025-08-06 00-20-26.png>)

 

 

 

 

 

 

 

 

 