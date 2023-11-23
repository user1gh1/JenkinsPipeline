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
        
        stage('List Whoami') {
            steps {
                script {
                    sh 'whoami'
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

        stage('Copy And Reload Nginx') {
              steps {
                  script {
                      sh 'cp index.html /var/www/html'
                      sh 'sudo service nginx reload'
                  }
              }
        }
    }
    
}

