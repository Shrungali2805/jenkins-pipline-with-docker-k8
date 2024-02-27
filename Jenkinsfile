pipeline {
    agent any
    stages {
        stage('Pull') {
            steps {
                echo "Successful pull from Git"
                git 'https://github.com/Shrungali2805/jenkins-pipline-with-docker-k8.git'
            }
        }
        stage('Build') {
            steps {
                echo "Building with Maven"
                sh 'mvn clean package'
            }
        }
        stage('creating tomcat image Tomcat') {
            agent{ 
             label 'docker'
            }
            steps {
                script {
                    sh '''cd /var/lib/jenkins/workspace/demo/
                    docker build -t shrungali2805/my-repo .
                    docker login 
                    docker push shrungali2805/my-repo'''
                }
            }
        }
        stage('build image on k8 ') {
            agent {
                 labels 'docker'
            }
            steps {
                script {
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
        stage('getting information') { 
            agent { 
                labels 'docker'

            }
            steps {
                script {
                    sh '''kubectl get pods -o wide 
                    kubectl get nodes -o wide 
                    kubectl get svc -o wide 
                    ls /var/lib/jenkins/workspace/demo/target/'''
                }
            }
        }
    }
} //update
