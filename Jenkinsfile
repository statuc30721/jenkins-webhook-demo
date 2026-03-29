pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'echo Building...'
            }
        }

        stage('Test') {
            steps {
                sh 'echo Testing...'
            }
        }

        stage('Terraform Deploy') {
            steps {
                sh '''
                    echo "Initializing Terraform..."
                    terraform init

                    echo "Planning Terraform changes..."
                    terraform plan -var="s3_bucket_name=arma-proof-bucket"

                    echo "Applying Terraform changes..."
                    terraform apply -auto-approve -var="s3_bucket_name=arma-proof-bucket"
                '''
            }
        }
    }
}
