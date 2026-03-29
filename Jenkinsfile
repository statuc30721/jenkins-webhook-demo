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

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var="s3_bucket_name=arma-proof-bucket"'
            }
        }

        stage('Deploy') {
            steps {
                sh 'terraform apply -auto-approve -var="s3_bucket_name=arma-proof-bucket"'
            }
        }
    }
}
