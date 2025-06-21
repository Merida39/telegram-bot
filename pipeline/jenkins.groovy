pipeline {
    agent any

    parameters {
        choice(name: 'PLATFORM', choices: ['linux', 'windows', 'macos'], description: 'Цільова платформа для збірки')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Запускати тести')
    }

    environment {
        BUILD_DIR = 'build'
    }

    stages {
        stage('Preparation') {
            steps {
                echo "Target platform: ${params.PLATFORM}"
                sh 'mkdir -p $BUILD_DIR'
            }
        }

        stage('Build') {
            steps {
                script {
                    if (params.PLATFORM == 'linux') {
                        sh './build-linux.sh'
                    } else if (params.PLATFORM == 'windows') {
                        bat 'build-windows.bat'
                    } else if (params.PLATFORM == 'macos') {
                        sh './build-macos.sh'
                    }
                }
            }
        }

        stage('Test') {
            when {
                expression { return params.RUN_TESTS }
            }
            steps {
                echo "Running tests..."
                sh './run-tests.sh'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            sh 'rm -rf $BUILD_DIR'
        }
    }
}
