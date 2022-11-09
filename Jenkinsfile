pipeline {
    agent {
        node {
            label 'dev'
        }
    }
    stages {
        stage('MVN build') {
            steps {
                 sh 'mvn clean install -DskipTests'
            }
        }
        stage('copy to s3') {
            steps {
                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'shubham0911', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'ap-south-1', showDirectlyInBrowser: false, sourceFile: '**/target/*.war', storageClass: 'STANDARD', uploadFromSlave: true, useServerSideEncryption: false]], pluginFailureResultConstraint: 'SUCCESS', profileName: 'S3-Artifact', userMetadata: []
            }
        }
        stage('Container-Deploy') {
            steps {
                sh 'docker stop container1'
                sh 'docker rm container1'
                sh 'docker build -t myimage .'
                sh 'docker run -itdp 8085:8080 --name container1 myimage'
            }
        }
    }
}
