FROM openjdk:17-jdk

COPY target/springboot-backend.jar .

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "springboot-backend.jar"]
