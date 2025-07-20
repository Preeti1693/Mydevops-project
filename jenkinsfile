pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/yourname/Mydevops-project.git'
            }
        }

        stage('Docker Compose Up') {
            steps {
                sh 'docker-compose down || true'
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            echo 'App deployed using Docker Compose!'
        }
        failure {
            echo 'Something went wrong!'
        }
    }
}

