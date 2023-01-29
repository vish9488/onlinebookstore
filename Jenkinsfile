pipeline {
    agent any
    stages {
        stage ('git-clone') {
            steps {
                git branch: 'J2EE', url: 'https://github.com/vish9488/onlinebookstore.git'
            }
        }
        stage ('maven-build') {
            steps {
                sh 'mvn install -DskipTests'
            }
        }
        stage ('deploy-on-web') {
            steps {
                sh 'sudo cp -r /var/lib/jenkins/workspace/web-deploy/target/onlinebookstore-0.0.1-SNAPSHOT.war /mnt/tomcat9/webapps/book.war'
                sh 'sudo bash /mnt/tomcat9/bin/shutdown.sh'
                sh 'sudo bash /mnt/tomcat9/bin/startup.sh'
            }
        }
        stage ('move-to-s3') {
            steps {
                sh 'aws s3 rm s3://vish-97/war'
                sh 'aws s3 cp /var/lib/jenkins/workspace/web-deploy/target/onlinebookstore-0.0.1-SNAPSHOT.war s3://vish-97/war'

            }
        }
    }
}
