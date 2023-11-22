pipeline {
    agent {nginx}
    
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
        
        stage('Change user to godlike') {
            steps {
                script {
                    echo "123"
                }
            }
        }
    }
    
}
