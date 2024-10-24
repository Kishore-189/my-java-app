FROM openjdk:17-jdk-slim
COPY my-java-app.jar /app/my-java-app.jar
ENTRYPOINT ["java", "-jar", "/app/my-java-app.jar"]
