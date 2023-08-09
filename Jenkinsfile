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
    }   
}
