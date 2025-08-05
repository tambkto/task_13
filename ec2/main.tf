resource "aws_instance" "jenkins-master" {
  ami = var.ami
  instance_type = var.instance-type
  key_name = "umar-login"
  associate_public_ip_address = true
  security_groups = [ var.sg-group ]
  subnet_id = var.subnet
  iam_instance_profile = "umar-ssm-role"
  

    user_data_base64 = base64encode(<<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install openjdk-17-jdk -y
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt update
    sudo apt install jenkins -y
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
    # Install ssh-agent
    sudo apt install openssh-client -y
    eval $(ssh-agent -s)

    EOF
    )

  tags = {
    "Name" = "Jekins-master"
    "owner" = "umar"
    
  }
}

resource "aws_instance" "jenkins-" {
  ami = var.ami
  instance_type = var.instance-type
  key_name = "umar-login"
  associate_public_ip_address = true
  security_groups = [ var.sg-group ]
  subnet_id = var.subnet
  iam_instance_profile = "umar-ssm-role"
    user_data_base64 = base64encode(<<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt update -y
    sudo apt install openjdk-17-jdk -y
    sudo apt install jq -y
    sudo apt install unzip -y
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    sudo apt-get install ca-certificates curl gnupg

    # Add Docker official GPG key
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Use the following command to set up the repository
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update the apt package index
    sudo apt update

    # Install the latest version of Docker
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    sudo groupadd docker
    sudo usermod -aG docker $USER
   

    EOF
    )

  tags = {
    "Name" = "Jenkins-slave"
    "owner" = "umar"
    
  }
}