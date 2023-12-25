
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
=======
pipeline {
    agent { label 'Jenkins-Agent' }
    tools {
        jdk 'java17'
        maven 'Maven3'
    }
    environment {
	    APP_NAME = "register-app-pipeline"
            RELEASE = "1.0.0"
            DOCKER_USER = "saida777"
            DOCKER_PASS = 'dockerhub'
            IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
            IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
    }
    stages {
        stage("Cleanup Workspace") {
            steps {
                cleanWs()
            }
        }

        stage("Checkout from SCM") {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/SAIDAELOUARDI23/devops-springboot-automation'
            }
        }

        stage("Build Application") {
            steps {
                sh "mvn clean package"
            }
        }

        stage("Test Application") {
            steps {
                sh "mvn test"
            }
        }
         stage("SonarQube Analysis"){
           steps {
	           script {
		        withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token') { 
                        sh "mvn sonar:sonar"
		        }
	           }	
           }
       }
       stage("Quality Gate"){
           steps {
               script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'jenkins-sonarqube-token'
                }	
            }

        }
      stage("Build & Push Docker Image") {
            steps {
                script {
                    docker.withRegistry('',DOCKER_PASS) {
                        docker_image = docker.build "${IMAGE_NAME}"
                    }

                    docker.withRegistry('',DOCKER_PASS) {
                        docker_image.push("${IMAGE_TAG}")
                        docker_image.push('latest')
                    }
                }
            }

       }

    }
}

