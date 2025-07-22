# Stage 1: Build the application with Maven
FROM maven:3.8.7-jdk11 AS build  
#Use a Maven image with a suitable JDK version (e.g., JDK 11)
#Adjust '3.8.7-jdk11' to match your project's Java and Maven versions
WORKDIR /app
COPY pom.xml .
COPY src ./src
# Ensure 'target/maven-web-app.war' is the correct output path/name from your Maven build
RUN mvn clean package -DskipTests # Build the WAR file. -DskipTests is optional.

# Stage 2: Create a lightweight final image containing only the WAR
FROM alpine:latest # Or scratch, or a minimal JRE if your app needs it
LABEL maintainer="uday"

# Create a directory to store the WAR
RUN mkdir -p /app/dist

# Copy the WAR file from the build stage to the /app/dist directory in the final image
COPY --from=build /app/target/maven-web-app.war /app/dist/maven-web-app.war

# No EXPOSE or CMD needed here as this image only contains the built artifact.
# You would then typically use this image's WAR in a separate runtime environment.
