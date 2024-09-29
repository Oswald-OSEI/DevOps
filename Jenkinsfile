pipeline {
    agent any
    tools {
        maven 'maven' 
    }
    stages {
        stage('Checkout') {
            steps {
                // Get code from GitHub repository
               git branch: 'feature/002-Jenkins-CI-CD-with-Docker', url: 'https://github.com/Oswald-OSEI/DevOps'

            }
        }

        stage('Build') {
            steps {
                // Build the project
                sh 'mvn clean package'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the application (replace this with your actual deployment command)
                sh 'java -jar target/springdata.jar'
            }
        }
    }
}
