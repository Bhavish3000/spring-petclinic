# Stage 1: Build Stage

FROM maven:latest AS build

# Set metadata as described above
LABEL stage="Build stage"

# Installing java17 and git
RUN apt update && apt install -y openjdk-17-jdk git

ARG JAVA_HOME_PATH=/usr/lib/jvm/java-17-openjdk-amd64
# Set java Home variable
ENV JAVA_HOME=${JAVA_HOME_PATH}

# Copy the source code to the container from git
RUN git clone https://github.com/spring-projects/spring-petclinic.git

# Set the working directory
WORKDIR /spring-petclinic

# Package the application, skipping tests
RUN mvn clean package -DskipTests 

# Stage 2: Runtime Stage

FROM eclipse-temurin:17.0.14_7-jre-alpine-3.21

# Set metadata as described above
LABEL Project="spring-petclinic" \
      Description="This is an sample spring boot application \
which is used for lerning purpose" \
      Version="1.0"

# Create a non-root user and group
ARG user=bhavish
ARG group=spring
RUN addgroup -S ${group} && adduser -S -D ${user} -G ${group}

# Switch to the non-root user
USER ${user}

# Copy the JAR file from the build stage to the runtime stage
COPY --from=build --chown=${user}:${group} /spring-petclinic/target/spring-petclinic-3.4.0-SNAPSHOT.jar /app/spring-petclinic-3.4.0-SNAPSHOT.jar

# Set the working directory for the runtime stage
WORKDIR /app

# Expose port 8080 for the application
EXPOSE 8080

# Command to run the application
CMD ["java","-jar","/app/spring-petclinic-3.4.0-SNAPSHOT.jar"]