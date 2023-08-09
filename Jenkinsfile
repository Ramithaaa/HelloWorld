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
                    docker.build registry
                }
            }
        }

        stage('Push to Dockerhub') {
            steps{
                script {
                    docker.withRegistry("",registryCredential)
                }
            }
        }

        stage('Deploy to K8S') {
            steps {
                script {
                    kubernetesDeploy(configs:"deploysvc.yaml",kubeconfigId:"kubernetes")
                }
            }
        }
    }
}