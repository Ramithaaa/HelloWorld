pipeline {
    agent any
    environment {
        registry='huarami/pythonapp'
        registryCredential='dockerhub'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    dockerImage=docker.build registry
                }
            }
        } 
        stage ('Push to dockerhub') {
            steps {
                script {
                    docker.withRegistry('',registryCredential) {
                        dockerImage.push('v1')
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    kubernetesDeploy(configs: "deployment.yaml",kubeconfigId: "kubernetes")
                }
            }
        }
    }   
}
