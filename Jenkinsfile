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
                [key: 'clone_url', value: '$.repository.url']
            ],
                causeString: '$committer_name pushed tag $tag to $clone_url referencing $commit',
    
                token: 'abc123',
                tokenCredentialId: '',

    
                printContributedVariables: true,
                printPostContent: true,
                
                regexpFilterText: '$ref',
                regexpFilterExpression: '^refs/tags/.*'
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

        stage("Email") {
            steps {
                script {
                    def subject = ""
                    def bodyText = ""
                    if (currentBuild.currentResult == 'SUCCESS') {
                        subject = "Released $tag in $repo_slug"
                        bodyText = """
                            Hi there!!
                            You pushed $tag in $clone_url and it is now released.
                            Version $tag was built from $commit
                            See job here: $BUILD_URL
                            See log here: $BUILD_URL/consoleText
                            """
                    } else {
                        subject = "Failed to release $tag in $repo_slug"
                        bodyText = """
                            Hi there!!
                            You pushed $tag in $clone_url and the release failed (${currentBuild.currentResult}).
                            See job here: $BUILD_URL
                            See log here: $BUILD_URL/consoleText
                            """
                    }
                    echo "Sending email with subject '$subject' and content:\n$bodyText"
                    // emailext subject: subject,
                    //     to: "$committer_email",
                    //     from: 'jenkins@company.com',
                    //     body: bodyText
                }
            }
        }
    }
}
