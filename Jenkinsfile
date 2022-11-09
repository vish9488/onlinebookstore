pipeline {
    agent {
        node {
            label 'dev'
        }
    }
        stage('Build Artifact') {
            steps {
                 sh 'mvn clean install -DskipTests'
            }
        }
    }
}
