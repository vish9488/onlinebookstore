FROM tomcat
COPY target/onlinebookstore-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/book.war
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
#changes apply
<<<<<<< HEAD
x=10
=======
x=10
>>>>>>> d9a82841644c42dd89165ae3c252e0ed3aff4046
