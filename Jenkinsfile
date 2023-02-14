pipeline {
    agent {
        node {
            label 'built-in'
        }
    }

    stages {
        stage('git-clone') {
            steps {
                git branch: 'J2EE', url: 'https://github.com/vish9488/onlinebookstore.git'
            }
        }
        stage ('build') {
            steps {
                sh 'mvn install -DskipTests'
            }
        }
        stage ('deploy') {
            steps {
                sh 'cp /var/lib/jenkins/workspace/deploy/target/*.war /root/tomcat9/webapps/book.war'
                sh 'bash /root/tomcat9/bin/startup.sh'
            }
        }
        stage ('deploy-s3') {
            steps {
                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'vish-12/', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'ap-south-1', showDirectlyInBrowser: false, sourceFile: 'target/onlinebookstore-0.0.1-SNAPSHOT.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'vish-12', userMetadata: []
            }
        }
    }
}
