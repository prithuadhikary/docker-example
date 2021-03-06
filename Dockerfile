FROM openjdk:11
ENV SPRING_PROFILES_ACTIVE=production
COPY target/docker-demo-0.0.2-SNAPSHOT.jar /usr/src/myapp/
WORKDIR /usr/src/myapp
ENTRYPOINT java -jar docker-demo-0.0.2-SNAPSHOT.jar -Dspring.profiles.active=$SPRING_PROFILES_ACTIVE