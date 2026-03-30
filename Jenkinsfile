pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION    = 'us-east-1'
    }

    stages {

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
