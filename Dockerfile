FROM openjdk:8
EXPOSE 8080
ADD target/springboot-backend.jar springboot-backend.jar
ENTRYPOINT ["java","-jar","/springboot-backend.jar"]