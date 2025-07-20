pipeline {
    agent any

    environment {
        FRONTEND_IMAGE = "sellit-frontend"
        BACKEND_IMAGE  = "sellit-backend"

        FRONTEND_CONTAINER = "sellit-frontend-container"
        BACKEND_CONTAINER  = "sellit-backend-container"

        FRONTEND_PORT = "3002"
        BACKEND_PORT  = "5002"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Preeti1693/Mydevops-project.git'
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    echo "Building Frontend Docker Image..."
                    sh "docker build -t ${FRONTEND_IMAGE} ./frontend"

                    echo "Building Backend Docker Image..."
                    sh "docker build -t ${BACKEND_IMAGE} ./backend"
                }
            }
        }

        stage('Stop & Remove Old Containers') {
            steps {
                script {
                    sh "docker rm -f ${FRONTEND_CONTAINER} || true"
                    sh "docker rm -f ${BACKEND_CONTAINER} || true"
                }
            }
        }

        stage('Run New Containers') {
            steps {
                script {
                    echo "Running Frontend on port ${FRONTEND_PORT}"
                    sh "docker run -d -p ${FRONTEND_PORT}:80 --name ${FRONTEND_CONTAINER} ${FRONTEND_IMAGE}"

                    echo "Running Backend on port ${BACKEND_PORT}"
                    sh "docker run -d -p ${BACKEND_PORT}:5000 --name ${BACKEND_CONTAINER} ${BACKEND_IMAGE}"
                }
            }
        }
    }

    post {
        success {
            echo "✅ Frontend: http://<your-ip>:${FRONTEND_PORT}"
            echo "✅ Backend:  http://<your-ip>:${BACKEND_PORT}"
        }
        failure {
            echo "❌ Deployment failed. Check console logs."
        }
    }
}
