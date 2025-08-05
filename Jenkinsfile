pipeline {
    agent slave13
    environment {
        AWS_REGION = 'us-east-2'
        ECR_REPOSITORY_URI = '504649076991.dkr.ecr.us-east-2.amazonaws.com/task13'
        IMAGE_TAG = "latest"
        GIT_REPO_URL = 'https://github.com/tambkto/task_13'
        ECS_CLUSTER = 'Umar_cluster'
        ECS_SERVICE = 'Umar_service'
        TASK_DEFINITION_FAMILY = 'Umar_task_definition'
    }
    stages {
        stage('Checkout Code') {
            steps {
                // Clone the repository
                git branch: 'main', url: "${env.GIT_REPO_URL}"
            }
        }
        stage('Login to AWS ECR') {
            steps {
                // Authenticate Docker to the ECR registry
                sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPOSITORY_URI'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                sh 'docker build -t $ECR_REPOSITORY_URI:$IMAGE_TAG .'
            }
        }
        stage('Push Docker Image to ECR') {
            steps {
                // Push the image to the ECR repository
                sh 'docker push $ECR_REPOSITORY_URI:$IMAGE_TAG'
            }
        }
        stage('Deploy to ECS') {
            steps {
                // Update the ECS service with the new Docker image
                sh '''
                aws ecs update-service --cluster $ECS_CLUSTER --service $ECS_SERVICE --force-new-deployment --region $AWS_REGION
                '''
            }
        }
    }
}