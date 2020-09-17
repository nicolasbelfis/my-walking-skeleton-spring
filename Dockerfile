FROM maven:3.6.3-jdk-11 as build
WORKDIR /buildApp
COPY /src ./src
COPY pom.xml .
RUN mvn clean package

FROM adoptopenjdk/openjdk11:alpine-slim
ARG JAR_FILE=/target/my-walking-skeleton-0.0.1-SNAPSHOT.jar
WORKDIR /opt/app
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]