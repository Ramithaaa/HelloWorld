pipeline {
    agent any
    environment {
        registry='huarami/helloapp'
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
        stage('Deploy') {
            steps {
                script {
                    kubernetesDeploy(configs: "deployment.yaml", "service.yaml",kubeconfigId:"kubernetes")
                }
            }
        }
    }   
}
