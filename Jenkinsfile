pipeline {
    agent { 
        label 'Nginxserver' 
    }

    triggers {
        GenericTrigger(
            genericVariables: [
                [key: 'ref', value: '$.ref'],
                [key: 'before', value: '$.before'],
                [key: 'after', value: '$.after'],
                [key: 'committer_name', value: '$.repository.owner.name'],
                [key: 'committer_email', value: '$.repository.owner.email'],
                [key: 'repo_slug', value: '$.repository.full_name'],
                [key: 'clone_url', value: '$.repository.url'],
                // [key: '', value: '$.repository.owner.name'],
                //[key: 'url', values: '$.repository.url'],
            ],
                //causeString: '$committer_name pushed to $clone_url referencing $commit',
                causeString: ''
                token: 'abc1235',
                tokenCredentialId: '',

    
                printContributedVariables: true,
                printPostContent: true,
                
                regexpFilterText: '$ref',
                regexpFilterExpression: '',
                pwd tmp:true
        )
    }

    stages {
        stage("Prepare") {
            steps {
                sh '''
                    pwd
                    ls -la
                    echo $committer_name
                    export USR_VAR="$committer_name"
                    sed -i "0,/WORLD/s//${USR_VAR:-WORLD}/" index.html
                    sleep 1
                    ls -la
                    mv index.html /var/www/html/
                '''
            }
        }

        stage("Reload Nginx") {
            steps {
                sh '''
                    echo $committer_name
                    echo "$committer_name"
                    sudo service nginx reload
                '''
            }
        }

        stage("Upload") {
            steps {
                sh '''
                    echo Uploading...
                    sleep 1
                '''
            }
        }
    }
}
