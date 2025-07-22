FROM maven:3.8.4-openjdk-11-slim AS build
MAINTAINER Uday
EXPOSE 8080
COPY target/maven-web-app.war /usr/local/tomcat/webapps/maven-web-app.war
