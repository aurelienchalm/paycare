pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'paycare-etl-tests'
    }

    stages {
        stage('Build Docker Image for Tests') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }

        stage('Run Unit Tests in Docker') {
            steps {
                sh '''
                    docker run --rm \
                    -v $(pwd)/unit-tests.xml:/app/unit-tests.xml \
                    ${DOCKER_IMAGE} \
                    pytest test_etl.py --junitxml=unit-tests.xml
                '''
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
            echo '✅ Tests passed!'
        }
        failure {
            echo '❌ Tests failed!'
        }
    }
}