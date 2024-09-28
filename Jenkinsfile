pipeline {
    agent {
        docker {
            image 'openjdk:21-jdk' // Use an OpenJDK 21 Docker image for building
            args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket for Docker commands
        }
    }
    environment {
        DOCKER_IMAGE = 'hospital-management:latest' // Define the Docker image tag for your application
    }
    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository from GitHub 
               git url: 'https://github.com/Oswald-OSEI/DevOps.git', branch: 'feature/002-Jenkins-CI-CD-with-Docker'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build the Docker image for the Java application
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Run tests inside the container
                    sh 'docker run --rm $DOCKER_IMAGE mvn test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Deploy the Docker image (e.g., pushing to a registry or running a container)
                    sh 'docker run -d -p 8080:8080 --name java-app $DOCKER_IMAGE'
                }
            }
        }
    }
    post {
        always {
            // Clean up unused Docker images to free up space
            sh 'docker system prune -f'
        }
    }
}
