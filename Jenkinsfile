pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "amangcp8171/flask-docker-app:${env.BUILD_ID}"
        DOCKER_REGISTRY = 'https://hub.docker.com/r/amangcp8171/repo1'
        GITHUB_CREDENTIALS_ID = '1e5db588-05a9-4c09-8260-d6f25f281269'
        DOCKER_CREDENTIALS_ID = '138ed8df-5d2e-473d-9530-c0a0006e72b8'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: "${GITHUB_CREDENTIALS_ID}", url: 'https://github.com/amangcp8171/gitrepo1.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${DOCKER_IMAGE}").push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }

    triggers {
        githubPush()
    }
}

