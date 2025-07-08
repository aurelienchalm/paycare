pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'paycare-etl-tests'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/ton-utilisateur/paycare-etl.git' // ← à adapter
            }
        }

        stage('Build Docker Image for Tests') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }

        stage('Run Unit Tests in Docker') {
            steps {
                // Exécute les tests dans le conteneur
                sh 'docker run --rm ${DOCKER_IMAGE} pytest test_etl.py --junitxml=unit-tests.xml'
            }
        }

        stage('Publish Test Results') {
            steps {
                junit 'unit-tests.xml'
            }
        }
    }

    post {
        success {
            echo '✅ Tests passed with success!'
        }
        failure {
            echo '❌ Tests failed!'
        }
    }
}