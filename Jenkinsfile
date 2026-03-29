pipeline {
    agent any

    environment {
        AWS_REGION = "eu-central-1"
        TF_IN_AUTOMATION = "true"
    }

    stages {

        stage('Verify AWS Identity') {
            steps {
                sh '''
                    echo "=== AWS Identity Check ==="
                    aws sts get-caller-identity
                    echo "=========================="
                '''
            }
        }

        stage('Refresh AWS Credentials') {
            steps {
                sh '''
                    echo "=== Refreshing Instance Profile Credentials ==="
                    curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/
                    echo "==============================================="
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    cd terraform
                    terraform init -input=false
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    cd terraform
                    terraform plan -input=false
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                    cd terraform
                    terraform apply -auto-approve -input=false
                '''
            }
        }
    }

    post {
        always {
            sh 'echo "Pipeline completed."'
        }
    }
}
