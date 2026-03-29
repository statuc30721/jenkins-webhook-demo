pipeline {
    agent any

    parameters {
        booleanParam(name: 'APPLY', defaultValue: false, description: 'Apply Terraform changes')
    }

    stages {

        stage('Clean Workspace') {
            steps {
                sh '''
                    echo "Cleaning Terraform workspace..."
                    rm -f terraform.tfstate terraform.tfstate.backup
                    rm -rf .terraform .terraform.lock.hcl
                '''
            }
        }

        stage('Checkout') {
            steps {
                checkout scm
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

        stage('Terraform Plan') {
            steps {
                sh '''
                    echo "Planning Terraform changes..."
                    terraform plan -var-file="terraform.tfvars"
                '''
            }
        }

        stage('Terraform Apply') {
            when {
                expression { return params.APPLY == true }
            }
            steps {
                sh '''
                    echo "Applying Terraform changes..."
                    terraform apply -auto-approve -var-file="terraform.tfvars"
                '''
            }
        }
    }
}
