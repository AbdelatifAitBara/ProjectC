pipeline {
    agent { label 'Ansible_Master' }

    environment {
        PROJECT_DIR = '/home/ubuntu/ProjectC'
        PROJECT_FOLDER = 'ProjectC'
        INVENTORY_DIR = '/home/ubuntu/ProjectC/Infrastructure/Infra'
        PLAY_BOOKS_DIR = '/home/ubuntu/ProjectC/Infrastructure/playbooks'
        INFRA_DIR = '/home/ubuntu/ProjectC/Infrastructure/Infra'
    }

    stages {
        stage('Clone Git Repository') {
            steps {
                sh "rm -rf ${PROJECT_DIR}"
                sh "mkdir -p ${PROJECT_DIR}"
                sh "git -C ${PROJECT_DIR} clone --recursive git@github.com:AbdelatifAitBara/Infrastructure.git"
            }
        }

        stage('Deploy EC2-03 Instance For Vault') {
            steps{
                dir("/home/ubuntu/ProjectC/Infrastructure/Infra") { //
                    sh 'terraform init'
               }
            }
        }


    }

    post {
        failure {
            echo "Build failed: ${currentBuild.result}"
        }
        success {
            echo "Build succeeded: ${currentBuild.result}"
        }
    }
}