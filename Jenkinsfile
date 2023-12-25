pipeline {
    agent any

    tools {
        maven 'Maven'
    }

    stages {
        stage('Build Maven') {
            steps {
                script {
                    // Corrected the checkout step
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/SAIDAELOUARDI23/devops-springboot-automation']]])
                    bat 'mvn clean install'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t devops/springboot-backend .'
                }
            }
        }
        stage('Push Image To Hub') {
            steps {
                script {
                    bat 'docker login -u saida777 -p Pa171709@'
                    bat 'docker tag devops/springboot-backend saida777/ss:devops-springboot-backend'
                    bat 'docker push saida777/ss:devops-springboot-backend'
                }
            }
        }
    }
}
