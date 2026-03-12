pipeline {

    parameters {
        choice(
            name: 'terraformAction',
            choices: ['apply', 'destroy'],
            description: 'Choose your terraform action'
        )
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'us-west-2'
    }

    agent any

    stages {

        stage('Checkout') {
            steps {
                script {
                    dir('terraform') {
                        git url: 'https://github.com/ITkannadigaru/Infrastructure.git', branch: 'main'
                    }
                }
            }
        }

        // ─── 0-bootstrap ──────────────────────────────────────────────────────

        stage('Plan: 0-bootstrap') {
            steps {
                sh 'cd terraform/0-bootstrap && terraform init -input=false'
                sh 'cd terraform/0-bootstrap && terraform plan -out tfplan'
                sh 'cd terraform/0-bootstrap && terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage('Approval: 0-bootstrap') {
            steps {
                script {
                    def plan = readFile 'terraform/0-bootstrap/tfplan.txt'
                    input message: '[0-bootstrap] Approve to proceed',
                          parameters: [text(name: 'Plan', description: 'Terraform Plan Output', defaultValue: plan)]
                }
            }
        }

        stage('Apply: 0-bootstrap') {
            steps {
                sh 'cd terraform/0-bootstrap && terraform apply -input=false tfplan'
            }
        }

        // ─── 1-network ────────────────────────────────────────────────────────

        stage('Plan: 1-network') {
            steps {
                sh 'cd terraform/1-network && terraform init -input=false'
                sh 'cd terraform/1-network && terraform plan -out tfplan'
                sh 'cd terraform/1-network && terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage('Approval: 1-network') {
            steps {
                script {
                    def plan = readFile 'terraform/1-network/tfplan.txt'
                    input message: '[1-network] Approve to proceed',
                          parameters: [text(name: 'Plan', description: 'Terraform Plan Output', defaultValue: plan)]
                }
            }
        }

        stage('Apply: 1-network') {
            steps {
                sh 'cd terraform/1-network && terraform apply -input=false tfplan'
            }
        }

        // ─── 2-eks ────────────────────────────────────────────────────────────

        stage('Plan: 2-eks') {
            steps {
                sh 'cd terraform/2-eks && terraform init -input=false'
                sh 'cd terraform/2-eks && terraform plan -out tfplan'
                sh 'cd terraform/2-eks && terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage('Approval: 2-eks') {
            steps {
                script {
                    def plan = readFile 'terraform/2-eks/tfplan.txt'
                    input message: '[2-eks] Approve to proceed',
                          parameters: [text(name: 'Plan', description: 'Terraform Plan Output', defaultValue: plan)]
                }
            }
        }

        stage('Apply: 2-eks') {
            steps {
                sh 'cd terraform/2-eks && terraform apply -input=false tfplan'
            }
        }

    }

    post {
        success {
            echo "Infrastructure deployed successfully."
        }
        failure {
            echo "Pipeline failed. Check the stage logs above."
        }
        always {
            cleanWs()
        }
    }
}
