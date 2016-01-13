FROM java:8
VOLUME /tmp
ADD  webservice-soap-1.0-SNAPSHOT.jar pays.jar
RUN bash -c 'touch /pays.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/pays.jar"]