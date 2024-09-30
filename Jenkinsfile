pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                 git branch: 'feature/002-Jenkins-CI-CD-with-Docker', url: 'https://github.com/Oswald-OSEI/DevOps'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('hospital_management:latest')
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('hospital_management:latest').run('-d -p 8080:8080')
                }
            }
        }
    }
    post {
        always {
            script {
                // Cleanup unused containers and images
                sh 'docker system prune -f'
            }
        }
    }
}
