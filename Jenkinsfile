pipeline {
    agent any

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
                //[key: 'url', values: '$.repository.url'],
            ],
                causeString: '$committer_name pushed tag $tag to $clone_url referencing $commit',
    
                token: 'abc123',
                tokenCredentialId: '',

    
                printContributedVariables: true,
                printPostContent: true,
                
                regexpFilterText: '$ref',
                regexpFilterExpression: '^refs/tags/.*',
        )
    }

    stages {
        stage("Prepare") {
            steps {
                sh '''
                    echo git clone $clone_url
                    echo git checkout $commit
                    sleep 1
                '''
            }
        }

        stage("Build") {
            steps {
                sh '''
                    echo Validate that artifact version is $tag
                    echo Or, set artifact version to $tag, without committing it or pushing!
                    echo ./gradlew build
                    sleep 2
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
