FROM tomcat
COPY target/onlinebookstore-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/book.war
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
#changes apply
name=vishal
