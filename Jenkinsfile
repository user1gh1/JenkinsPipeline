pipeline {
    agent { 
        label 'Nginxserver' 
    }

    triggers {
        GenericTrigger(
            genericHeaderVariables: [
                [key: 'event', regexpFilter: '$.X-GitHub-Event']
            ], 
            genericVariables: [
                [key: 'ref', value: '$.ref'],
                [key: 'before', value: '$.before'],
                [key: 'after', value: '$.after'],
                [key: 'committer_name', value: '$.repository.owner.name'],
                [key: 'committer_email', value: '$.repository.owner.email'],
                [key: 'repo_slug', value: '$.repository.full_name'],
                [key: 'clone_url', value: '$.repository.url'],
                // [key: 'action', value: '$.action']
                // [key: '', value: '$.repository.owner.name'],
                //[key: 'url', values: '$.repository.url'],
            ],
                causeString: '$committer_name pushed $event to $clone_url referencing $commit',
    
                token: 'abc1235',
                tokenCredentialId: '',

    
                printContributedVariables: true,
                printPostContent: true,
                
//                regexpFilterText: '$.action',
//                regexpFilterExpression: 'opened',

                regexpFilterText: '$.*',
                regexpFilterExpression: '"action": "opened"' ,

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
                    echo $USR_VAR
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
