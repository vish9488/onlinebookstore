pipeline {
    agent {
        node {
            label 'built-in'
        }
    }
    stages {
        stage ('git-clone') {
            steps {
                git branch: 'J2EE', url: 'https://github.com/vish9488/onlinebookstore.git'
            }
        }
        stage ('build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
        stage ('publish') {
            steps {
                sh 'sudo cp -r /var/lib/jenkins/workspace/obs-deploy/target/onlinebookstore-0.0.1-SNAPSHOT.war /root/tomcat9/webapps/book.war'
                sh 'bash /root/tomcat9/bin/shutdown.sh'
                sh 'bash /root/tomcat9/bin/startup.sh'
            }
        }
    }
}
