pipeline {
    agent any
    stages {
        stage ('git-clone') {
            steps {
                git branch: 'J2EE', url: 'https://github.com/vish9488/onlinebookstore.git'
            }
        }
        stage ('mvn-build') {
            steps {
                sh 'mvn install -DskipTests'
            }
        }
        stage ('depoly-war') {
            steps {
                sh 'sudo cp -r /var/lib/jenkins/workspace/install-git/target/onlinebookstore-0.0.1-SNAPSHOT.war /root/tomcat9/webapps/book.war'
                sh 'sudo chmod -R 777 /root/tomcat9/bin'
                sh 'bash /root/tomcat9/bin/startup.sh'
            }
        }
    }
}
