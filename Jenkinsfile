pipeline {
    agent {
        label 'nginx'
    }
    
    stages {
        stage('Look whats in here') {
            steps {
                script {
                    sh 'ls'
                }
            }
        }
        
        stage('List / contents') {
            steps {
                script {
                    sh 'ls -la /'
                }
            }
        }
        
        stage('Show Ip Address') {
            steps {
                script {
                    sh 'ip address'
                }
            }
        }
    }
    
}
