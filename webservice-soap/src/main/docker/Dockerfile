FROM tomcat:8.0.20-jre8
RUN rm /usr/local/tomcat/conf/tomcat-users.xml
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY webservice-soap-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/countries.war