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
            steps {
                script {
                    sh '''cp -r /var/lib/jenkins/workspace/demo/target/*.war /var/lib/jenkins/workspace/demo/
                    docker build -t shrungali2805/my-repo .
                    docker login 
                    docker push shrungali2805/my-repo'''
                }
            }
        }
        stage('build image on k8 ') {
            steps {
                script {
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
        stage('getting information') {
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
