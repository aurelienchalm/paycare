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
                    mkdir -p test-reports
                    docker run --rm \
                    -v $(pwd)/test-reports:/app/test-reports \
                    ${DOCKER_IMAGE} \
                    pytest test_etl.py --junitxml=test-reports/unit-tests.xml
                '''
            }
        }

        stage('Publish Test Results') {
            steps {
                junit 'test-reports/unit-tests.xml'
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