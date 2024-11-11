pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'sadaf02shaikh/poe'  // Your Docker Hub repository
        DOCKER_HUB_CREDENTIALS_ID = 'docker1'  // Jenkins credentials ID for Docker Hub
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository
                git branch: 'main', url: 'https://github.com/SadafAShaikh/poe'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the repo
                    dockerImage = docker.build("${DOCKER_HUB_REPO}:${env.BUILD_ID}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push Docker image to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_HUB_CREDENTIALS_ID}") {
                        dockerImage.push("${env.BUILD_ID}")
                        dockerImage.push('latest')  // Tag the image with 'latest'
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker images to save space
            bat "docker rmi ${DOCKER_HUB_REPO}:${env.BUILD_ID} || true"
        }
    }
}
