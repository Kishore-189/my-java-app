pipeline {
    agent any

    triggers {
        pollSCM('* * * * *') // Poll every minute
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Kishore-189/my-java-app.git', branch: 'master'
            }
        }
        stage('Build') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    def app = docker.build("my-java-app:${env.BUILD_ID}")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker stop my-java-app || true'
                    sh 'docker rm my-java-app || true'
                    sh 'docker run -d --name my-java-app -p 8081:8081 my-java-app:${env.BUILD_ID}'
                }
            }
        }
    }
}
