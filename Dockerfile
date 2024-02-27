# Use the official Tomcat image from Docker Hub
FROM tomcat:8.5.99-jdk21-corretto-al2

# Set the working directory inside the container
WORKDIR /usr/local/apache-tomcat-8.5.99/

# (Optional) Remove the default webapps directory
RUN rm -rf webapps/*

# Copy your WAR file into the webapps directory of Tomcat
COPY /var/lib/jenkins/workspace/demo/target/*.war webapps/


# (Optional) Expose the default Tomcat port
EXPOSE 8081

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
