pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION    = 'us-east-1'
    }

    stages {

        stage('Clean Terraform State') {
            steps {
                sh '''
                echo "Cleaning Terraform state..."
                rm -f terraform.tfstate
                rm -f terraform.tfstate.backup
                rm -f .terraform.lock.hcl
                rm -rf .terraform
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                echo "Initializing Terraform..."
                terraform init
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                echo "Applying Terraform..."
                terraform apply -auto-approve
                '''
            }
        }
    }

    post {
        always {
            echo "Pipeline completed."
        }
    }
}
