pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/ahmedalaa-devops/wep_app_full-project.git'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t parallax-app:latest .'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
    sh '''
    export KUBECONFIG=$KUBECONFIG
    kubectl apply -f deployment.yaml
    '''
                }
            }
        }

        stage('Verify') {
            steps {
                sh 'kubectl get pods'
            }
        }
    }
}