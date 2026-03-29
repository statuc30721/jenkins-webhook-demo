pipeline {
    agent any

    environment {
        AWS_REGION = "eu-central-1"
        TF_IN_AUTOMATION = "true"
    }

    stages {

        stage('AWS Identity Check') {
            steps {
                sh '''
                    echo "=== AWS Identity Check ==="
                    aws sts get-caller-identity
                    echo "=========================="
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    echo "=== TERRAFORM INIT ==="
                    terraform init -input=false
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    echo "=== TERRAFORM PLAN ==="
                    terraform plan -input=false
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                    echo "=== TERRAFORM APPLY ==="
                    terraform apply -auto-approve -input=false
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
