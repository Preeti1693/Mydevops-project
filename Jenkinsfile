pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/Preeti1693/Mydevops-project.git'
            }
        }

        stage('Build Frontend Image') {
            steps {
                sh '''
                    docker build -t sellit-frontend ./frontend
                '''
            }
        }

        stage('Deploy Frontend Container') {
            steps {
                sh '''
                    docker rm -f sellit-frontend || true
                    docker run -d -p 3001:80 --name sellit-frontend sellit-frontend
                '''
            }
        }

        stage('Build Backend Image') {
            steps {
                sh '''
                    docker build -t mydevops-project_backend ./backend
                '''
            }
        }

        stage('Deploy Backend Container') {
            steps {
                sh '''
                    docker rm -f sellit-backend || true
                    docker run -d -p 5002:5000 --name sellit-backend mydevops-project_backend
                '''
            }
        }
    }
}
