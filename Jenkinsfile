pipeline {
    agent any

    parameters {
        string(name: 'S3_BUCKET_NAME', defaultValue: 'arma-class7-screenshots', description: 'Bucket name')
    }

    environment {
        AWS_DEFAULT_REGION = 'eu-central-1'
    }

    stages {

        stage('Terraform Init') {
            steps {
                sh '''
                terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh """
                terraform plan -var="s3_bucket_name=${S3_BUCKET_NAME}" -out=tfplan.out
                terraform show -no-color tfplan.out > tfplan.txt
                """
            }
        }

        stage('Terraform Apply') {
            steps {
                sh """
                terraform apply -auto-approve -var="s3_bucket_name=${S3_BUCKET_NAME}"
                """
            }
        }
    }

    post {
        always {
            echo "Pipeline completed."
        }
    }
}
