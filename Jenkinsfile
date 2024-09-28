pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'hospital-management:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Oswald-OSEI/DevOps.git', branch: 'feature/002-Jenkins-CI-CD-with-Docker'
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}").inside {
                        sh 'mvn test'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}").withRun('-p 8080:8080') { c ->
                        sh "docker logs ${c.id}"
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                sh 'docker system prune -f'
            }
        }
    }
}
