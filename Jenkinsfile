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
                sh '''
                export KUBECONFIG=/var/lib/jenkins/.kube/config
                kubectl apply -f deployment.yaml
                '''
            }
        }

        stage('Verify') {
            steps {
                sh '''
                export KUBECONFIG=/var/lib/jenkins/.kube/config
                kubectl get pods
                '''
            }
        }
    }
}