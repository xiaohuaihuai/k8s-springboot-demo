FROM maven:3.5.4-jdk-8 AS mvnBuild
ADD ./src src/
ADD ./pom.xml pom.xml
RUN mvn clean package -Dmaven.test.skip=true

FROM java:8
VOLUME /tmp
COPY --from=mvnBuild target/k8s-springboot-demo-0.0.1-SNAPSHOT.jar k8s-springboot-demo.jar
ENTRYPOINT ["java","-jar","k8s-springboot-demo.jar"]
