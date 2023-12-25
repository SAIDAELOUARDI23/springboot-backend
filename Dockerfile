<<<<<<< HEAD
FROM openjdk:17-jdk

COPY target/springboot-backend.jar .

EXPOSE 8080

ENTRYPOINT["java","-jar","springboot-backend.jar"
=======
FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY /webapp/target/*.war /usr/local/tomcat/webapps
>>>>>>> 60596134f3fb52efee0f1bf85f61fc86396c6be4
