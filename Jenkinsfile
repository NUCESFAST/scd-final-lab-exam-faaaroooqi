pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'docker-hub-credentials' 
        GITHUB_CREDENTIALS = 'github-credentials' 
        DOCKER_IMAGE = "faaaroooqi/20i-1788-app"
    }

    stages {
        stage('Checkout Code - 20i-1788') {
            steps {
                checkout([$class: 'GitSCM',
                    branches: [[name: '*/main']],
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/NUCESFAST/scd-final-lab-exam-faaaroooqi.git',
                                        credentialsId: "${env.GITHUB_CREDENTIALS}"]]
                ])
            }
        }

        stage('Install Dependencies - 20i-1788') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Docker Image - 20i-1788') {
            steps {
                script {
                    docker.build("${env.DOCKER_IMAGE}")
                }
            }
        }

        stage('Push Docker Image - 20i-1788') {
            steps {
                script {
                    docker.withRegistry('', "${env.DOCKER_HUB_CREDENTIALS}") {
                        docker.image("${env.DOCKER_IMAGE}").push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
