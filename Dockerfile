# Use official runtime Tomcat web server image configured with Java 11
FROM tomcat:9.0-jdk11-corretto

# Purge pre-packaged root layouts from Tomcat image webapps space
RUN rm -rf /usr/local/tomcat/webapps/test_app

# Copy Compiled .WAR file from local target folder into running container folder
COPY target/test_app.war /usr/local/tomcat/webapps/test_app.war

# Expose internal listening port configurations
EXPOSE 8080

# Start up Tomcat server application layer
CMD ["catalina.sh", "run"]
