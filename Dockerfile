FROM maven:3.5.4-jdk-8 AS mvnBuild
ADD ./pom.xml pom.xml
ADD ./src src/
RUN mvn clean package -Dmaven.test.skip=true

FROM java:8
EXPOSE 8080
VOLUME /tmp
COPY --from=mvnBuild target/k8s-springboot-demo-0.0.1-SNAPSHOT.jar k8s-springboot-demo.jar
ENTRYPOINT ["java","-jar","k8s-springboot-demo.jar"]
