pipeline {
    agent {
        node {
            label 'dev'
        }
    }
    stages {
        stage('Git Clone') {
            steps {
                git branch: 'J2EE', url: 'https://github.com/Shubhamvaishnavv/onlinebookstore.git'
           }
        }
        stage('Git Build') {
            steps {
                 sh 'mvn clean install -DskipTests'
            }
        }
    }
}
