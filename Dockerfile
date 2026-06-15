# Use official runtime Tomcat web server image configured with Java 11
FROM tomcat:9.0-jdk11-corretto

# Purge pre-packaged root layouts from Tomcat image webapps space
RUN rm -rf /usr/local/tomcat/webapps/struts-k8s-demo

# Copy Compiled .WAR file from local target folder into running container folder
COPY target/struts-k8s-demo.war /usr/local/tomcat/webapps/struts-k8s-demo.war

# Expose internal listening port configurations
EXPOSE 8080

# Start up Tomcat server application layer
CMD ["catalina.sh", "run"]
