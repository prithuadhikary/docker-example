FROM openjdk:11
COPY target/docker-demo-0.0.1-SNAPSHOT.jar /usr/src/myapp/
WORKDIR /usr/src/myapp
ENTRYPOINT ["java", "-jar", "docker-demo-0.0.1-SNAPSHOT.jar"]