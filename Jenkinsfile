pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Debug Terraform Files') {
            steps {
                sh '''
                    echo "=== Searching for main.tf in workspace ==="
                    find . -name "main.tf" -maxdepth 4

                    echo "=== Showing the main.tf Jenkins is using ==="
                    cat $(find . -name "main.tf" -maxdepth 4 | head -n 1)
                '''
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
