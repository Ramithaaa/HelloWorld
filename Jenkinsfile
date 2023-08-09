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

        stage ('Push to Dockerhub') {
            steps {
                script {
                    docker.withRegistry("",registryCredential) {
                        dockerImage.push('v1')
                    }
                }
            }
        }

        stage ('Deploy to K8s') {
            steps {
                script {
                    kubernetesDeploy(configs:"deploysvc.yaml",kubeconfigId:"kubernetes")
                }
            }
        }

    }
}